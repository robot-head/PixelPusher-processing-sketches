
color weighted_get(int xpos, int ypos, int radius) {
   int red, green, blue;
   int xoffset, yoffset;
   int pixels_counted;
  
   color thispixel;
  
  
  red = green = blue = pixels_counted = 0;

    for (xoffset=-radius; xoffset<radius; xoffset++) {
     for (yoffset=-radius; yoffset<radius; yoffset++) {

        pixels_counted ++;
        thispixel = get(xpos + xoffset, ypos + yoffset);
        red += red(thispixel);
        green += green(thispixel);
        blue += blue(thispixel);
      }
  }
  return color(red/pixels_counted, green/pixels_counted, blue/pixels_counted);       
}

boolean first_scrape = true;

void scrape() {
  // scrape for the strips
  loadPixels();
  if (testObserver.hasStrips) {
    registry.startPushing();
    List<Strip> strips = registry.getStrips();
    boolean phase = false;
     // for every strip:
       int currenty = 0;
       int stripy = 0;
       for(Strip strip : strips) {
         int strides_per_strip = strip.getLength() / stride;

         int xscale = width / stride;
         int yscale = height / (strides_per_strip * strips.size());
         
         // for every pixel in the physical strip
         for (int stripx = 0; stripx < strip.getLength(); stripx++) {
             int xpixel = stripx % stride;
             int stridenumber = stripx / stride; 
             int xpos,ypos; 
             
             if ((stridenumber & 1) == 0) { // we are going left to right
               xpos = xpixel * xscale; 
               ypos = ((stripy*strides_per_strip) + stridenumber) * yscale;
            } else { // we are going right to left
               xpos = ((stride - 1)-xpixel) * xscale;
               ypos = ((stripy*strides_per_strip) + stridenumber) * yscale;               
            }
            
            color c = 0;
            //c = weighted_get(xpos, ypos, int((xscale+yscale) / 3));
            // c=weighted_get(xpos,ypos,1);   
            c = get(xpos,ypos);
             strip.setPixel(c, stripx);
            
          }
         stripy++;
       }
  }
  updatePixels();
}
