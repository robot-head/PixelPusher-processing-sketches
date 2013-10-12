
// Automatic mapping generator for PixelPusher
// by jas@heroicrobot.com
//

import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;
import java.io.*;
import processing.core.*;
import processing.video.*;


DeviceRegistry registry;

Capture video;

PImage darkframe;
PImage lightframe;
PImage difference;

int w=800, h=600;

class Position {
  int x;
  int y;
  public Position(int ix, int iy) {
   this.x=ix;
   this.y=iy; 
  }
}

class Mapping {
  int strip;
  int pixel;
  int x;
  int y;
 public Mapping(int is, int ip, int ix, int iy) {
    this.strip = is;
    this.pixel = ip;
    this.x = ix;
    this.y = iy;
 } 
}

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

int current_strip;
int current_pixel;
int number_of_strips;
int length_of_strip;
color colour;

int colourIndex = 0;

ArrayList<Mapping> display_map;

public int chooseNextColour() {
   if (colourIndex > 1) {
       colourIndex = 0;
   }
   switch (colourIndex++) {
        case 1: return color(0, 0, 0);
        case 0: return color(255, 255, 255);
        default:  return color(127, 127, 0);
   } 
}

ArrayList<Position> scanForLights(PImage d) {
   color c;
   ArrayList<Position> hits = new ArrayList<Position>();
   
   for (int y=0; y<d.height; y++) {
    for (int x=0; x<d.height; x++) {
         c = d.get(x,y);
         if (brightness(c) > 150)
           hits.add(new Position(x,y));
      }
   } 
   return hits;
}

void setup() {
  size(w, h);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  background(0);
  colorMode(RGB, 255, 255, 255, 255);
  colour = chooseNextColour();
  rectMode(CORNERS);
  String[] cameras = Capture.list();
  println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
  
  video = new Capture(this, cameras[3]);
  video.start();
  darkframe=createImage(w, h, RGB);
  lightframe= createImage(w,h, RGB);
  difference= createImage(w, h, RGB);
  current_pixel = 0;
  current_strip = 0;
  display_map = new ArrayList<Mapping>();
}

void draw() {
  
  if (current_pixel == 0 && current_strip == 0) {
    fill(0,0,0,255);
    noStroke();
    rect(0,0,w,h);
  }
   
   fill(255,255,255,255);

   // scrape for the strips
   if (testObserver.hasStrips) {
        //registry.setExtraDelay(0);
        registry.startPushing();
        registry.setAutoThrottle(true);
 
         
         List<Strip> strips = registry.getStrips();
         number_of_strips = strips.size();
         if (current_strip >= number_of_strips) {
           current_strip = 0;
           println("Off of strips.");
         }
         Strip current_strip_o = strips.get(current_strip);
         length_of_strip = current_strip_o.getLength();
         if (current_pixel >= length_of_strip) {
           current_pixel = 0;
           println("Off of strip.");
         }
         current_strip_o.setPixel(colour, current_pixel);
         
         // if we're at the beginning of a dark frame, take a new dark frame
         if (current_strip == 0 && current_pixel == 0) {
            if (colour == color(0,0,0)) {
              // we were doing the dark frame
              while (!video.available()) {
                Thread.yield();
              }
              video.read();
              darkframe.set(0,0, video); 
            }
            colour = chooseNextColour();
         }
        
        
        if (colour == color(255,255,255)) {
           while (!video.available()) {
             Thread.yield();
           }
           video.read();
           lightframe.set(0,0, video);
           
           difference.set(0,0, video);
           difference.blend(darkframe, 0, 0, w, h, 0, 0, w, h, SUBTRACT);
           
           ArrayList<Position> hits = scanForLights(difference);
           
           // compute the centroid
           int cx, cy, n;
           cx = cy = n = 0;
           if (hits.size() > 0) {
             for (Position p : hits) {
                 n++;
                 cx += p.x;
                 cy += p.y;
             }

             cx /= n;
             cy /= n;
             println("For strip ("+current_strip+","+current_pixel+") centroid is ("+cx+","+cy+")");
             display_map.add(new Mapping(current_strip, current_pixel, cx, cy));
             point(cx, cy);
           }
        }
        // turn off the pixel we just did
        current_strip_o.setPixel(color(0,0,0), current_pixel);
        
        // move on to the next
        current_pixel++;
        if (current_pixel >= length_of_strip) {
          current_pixel = 0;
          current_strip++;
       
        if (current_strip == number_of_strips) {
          try {
          OutputStream saveout = createOutput("Mapping.txt");
          PrintStream ps = new PrintStream(saveout);
           for (Mapping m : display_map) {
              ps.println("("+m.strip+","+m.pixel+") -> ("+m.x+","+m.y+")");
           } 
           ps.close();
           saveout.close();
          } catch (IOException ioe) {
             ioe.printStackTrace(); 
          }
        }
      } 
    }
}

