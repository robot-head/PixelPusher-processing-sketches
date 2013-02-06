// FFT for PixelPusher
// by jas@heroicrobot.com
//
// refactored by Matt Stone
// evil@heroicrobot.com
//
// then universally remonstered by jas again
//
// vaguely based on
//
// Fancy FFT of the song
// Erin K 09/20/08
// RobotGrrl.com
// ------------------------
// Based off the code by Tom Gerhardt
// thomas-gerhardt.com
import codeanticode.syphon.*;
import hypermedia.net.*;
import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import javax.sound.sampled.*;

import java.awt.Frame;
import java.awt.BorderLayout;

import processing.core.*;
import ddf.minim.analysis.*;
import ddf.minim.*;
import controlP5.*;
import java.util.*;

DeviceRegistry registry;

AudioInput jingle;
FFT fftLog;
Minim minim;
PImage osb;
SyphonClient client;
PGraphics canvas;

boolean ready_to_go = true;
int lastPosition;
int canvasW = 48 * 5;
int canvasH = 240 * 4;
int baseLine = 700;
int sampleCount = 0;
int spriteW = canvasW-10;
int spriteH = canvasW-10;
int scrollAmount = 4;
float specScale = 4.0;

float lowest = 255.0;
float highest = 0.0;

TestObserver testObserver;

// Images
int numSprites = 10;
PImage[] sprites;

BeatListener beatListener;
BeatDetect beatDetector;
boolean useBeats;
boolean useFft;
boolean fftAtTop;
boolean randomPixels;
boolean useCircles;
boolean syphonScrape = true;
int randomPixelColor;
boolean useRandomPixelColor;
int loadSprite;
char spriteName; 
int rot;

HashMap<String, PImage> spriteMap;

// an array of info objects describing all of 
// the mixers the AudioSystem has. we'll use
// this to populate our gui scroll list and
// also to obtain an actual Mixer when the
// user clicks on an item in the list.
Mixer.Info[] mixerInfo;




void setup() {
  size(canvasW, canvasH, P3D);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  background(0);
  sprites = new PImage[numSprites];
  for (int i = 0; i < sprites.length; i++) {
    sprites[i] = loadImage(str(i) + ".png");
  }

  //size(640, 480);
  useFft = true;
  fftAtTop = false;
  randomPixels = false;
  useCircles = false;
  randomPixelColor = 0;
  useRandomPixelColor = false;
  spriteName = ' ';
  spriteMap = new HashMap<String, PImage>();
  rot = 0;
  client = new SyphonClient(this, "Modul8", "Main View");
}




void draw() {

  if (ready_to_go) {
    if (syphonScrape) {
      if (client.available()) {
        canvas = client.getGraphics(canvas);
        image(canvas, 0, 0, width, height);    
      }  
    }
    scrape();
  }
}

void stop()
{
  super.stop();
}

void keyTyped() {
  if (key == 'b') {
    useBeats = !useBeats;
    return;
  }
  if (key == 'v') {
    useFft = !useFft;
    return;
  }
  if (key == 'c') {
    fftAtTop = !fftAtTop;
    return;
  }
  if (key == 'n') {
    scrollAmount = -scrollAmount;
    return;
  }
  if (key == ',') {
    scrollAmount--;
    return;
  }
  if (key == '.') {
    scrollAmount++;
    return;
  }
  if (key == 'x') {
    randomPixels = !randomPixels;
    return;
  }
  if (key == '=') {
    useCircles = !useCircles;
    return;
  }
  if (key == 'z') {
    useRandomPixelColor = !useRandomPixelColor;
    return;
  }
  if (key == 'k') {
    randomPixelColor--;
    return;
  }
    if (key == 'l') {
    randomPixelColor++;
    return;
  }
  if (key == '[') {
    randomPixelColor = randomPixelColor + 10;
    return;
  }
    if (key == ']') {
     randomPixelColor = randomPixelColor - 10;
    return;
  }
  if (key == '/') {
    fill(color(0, 0, 0, 255));
    rect(0, 0, canvasW, canvasH);
    return;
  }
  if (key == '0') {
    syphonScrape = !syphonScrape;
  }
  spriteName = key;
}
