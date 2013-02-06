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

boolean ready_to_go = false;
int lastPosition;
int canvasW = 48 * 5;
int canvasH = 240 * 4;
int baseLine = 700;
int sampleCount = 0;
int spriteW = canvasW;
int spriteH = canvasW;
int scrollAmount = 4;
float specScale = 4.0;

float lowest = 255.0;
float highest = 0.0;

TestObserver testObserver;
ControlP5 gui;
ControlFrame controlwindow;

// Images
int numSprites = 10;
PImage[] sprites;

BeatListener beatListener;
BeatDetect beatDetector;

ControlFrame addControlFrame(String theName, int theWidth, int theHeight) {
  Frame f = new Frame(theName);
  ControlFrame p = new ControlFrame(this, theWidth, theHeight);
  f.add(p);
  p.init();
  f.setTitle(theName);
  f.setSize(p.w, p.h);
  f.setLocation(100, 100);
  f.setResizable(false);
  f.setVisible(true);
  return p;
}


// an array of info objects describing all of 
// the mixers the AudioSystem has. we'll use
// this to populate our gui scroll list and
// also to obtain an actual Mixer when the
// user clicks on an item in the list.
Mixer.Info[] mixerInfo;

public class ControlFrame extends PApplet {

  int w, h;

  int abc = 100;

  public void controlEvent(ControlEvent theEvent) {
    ready_to_go = false;
    int mixerIndex = (int)theEvent.controller().value();

    println("User chose " + theEvent.controller().label());
    println("Using mixer info " + mixerInfo[mixerIndex].getName());

    Mixer mixer = AudioSystem.getMixer(mixerInfo[mixerIndex]);

    if ( jingle != null )
    {
      jingle.close();
      minim.stop();
      minim=new Minim(this);
    }

    minim.setInputMixer(mixer);
    println("Set input mixer.");

    jingle = minim.getLineIn(Minim.STEREO, 512, 44100, 16);
    fftLog = new FFT(jingle.bufferSize(), jingle.sampleRate());
    beatDetector = new BeatDetect(jingle.bufferSize(), jingle.sampleRate());    
    beatDetector.setSensitivity(3000);  
    beatListener = new BeatListener(beatDetector, jingle);
    fftLog.window(FFT.HAMMING);
    println("Started FFT.");
    ready_to_go = true;
  }


  public void setup() {
    size(w, h);
    frameRate(30);
    mixerInfo = AudioSystem.getMixerInfo();
    gui = new ControlP5(this);
    for (int i = 0; i < mixerInfo.length; i++)
    {
      controlP5.Button b = gui.addButton("item"+i, i);
      b.setLabel(mixerInfo[i].getName());
      b.setPosition(5, i*20);
      b.setSize(480, 19);
    }
  }

  public void draw() {
    background(abc);
  }

  private ControlFrame() {
  }

  public ControlFrame(Object theParent, int theWidth, int theHeight) {
    parent = theParent;
    w = theWidth;
    h = theHeight;
  }


  public ControlP5 control() {
    return cp5;
  }


  ControlP5 cp5;
  Object parent;
}


void setup() {
  size(canvasW, canvasH);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  background(0);
  sprites = new PImage[numSprites];
  for (int i = 0; i < sprites.length; i++) {
    sprites[i] = loadImage(str(i) + ".png");
  }

  //size(640, 480);

  minim = new Minim(this);
  controlwindow = addControlFrame("controlwindow", 480, 280);
}




void draw() {

  if (ready_to_go) {
    fftLog.forward(jingle.mix);
    float xdispscale = ((float)width / (float)(fftLog.specSize()/specScale));
    //ellipseMode(CENTER);
    noSmooth();
    noStroke();
    colorMode(HSB, 255);
    fill(color(0, 0, 0, 1));
    rectMode(CORNER);
    rect(0, 0, width, height);

    double tics_per_sample = 255.0 / (double) (fftLog.specSize()/specScale);


    for (int i = 0; i < (fftLog.specSize()/specScale); i++) { 

      float amp = (float)Math.log10((fftLog.getBand(i)*3000.0));
      
      if (amp < 0)
        amp = lowest;
      
      lowest = (amp < lowest) ? amp : lowest;
      highest = (amp > highest) ? amp : highest;
      
      

      float h = (float)(i * tics_per_sample);
      float s = 255;
      float b = map(amp, lowest, highest, 0.0, 255.0);
      //float a = amp;
     // println(lowest+" : "+ highest+" : "+ amp +" : "+ b);

      float xpos = xdispscale * i;
      fill(color(h, s, b, 255));
      rect(xpos, height-(scrollAmount+1), xdispscale, (float) scrollAmount+1);
    }

    // scroll the window downwards a little.
    osb = get();
    set(0, -scrollAmount, osb);

    if (beatDetector != null) {
      if (beatDetector.isKick()) {
        tint(0, 255, 255);
        image(sprites[int(random(0, numSprites))], random(0, canvasW - spriteW), canvasH - spriteH, spriteW, spriteH);      
      } 
      if (beatDetector.isHat()) {
        tint(64, 255, 255);
        image(sprites[int(random(0, numSprites))], random(0, canvasW - spriteW), canvasH - spriteH, spriteW, spriteH);      
      } 
      if (beatDetector.isSnare()) {
        tint(124, 255, 255);
        image(sprites[int(random(0, numSprites))], random(0, canvasW - spriteW), canvasH - spriteH, spriteW, spriteH);      
      }
    } 
    scrape();
  }
}

void stop()
{
  jingle.close();
  super.stop();
}

