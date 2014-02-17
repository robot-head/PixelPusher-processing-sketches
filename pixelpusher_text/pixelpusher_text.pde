

import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;

import processing.core.*;
import java.util.*;

DeviceRegistry registry;

int stride = 240;
boolean use_weighted_get = true;

boolean ready_to_go = true;

int canvasW = 480;
int canvasH = 16;
TestObserver testObserver;

int numStars = 1;

int radius = 5;
float theta = 3.0;

class Star {
   public int x;
   public int y;
   public int z;
   public color c;
   public String starText;
  
  public Star() {
     x=580;
     y= height-2;//int(random(height));
     z=20+int(random(width-20));
     c = color(random(100), 100, 100);
     
     switch(int(random(5))) {
       case 0: starText = "ORD Camp 2014";
               break;
       case 1: starText = "PUSHING PIXELS AND TAKING NAMES";
               break;
       case 2: starText = "HACK ME, I LIKE IT";
               break;
       case 3: starText = "OH HAI!  ORD CAMP 2014";
               break;
       case 4: starText = "so led.  much pixel.  wow ord camp.";
     }
  }
};

Star[] galaxy;
PFont myFont;

void setup() {
  size(canvasW, canvasH, P3D);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  registry.setAntiLog(true);
  myFont = createFont("Speccy", 16);
  textFont(myFont);
  textSize(16);
  
  //background(#000000);
  stroke(#ffffff);
  fill(#ffffff);
  colorMode(HSB,100,100,100,100);
  galaxy = new Star[numStars];
  background(0);
  for (int i=0; i<numStars; i++)
    galaxy[i] = new Star();
}




void draw() {
  //background(0);
  noStroke();
  fill(#000000,25);
  rectMode(CORNERS);
  rect(0,0,width, height);
  for (int i=0; i<numStars; i++) {
    fill(galaxy[i].c);
    text(galaxy[i].starText, galaxy[i].x, galaxy[i].y);
    //ellipse(galaxy[i].x, galaxy[i].y, galaxy[i].z/60, galaxy[i].z/60);
    galaxy[i].x-=1+galaxy[i].z / 160;
    if (galaxy[i].x < -580)
      galaxy[i] = new Star();
  }
  scrape();
}

void stop()
{
  super.stop();
}

