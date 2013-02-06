void scrape() {
  // scrape for the strips
  loadPixels();
  if (testObserver.hasStrips) {
    registry.startPushing();
    List<Strip> strips = registry.getStrips();

    // our array is tall and narrow, so let's rotate this 90 degrees.
    // we can assume they're all the same length.
    
    // yscale = how many pixels of y == one led pixel.
    // xscale = how many pixels of x == one led strip.
    int yscale = height / strips.get(0).getLength();
    int xscale = width / strips.size();
    
    // for each strip (x-direction)
    int stripx = 0;
    for (Strip strip : strips) {
      for (int stripy = 0; stripy < strip.getLength(); stripy++) {
        color c = pixels[((strips.size() - (stripx + 1))*xscale) + (stripy*yscale*width)];
        Pixel p = new Pixel((byte)red(c), (byte)green(c), (byte)blue(c));
        strip.setPixel(p, stripy);
      }
      stripx++;
    }
  }
  updatePixels();
}
