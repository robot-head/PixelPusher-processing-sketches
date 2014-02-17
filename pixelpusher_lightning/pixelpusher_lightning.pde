
// like sands through the hourglass so are the days.. blahblah
// by me


import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;

import processing.core.*;
import java.util.*;

DeviceRegistry registry;

int stride = 240;
boolean use_weighted_get = true;


boolean ready_to_go = true;
int lastPosition;
int canvasW = 480;
int canvasH = 480;
TestObserver testObserver;

int radius = 5;
float theta = 3.0;
int count = 0;

float x;
float y;
float diam;
int age = 0;



void setup() {
 size(canvasW, canvasH);
 registry = new DeviceRegistry();
 testObserver = new TestObserver();
 registry.addObserver(testObserver);
 registry.setAntiLog(true);
 registry.setAutoThrottle(true);
 frameRate(60);
}


void draw() {
  if (age == 0) {
   background(0);
 }

 if (age == 0 && random(100) > 99) {
   x=random(480);
   y=random(480);
   diam=random(480);
   fill(255);
   ellipse(x, y, diam, diam);
   age = int(diam / 15);
 }
 if (age > 0) {
   if (age % 2 == 0)
      background(0);
    else
      ellipse(x, y, diam, diam);
   age--;
 }
 scrape();
}


