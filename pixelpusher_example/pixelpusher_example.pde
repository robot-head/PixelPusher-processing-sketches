
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

void setup() {
 size(640, 480, P2D); 

 registry = new DeviceRegistry();
 testObserver = new TestObserver();
 registry.addObserver(testObserver);
  
 colorMode(RGB, 255);
}

void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  if (mouseX < width / 3)
    fill(255,0,0);
  if (mouseX > width / 3 && mouseX < (2*(width/3)))
    fill(0, 255, 0);
  if (mouseX > (2*(width/3)))
    fill(0,0,255);
    
  noStroke();
  ellipse(mouseX, mouseY, 60, 60);
  
  if (testObserver.hasStrips) {
        registry.startPushing();
        registry.setAutoThrottle(true);
        registry.setAntiLog(true);
        int stripy = 0;
        List<Strip> strips = registry.getStrips();
        
        if (strips.size() > 0) {
          int yscale = height / strips.size();
          for(Strip strip : strips) {
            int xscale = width / strip.getLength();
            for (int stripx = 0; stripx < strip.getLength(); stripx++) {
                color c = get(stripx*xscale, stripy*yscale);
            
                strip.setPixel(c, stripx);
             }
            stripy++;
          }
        }
    }
}

