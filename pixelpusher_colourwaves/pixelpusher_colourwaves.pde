

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
int canvasH = 32;
float phase = 0;
TestObserver testObserver;
color pixels[][] = new color[480][32];

float SLOW_COLOR_ADJUST = 0.02;
float DISCON_CHANCE = 0.001;
//float DISCON_JUMP = 0.15;

void setup() {
  size(canvasW, canvasH, P3D);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  registry.setAntiLog(true);
  //background(#000000);
  // stroke(#ffffff);
  noStroke();
  fill(#ffffff);
  rectMode(CORNER);
  background(0);
  frameRate(60);
  fillPixels();

}

void fillPixels() {
  color column = color(random(255), random(255), random(255));
  for(int i = 0; i < canvasW; i++){
    for(int j = 0; j< canvasH; j++){
      if(i == 0) {
        pixels[i][j] = column;
      } else {
        pixels[i][j] = pixels[i - 1][j];
      }
    }
  }
}

void adjustPixels() {
  color adjustedRow = adjustPixel(pixels[0][0]);
  for(int i = canvasW - 1; i > -1; i--){
    for(int j = 0; j< canvasH; j++){
      if(i == 0){
        pixels[i][j] = adjustedRow;
      } else {
        pixels[i][j] = pixels[i - 1][j];
      }
    }
  }
}

color adjustPixel(color input) {
  if(random(1) > DISCON_CHANCE) { // 95% of slight adjust
  return color(adjustColor(red(input)), adjustColor(green(input)), adjustColor(blue(input)));
  } else {
    return color(random(255), random(255), random(255));
  }
}

int adjustColor(float floatInput) {
  int input = int(floatInput);
  int sign = 1 * random(1) > 0.5 ? -1 : 1;
  int adjust = int(255 * random(SLOW_COLOR_ADJUST));
  return input + (sign * adjust);
}

void draw() {
  background(0);
  for(int i = 0; i < canvasW; i++){
    for(int j = 0; j< canvasH; j++){
      stroke(pixels[i][j]);
      point(i,j);
    }
  }
  adjustPixels();
  scrape();
}

void stop()
{
  super.stop();
}

