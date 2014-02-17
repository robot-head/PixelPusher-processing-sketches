

import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;

private Random random = new Random();

DeviceRegistry registry;
ColorPicker cp;

int[][] colors = {
      {127, 0, 0},
      {0, 127, 0},
      {0, 0, 127}
  };

  public Pixel generateRandomPixel() {
    //return new Pixel((byte)(random.nextInt(scaling)),(byte)(random.nextInt(scaling)),(byte)(random.nextInt(scaling)));
    //return new Pixel((byte)(15), (byte)0, (byte)0);
    int[] colour = colors[random.nextInt(colors.length)];
    return new Pixel((byte)colour[0], (byte)colour[1], (byte)colour[2]);
  }

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
  
  size( 500, 500 );
  frameRate( 30 );
  registry.setAntiLog(true);
  cp = new ColorPicker( 10, 10, 400, 400, 255 );
}

void draw() {
  int x=0;
  int y=0;
  cp.render();
  if (testObserver.hasStrips) {   
        registry.startPushing();
        registry.setAutoThrottle(true);    
        int stripy = 0;
        List<Strip> strips = registry.getStrips();
      
        int numStrips = strips.size();
       // println("Strips total = "+numStrips);
        if (numStrips == 0)
           return;

        for(Strip strip : strips) {
          // Uncomment this for the high-CRI strips.
          //strip.setRGBOW(true);
          for (int stripx = 0; stripx < strip.getLength(); stripx++) {
              strip.setPixel(cp.c, stripx);
           }
          stripy++;
        }
      }
}

public class ColorPicker 
{
  int x, y, w, h, c;
  PImage cpImage;
  
  public ColorPicker ( int x, int y, int w, int h, int c )
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    
    cpImage = new PImage( w, h );
    
    init();
  }
  
  private void init ()
  {
    // draw color.
    int cw = w - 60;
    for( int i=0; i<cw; i++ ) 
    {
      float nColorPercent = i / (float)cw;
      float rad = (-360 * nColorPercent) * (PI / 180);
      int nR = (int)(cos(rad) * 127 + 128) << 16;
      int nG = (int)(cos(rad + 2 * PI / 3) * 127 + 128) << 8;
      int nB = (int)(Math.cos(rad + 4 * PI / 3) * 127 + 128);
      int nColor = nR | nG | nB;
      
      setGradient( i, 0, 1, h/2, 0xFFFFFF, nColor );
      setGradient( i, (h/2), 1, h/2, nColor, 0x000000 );
    }
    
    // draw black/white.
    drawRect( cw, 0,   30, h/2, 0xFFFFFF );
    drawRect( cw, h/2, 30, h/2, 0 );
    
    // draw grey scale.
    for( int j=0; j<h; j++ )
    {
      int g = 255 - (int)(j/(float)(h-1) * 255 );
      drawRect( w-30, j, 30, 1, color( g, g, g ) );
    }
  }

  private void setGradient(int x, int y, float w, float h, int c1, int c2 )
  {
    float deltaR = red(c2) - red(c1);
    float deltaG = green(c2) - green(c1);
    float deltaB = blue(c2) - blue(c1);

    for (int j = y; j<(y+h); j++)
    {
      int c = color( red(c1)+(j-y)*(deltaR/h), green(c1)+(j-y)*(deltaG/h), blue(c1)+(j-y)*(deltaB/h) );
      cpImage.set( x, j, c );
    }
  }
  
  private void drawRect( int rx, int ry, int rw, int rh, int rc )
  {
    for(int i=rx; i<rx+rw; i++) 
    {
      for(int j=ry; j<ry+rh; j++) 
      {
        cpImage.set( i, j, rc );
      }
    }
  }
  
  public void render ()
  {
    image( cpImage, x, y );
    if( mousePressed &&
  mouseX >= x && 
  mouseX < x + w &&
  mouseY >= y &&
  mouseY < y + h )
    {
      c = get( mouseX, mouseY );
    }
    fill( c );
    rect( x, y+h+10, 20, 20 );
  }
}
