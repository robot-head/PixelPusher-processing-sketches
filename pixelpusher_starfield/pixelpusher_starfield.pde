

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
int canvasH = 480;
TestObserver testObserver;

int numStars = 200;

int radius = 5;
float theta = 3.0;

class Star {
   public int x;
   public int y;
   public int z;
  
  public Star() {
     x=0;
     y=int(random(height));
     z=20+int(random(width-20)); 
  }
};

Star[] galaxy;

void setup() {
  size(canvasW, canvasH, P3D);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  registry.setAntiLog(true);
  //background(#000000);
  stroke(#ffffff);
  fill(#ffffff);
  galaxy = new Star[numStars];
  background(0);
  for (int i=0; i<numStars; i++)
    galaxy[i] = new Star();
}




void draw() {
  background(0);
  for (int i=0; i<numStars; i++) {
    ellipse(galaxy[i].x, galaxy[i].y, galaxy[i].z/120, galaxy[i].z/120);
    galaxy[i].x+=1+galaxy[i].z / 20;
    if (galaxy[i].x > width)
      galaxy[i] = new Star();
  }
  scrape();
}

void stop()
{
  super.stop();
}

