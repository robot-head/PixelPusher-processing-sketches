
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
int canvasW = 240;
int canvasH = 240;
TestObserver testObserver;

int radius = 5;
float theta = 3.0;
int count = 0;
Calendar cal;

void setup() {
 size(canvasW, canvasH);
 registry = new DeviceRegistry();
 testObserver = new TestObserver();
 registry.addObserver(testObserver);
 registry.setAntiLog(true);
 registry.setAutoThrottle(true);
 frameRate(60);
}


color[] sky = { #000000, #000000, #5F5C83, #FF9008, #D89A7D, #FCFCF5,
                #FFFFFF, #FFFCE8, #FAE088, #FC0352, #5F5C83, #000000 };
                
float intermediate = 0;

void draw() {
 cal = Calendar.getInstance();
 cal.getTime();

 count = cal.get(Calendar.HOUR_OF_DAY)/2;
 intermediate = cal.get(Calendar.MINUTE)/60.0;

 color nextColor = sky[(count+1) % sky.length];

 background(lerpColor(sky[count], nextColor, intermediate));
 scrape();
}


