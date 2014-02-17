
void scrape(int segment) {
  // scrape for the strips
  loadPixels();
  if (testObserver.hasStrips) {
    registry.startPushing();
    List<Strip> strips = registry.getStrips(segment);
    
    // yscale = how many pixels of y == one led strip.
    // xscale = how many pixels of x == one led pixel.
    int xscale = height / strips.get(0).getLength();
    int yscale = ((width / strips.size()) / 3);
    int xoffset = (segment - 1) * (width / 3);
    
    // for each strip (y-direction)
    int stripy = 0;
    for (Strip strip : strips) {
      for (int stripx = 0; stripx < strip.getLength(); stripx++) {
        color c = pixels[((strips.size() - (stripx + 1))*xscale)+ xoffset + (stripy*yscale*width)];
        strip.setPixel(c, stripy);
      }
      stripy++;
    }
  }
}
