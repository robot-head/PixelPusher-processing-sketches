

import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;

private Random random = new Random();

DeviceRegistry registry;

int[][] colors = {
  {
    0, 255, 0
  }
  , 
  {
    255, 131, 6
  }
// You can add more colours here if you want:
, 
{
128, 0, 128
} 

};

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
int c = 0, d = 0;
int direction = 1, d_direction = 1;

void setup() {
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  colorMode(RGB, 255);
  size(640, 640);
  prepareExitHandler();
}

void draw() {
  int x=0;
  int y=0;
  if (testObserver.hasStrips) {   
    registry.startPushing();
    registry.setExtraDelay(0);
    registry.setAutoThrottle(true);  
    registry.setAntiLog(true);  
    int stripy = 0;
    List<Strip> strips = registry.getStrips();

    c += direction;

    if (c > 255) {
      direction=-direction;
      d+=d_direction;
    }
    if (c<1) {
      direction=-direction;
      d+=d_direction; 
    }
    
    if (d > colors.length || d < 0) {
       d_direction = -d_direction; 
    }
    
    
    int numStrips = strips.size();
    //println("Strips total = "+numStrips);
    if (numStrips == 0)
      return;
    for (int stripNo = 0; stripNo < numStrips; stripNo++) {
      int offset = (d+stripNo) % colors.length;
      color fillcol = color(colors[offset][0], colors[offset][1], colors[offset][2]);
      int nextoffset = (d+stripNo+1) % colors.length;
      color nextfillcol = color(colors[nextoffset][0], colors[nextoffset][1], colors[nextoffset][2]);
      
      fill(lerpColor(fillcol, nextfillcol, c/256.0));
      rect(0, stripNo * (height/numStrips), width/2, (stripNo+1) * (height/numStrips)); 
      fillcol = color(colors[offset][0], colors[offset][1], colors[offset][2]);
      fill(lerpColor(nextfillcol, fillcol, c/256.0));
      rect(width/2, stripNo * (height/numStrips), width, (stripNo+1) * (height/numStrips));
    }    


    int yscale = height / strips.size();
    for (Strip strip : strips) {
      int xscale = width / strip.getLength();
      for (int stripx = 0; stripx < strip.getLength(); stripx++) {
        x = stripx*xscale + 1;
        y = stripy*yscale + 1; 
        color c = get(x, y);

        strip.setPixel(c, stripx);
      }
      stripy++;
    }
  }
}

private void prepareExitHandler () {

  Runtime.getRuntime().addShutdownHook(new Thread(new Runnable() {

    public void run () {

      System.out.println("Shutdown hook running");

      List<Strip> strips = registry.getStrips();
      for (Strip strip : strips) {
        for (int i=0; i<strip.getLength(); i++)
          strip.setPixel(#000000, i);
      }
      for (int i=0; i<100000; i++)
        Thread.yield();
    }
  }
  ));
}

