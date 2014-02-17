
// Example of how to drive high CRI strips without
// using the library support for them.
//
// Included as it serves as a description of the strip
// architecture, rather than for actual use.  Please use
// strip.setRGBOW(true) instead of doing it this way!
//
//  - jas.

import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;

private Random random = new Random();

DeviceRegistry registry;


class TestObserver implements Observer {
  public boolean hasStrips = false;
  public void update(Observable registry, Object updatedDevice) {
        println("Registry changed!");
        if (updatedDevice != null) {
          println("Device change: " + updatedDevice);
        }
        this.hasStrips = true;
    }
}

TestObserver testObserver;
int c = 0;

void setup() {
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  colorMode(HSB, 100);
  size(640, 640);
}

void draw() {
  int x=0;
  int y=0;
  if (testObserver.hasStrips) {   
        registry.startPushing();
        registry.setExtraDelay(0);
        registry.setAutoThrottle(true);    
        int stripy = 0;
        List<Strip> strips = registry.getStrips();
        Pixel c = new Pixel((byte) 255, (byte) 255, (byte) 255);
        Pixel o = new Pixel((byte) 255, (byte) 255, (byte) 255);
        Pixel w = new Pixel((byte) 255, (byte) 255, (byte) 255);
        for(Strip strip : strips) {
          int xscale = width / strip.getLength();
          for (int stripx = 0; stripx < strip.getLength(); stripx+=6) {
              strip.setPixel(c, stripx);
              strip.setPixel(o, stripx+1);
              strip.setPixel(w, stripx+2);
              strip.setPixel(c, stripx+3);
              strip.setPixel(w, stripx+4);
              strip.setPixel(o, stripx+5);
           }
          stripy++;
        }
      }
}

