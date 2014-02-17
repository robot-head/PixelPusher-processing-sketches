/* Pixelpusher Queue
 * This Processing 2.0 app allows to show simple moving images in multiple layers. It reads the image data 
 * in an array to save time in the scraping process. 
 * Written by @peterkling, powered by @LukeSix
 * 
 * Copyright: Free to use, copy, extend, and whatever you want.
 * 
 * ImageArray.pde - Reads the image into an array, and stores movement data (offsets)
 */


class ImageArray {
    
  
    // board setting
    int canvas_cols = 240; // breite des boards
    int canvas_rows = 8; // höhe des boards (wird für bounce modus gebraucht)


    // ###########################################################
    // constructor
    // ###########################################################

    ImageArray(String filename, int cols, int rows) {
      canvas_cols = cols;
      canvas_rows = rows;

      String filename_config[] = split(filename,"$");
      if (filename_config[0].equals("img")) {
        paint_image(filename_config[1]);
      } else if (filename_config[0].equals("txt")) {
        paint_text(filename_config);
      } else {
        paint_image(filename);
      }
    }
    
    // ###########################################################
    // painting
    // ###########################################################
    
    private int src_cols;
    private int src_rows;
    private int[][] myCanvas;


    // load image
    private void paint_image(String filename) {
      PImage img = loadImage("images/"+filename);
      src_cols = img.width;
      src_rows = img.height;
      
      
      int build_cols = src_cols;
      int build_rows = src_rows;
      if (src_cols < canvas_cols) 
        build_cols = canvas_cols;
       
      if (src_rows < canvas_rows) 
        build_rows = canvas_rows;
       
      
      myCanvas = new int[build_cols][build_rows];
      
      for (int i = 0; i < src_rows; i++) {
        for (int j = 0; j < src_cols; j++) {
          myCanvas[j][i] = img.get(j, i);
        }
      }
    }
    
    
    // paint with text
    // txt$text to be written$r*g*b$textsize$fontname$y
    // 0   1                  2     3        4        5                
    private void paint_text(String text_config[]) {
      // get settings
      String txt = text_config[1];
      
      String colorstr;
      if (text_config.length > 2 && !text_config[2].equals("")) {
        colorstr = text_config[2];
      } else {
        colorstr = "255*255*255";
      }
      colorMode(RGB, 255);
      String colors[] = split(colorstr,"*");
      
      int textsize;
      if (text_config.length > 3 && !text_config[3].equals("")) {
        textsize = int(text_config[3]);
      } else {
        textsize = 8;
      }
      
      String fontname;
      PFont font = createFont("",textsize);
      if (text_config.length > 4 && !text_config[4].equals("")) {
        fontname = text_config[4];
        String fontname_parts[] = split(fontname,".");
        if (fontname_parts.length > 1 && fontname_parts[1].equals("vlw")) {
          font = loadFont(fontname);
        } else {
          font = createFont(fontname,textsize,false);
        }
        textFont(font);
      } else {
        fontname = ""; 
      }
      textSize(textsize);
      
      int y;
      if (text_config.length > 5 && !text_config[5].equals("")) {
        y = int(text_config[5]);
      } else {
        y = 4;
      }
      
     //println(txt+" $ "+colorstr+" $ "+textsize+" $ "+fontname+" $ "+y);

      // get & set size
      int build_cols = ceil(textWidth(txt));
      if (build_cols < canvas_cols) 
        build_cols = canvas_cols;
      
      
      // write text
      PGraphics pg = createGraphics(build_cols, canvas_rows);
      pg.beginDraw();
      if (!fontname.equals("")) pg.textFont(font);
      pg.textSize(textsize);
      pg.fill(int(colors[0]),int(colors[1]),int(colors[2]));
      pg.text(txt,0,y,build_cols,canvas_rows*2);
      pg.endDraw();
      
      // set src dimension
      src_cols = pg.width;
      src_rows = pg.height;
      
      // create canvas
      myCanvas = new int[build_cols][canvas_rows];

      for (int i = 0; i < src_rows; i++) {
        for (int j = 0; j < src_cols; j++) {
          myCanvas[j][i] = pg.get(j, i);
        }
      }
      
    }
    
    // get pixel
    public color getPaintedPixel(int x, int y) {
      return myCanvas[x][y]; 
    }
    
    // get pixel with offset
    public color getPaintedPixel(int x, int y, int offsetX, int offsetY) {
      int x2;
      offsetX = offsetX % src_cols;
      if (x+offsetX >= src_cols) {
        x2 = x + offsetX - src_cols;
      } else if (x+offsetX < 0) {
        x2 = x + offsetX + src_cols;
      } else {
        x2 = x + offsetX;
      }
      
    
      int y2;
      offsetY = offsetY % src_rows;
      if (y+offsetY >= src_rows) {
        y2 = y + offsetY - src_rows;
      } else if (y+offsetY < 0) {
        y2 = y + offsetY + src_rows;
      } else {
        y2 = y + offsetY;
      }
      
      return getPaintedPixel(x2,y2);
    }
    
    // ###########################################################
    // movement
    // ###########################################################

    private float goffsetX = 0;
    private float goffsetY = 0;
    private int gdirectionX = 1;
    private int gdirectionY = 1;
    
    public float moveX = 0.3; // links/rechts bewegen
    public float moveY = 0; // hoch/runter bewegen
    public String moveMode = "bounce"; // endless, bounce

    public void doMove() {
       if (moveMode.equals("bounce")) {
          if (goffsetX+canvas_cols >src_cols || goffsetX < 0) { gdirectionX = gdirectionX*-1; }
          if (goffsetY+canvas_rows >src_rows || goffsetY < 0) { gdirectionY = gdirectionY*-1; }
          goffsetX += moveX*gdirectionX;
          goffsetY += moveY*gdirectionY;
        } else if (moveMode.equals("endless")) {
          goffsetX += moveX;
          goffsetY += moveY;
        }
    }
    
    public color getMovedPixel(int x, int y) {
      //println("getMovedPixel: "+floor(goffsetX)+ " " + floor(goffsetY));
      return getPaintedPixel(x,y,floor(goffsetX),floor(goffsetY));
    }
    
    
    // ###########################################################
    // movement
    // ###########################################################
    
    public void draw(DeviceRegistry registry, TestObserver testObserver, Boolean move) {
  int x=0;
  int y=0;
            
            
  if (testObserver.hasStrips) {   
        registry.startPushing();
        registry.setExtraDelay(0);
        registry.setAutoThrottle(true);    
        List<Strip> strips = registry.getStrips();
        
        int basey= 0;
        int paintX = 0;
        color c;
        if (move)
          this.doMove();
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
            if (move) {
              c = this.getMovedPixel(x,y);
            } else {
              c = this.getPaintedPixel(x,y);
            }
            
            strip.setPixel(c, stripx);
          }
        }
  }
}
}
