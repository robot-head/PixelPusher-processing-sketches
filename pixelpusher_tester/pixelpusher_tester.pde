// Test program for PixelPusher
// by jas@heroicrobot.com
//


import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;
import processing.core.*;

DeviceRegistry registry;

int lastPosition;
int canvasW = 1024;
int canvasH = 600;
int stride = 240;

class TestObserver implements Observer {
  public boolean hasStrips = false;
  public void update(Observable registry, Object updatedDevice) {
        println("Registry changed!");
        if (updatedDevice != null) {
          println("Device change: " + updatedDevice);
        }
        this.hasStrips = true;
    }
};

TestObserver testObserver;

float x=0,y=0;
color colour;

int colourIndex = 0;
boolean testMode = false;
int intensity = 255;

color chooseNextColour() {
   if (colourIndex > 10) {
       colourIndex = 0;
       testMode = !testMode;   
   }
   switch (colourIndex++) {
        case 0: return color(255, 0, 0);
        case 1: return color(0, 255, 0);
        case 2: return color(0, 0, 255);
        case 3: return color(127, 0, 0);
        case 4: return color(0, 127, 0);
        case 5: return color(0, 0, 127);
        case 6: return color(255, 255, 255);
        case 7: return color(127, 127, 127);
        case 8: return color(63, 63, 63);
        case 9: return color(10, 10, 10);
        case 10:  return color(127, 127, 0);
        default:  return color(127, 127, 0);
   } 
}

void setup() {
  size(canvasW, canvasH);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  background(0);
  colorMode(RGB, 255, 255, 255, 255);
  colour = chooseNextColour();
  rectMode(CORNER);

}


void draw() {
    
   fill(0,0,0);
   rect(0, 0, width, height);
   noStroke();
   fill(colour);
   // scrape for the strips
   if (testObserver.hasStrips) {
        registry.setExtraDelay(0);
        registry.startPushing();
 
         int stripy = 0;
         List<Strip> strips = registry.getStrips();
         int y_scale = height / (strips.size());
         if (!testMode) {
           rect(x, y, width / 240, y_scale);
         } else {
            if ((intensity-=1) > 0) {
              fill(colour, intensity);
            } else {
              intensity = 255;
            }
            rect(0, 0, width, height);
         }
         if ((x+=16) > width) {
           x=0; y+=y_scale;
         }
         if (y>height) {
            y = 0;
            colour = chooseNextColour(); 
         }
        

  
        // for every strip:
        int currenty = 0;
        for(Strip strip : strips) {
          int strides_per_strip = strip.getLength() / stride;

          int xscale = width / stride;
          int yscale = height / (strides_per_strip * strips.size());
          
          // for every pixel in the physical strip
          for (int stripx = 0; stripx < strip.getLength(); stripx++) {
              int xpixel = stripx % stride;
              int stridenumber = stripx / stride; 
              int xpos,ypos; 
              
              if ((stridenumber & 1) == 0) { // we are going left to right
                xpos = xpixel * xscale; 
                ypos = ((stripy*strides_per_strip) + stridenumber) * yscale;
             } else { // we are going right to left
                xpos = (stride-xpixel) * xscale;
                ypos = ((stripy*strides_per_strip) + stridenumber) * yscale;               
             }
             
              color c = get(xpos, ypos);
              strip.setPixel(c, stripx);
             
           }
          stripy++;
        }
    }
}


