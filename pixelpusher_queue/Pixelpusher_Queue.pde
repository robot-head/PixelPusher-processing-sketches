/* Pixelpusher Queue
 * This Processing 2.0 app allows to show simple moving images in multiple layers. It reads the image data 
 * in an array to save time in the scraping process. 
 * Written by @peterkling, powered by @LukeSix
 * 
 * Copyright: Free to use, copy, extend, and whatever you want.
 * 
 * Main Application file
 */

import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;
import java.io.*;

// CONFIG
// #######################################################

// board setting
int canvas_cols = 240; // breite des boards
int canvas_rows = 16; // höhe des boards (wird für bounce modus gebraucht)

// simulate
int simulate_scale = 4;
Boolean try_to_simulate = true;
boolean always_simulate = true;

// OBSERVER
// #######################################################

DeviceRegistry registry;
TestObserver testObserver;


// VARS
// #######################################################

ParallaxQueue queue = new ParallaxQueue(canvas_cols, canvas_rows, "queue.txt");
long lastTimestamp = 0;
String[][] backgrounds = {
    {"rainbow_v.png,0,0.4,endless","255*255*255"},
    {"rainbow.png,-0.4,0,endless","0*0*0"},
    {"fire.png,0.5,0.1,endless","255*255*255"},
    {"rain_1.png,0.2,-1.5,endless;rain_2.png,0.1,-0.3,endless","255*255*255"},
    {"welle_1.png,-1,0,endless;welle_2.png,-0.8,0,endless;welle_3.png,-0.4,0,endless","255*255*255"},
    {"cloud_2.png,-0.8,0,endless;cloud_3.png,-0.4,0,endless;cloud_4.png,0,0,endless","0*0*0"}
  };
String[] fonts = {
    "SonsieOne-Regular-16.vlw",
    "StencilStd-16.vlw"
  };


// SETUP
// #######################################################

void setup() {
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
  if (try_to_simulate || always_simulate) {
    size(canvas_cols*simulate_scale, canvas_rows*simulate_scale, P3D);
  } else {
    size(1,1);
  }
  
  queue.loadQueue();
  
}

// DRAW
// #######################################################

void draw() {
  queue.draw(registry, testObserver);
}

