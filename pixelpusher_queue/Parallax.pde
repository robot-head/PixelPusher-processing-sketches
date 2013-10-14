/* Pixelpusher Queue
 * This Processing 2.0 app allows to show simple moving images in multiple layers. It reads the image data 
 * in an array to save time in the scraping process. 
 * Written by @peterkling, powered by @LukeSix
 * 
 * Copyright: Free to use, copy, extend, and whatever you want.
 * 
 * Parallax.pde - Allows to stack images on top of the other
 */


class ParallaxImage {
  public ImageArray image;
  
  ParallaxImage(ImageArray image, float moveX, float moveY, String moveMode) {
    this.image = image;
    
    this.image.moveX = moveX;
    this.image.moveY = moveY;
    this.image.moveMode = moveMode;
  }
  
  public void setMoveX(float value) {
    this.image.moveX = value;
  }
  public void setMoveY(float value) {
    this.image.moveY = value;
  }
  
  public void setMoveMode(String value) {
    this.image.moveMode = value;
  }
  
  color getMovedPixel(int x, int y) {
    return this.image.getMovedPixel(x,y);
  }
    
}



class Parallax {
 
 ParallaxImage images[] = new ParallaxImage[10]; 
 
 private int image_cnt = 0;
 
 private int canvas_cols;
 private int canvas_rows;
 public int playtime = 100;
  
  
 Parallax(int cols, int rows) {
   canvas_cols = cols;
   canvas_rows = rows;
 } 
 
 
 void addImage(ParallaxImage image) {
   images[image_cnt] = image;
   image_cnt++;
  }

 void addImage(ImageArray image, float moveX, float moveY, String moveMode) {
   ParallaxImage parallax_image = new ParallaxImage(image, moveX, moveY, moveMode);
   addImage(parallax_image);
  }
  
 void addImage(String filename, float moveX, float moveY, String moveMode) {
   ImageArray image = new ImageArray(filename, canvas_cols, canvas_rows);
   ParallaxImage parallax_image = new ParallaxImage(image, moveX, moveY, moveMode);
   addImage(parallax_image);
  }
  
  void addImage(String params) {
    String[] parameters = split(params, ",");
    addImage(parameters[0], float(parameters[1]),  float(parameters[2]),  parameters[3]);
  }
  
  void addImages(String images[]) {
    for (String params: images) {
      addImage(params);
    }
  }

  void addImages(String images) {
    String images_s[] = split(images,";");
    for (String params: images_s) {
      addImage(params);
    }
  }
  
  
  void doMove() {
    for (int i = 0; i < image_cnt; i++) {
      images[i].image.doMove();
    }
    
  }
  
  public void draw(DeviceRegistry registry, TestObserver testObserver) {
  int x=0;
  int y=0;
            
            
  if (testObserver.hasStrips) {   
        registry.startPushing();
        registry.setExtraDelay(0);
        registry.setAutoThrottle(true);    
        List<Strip> strips = registry.getStrips();
        
        int basey= 0;
        int paintX = 0;
        color c = color(0,0,0,0);
        for (Strip strip: strips) {
          int basex = 0;
          for (int stripx = 0; stripx < strip.getLength(); stripx++) {
            if (floor(stripx/canvas_cols)%2 == 0) {
              x = basex+ floor(stripx % canvas_cols);
            } else {
              x = basex+canvas_cols-1 - floor(stripx % canvas_cols);
            }

            if (stripx % canvas_cols == 0) 
              ++basey;
              
            y = basey;
            int i = 0;
            c = color(0,0,0,0);
            while (alpha(c) == 0 && i < image_cnt) {
              c = images[i].getMovedPixel(x,y);
              i++;
            }
            strip.setPixel(c, stripx);
          }
        }
  }
}

public void simulate() {
    color c = color(0,0,0,0);

    for (int y = 0; y < canvas_rows; y++) {
      for (int x = 0; x < canvas_cols; x++) {        
        int i = 0;
        c = color(0,0,0,0);
        while (alpha(c) == 0) {
          if (i < image_cnt) {
            c = images[i].getMovedPixel(x,y);
          } else {
            c = color(0,0,0);
          }
          i++;
        }
        fill(c);
        rect(x*simulate_scale,y*simulate_scale,simulate_scale,simulate_scale);
      }
    }
  }
}




