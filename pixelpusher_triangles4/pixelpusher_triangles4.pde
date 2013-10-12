

import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;

import processing.core.*;
import java.util.*;

DeviceRegistry registry;

int stride = 240;

boolean ready_to_go = true;

TestObserver testObserver;



class ConfigHolder {
  float size;
  float step;
  float range;
  float hue_min;
  float hue_max;
  int height;
  int width;
};

ConfigHolder config;

class TrianglePoints {
  float x1, y1, 
  x2, y2, 
  x3, y3;

  public TrianglePoints(float x1, float y1, float x2, float y2, float x3, float y3) {
    this.x1 = x1;
    this.x2 = x2;
    this.x3 = x3;
    this.y1 = y1;
    this.y2 = y2;
    this.y3 = y3;
  }
  String toString() {
    return "["+this.x1+","+this.y1+"]"+
      "["+this.x2+","+this.y2+"]"+
      "["+this.x3+","+this.y3+"]";
  }
};

class Triangle {
  float center_x, center_y;
  TrianglePoints points;
  float hue, sat, bri;
  float random;
}

int rows;
int cols;

Triangle[][] triangles;

TrianglePoints pointsFor(float s, float cX, float cY, boolean flip) {
  float r = s/2;
  if (flip)
    return new TrianglePoints(cX-r, cY-r, cX+r, cY-r, cX, cY+r);
  else
    return new TrianglePoints(cX, cY-r, cX+r, cY+r, cX-r, cY+r);
}

float normalize(float x, float min, float max) {

  float range = max - min;

  if (x < min) x = range + x;
  if (x > max) x = x - range;

  return x;
}

void setup() {
  config = new ConfigHolder();

  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  registry.setAntiLog(true);
  registry.setAutoThrottle(true);

  config.size = 30;
  config.width = 240*3;
  config.height = 480;
  size(config.width, config.height, P3D);
  config.step = 1;
  config.range = 130;
  config.hue_min = 0;
  config.hue_max = 100;
  rows = int((config.height / config.size) + 1);
  cols = int(((config.width / config.size) * 2) + 1);
  colorMode(HSB, 100);
  noStroke();


  triangles= new Triangle[rows][cols];

  float leftHue = random(100);

  // initialize triangles
  for (int j=0; j<rows; j++) {
    triangles[j] = new Triangle[cols];

    for (int i=0; i<cols; i++) {
      // midpoint
      float cX = (i * (config.size/2));
      float cY = (j * config.size);
      boolean flip = (i+j) % 2 == 1;

      // base of the hue, going up from left to right;
      float baseHue = ((i/cols) * config.range);

      // now alter it
      float hue = baseHue +
        // add some jitter so all triangles are visible
      (flip ? -0.01 : 0.01) +
        // have it tilted diagonally, in proportion to the range
      ((j + ((random(1) < 0.5) ? -1 : 1)) * (config.range * 0.05));


      // mess with saturation and brightness
      float sat = 85;

      // range brightness from
      float bri = (random(100) / 3) + 50;

      Triangle t = new Triangle();
      t.center_x = cX;
      t.center_y = cY;
      t.hue = hue;
      t.sat = sat;
      t.bri = bri;
      t.points = pointsFor(config.size, cX, cY, flip);
      t.random = random(1);

      triangles[j][i] = t;
    }
  }
}

void draw() {
  // draw all triangles in turn
  for (int j=0; j<rows; j++) {
    for (int i=0; i<cols; i++) {
      Triangle t = triangles[j][i];
      TrianglePoints ps = t.points;

      //   println("Points: " + ps);

      t.hue = normalize(t.hue + config.step, config.hue_min, config.hue_max);
      //println("Hue " + t.hue+ " Sat "+t.sat+" Bri "+t.bri);
      if (true) {
        float radius = config.size * 2;
        float xDiff = Math.abs(mouseX - t.center_x);
        float yDiff = Math.abs(mouseY - t.center_y);
        if (xDiff < radius && yDiff < radius)
          fill(normalize(t.hue + 50, 0, 100), t.sat, t.bri);
        else
          fill(t.hue, t.sat, t.bri);
      } 
      else
        fill(t.hue, t.sat, t.bri);


      triangle(ps.x1, ps.y1, ps.x2, ps.y2, ps.x3, ps.y3);
    }
  }
  scrape();
}

void mousePressed() {
  // left mouse button flips direction
  if (mouseButton == LEFT)
    config.step *= -1;

  // right mouse button speeds it up
  else
    config.step += (config.step > 0 ? 0.5 : -0.5);
};


