
void scrape() {
  // scrape for the strips
  loadPixels();
  if (testObserver.hasStrips) {
    registry.startPushing();
    List<Strip> strips = registry.getStrips();
    
    // yscale = how many pixels of y == one led strip.
    // xscale = how many pixels of x == one led pixel.
    float xscale = height / strips.get(0).getLength();
    float yscale = ((width / strips.size()) );
    
    // for each strip (y-direction)
    int stripy = 0;
    for (Strip strip : strips) {
      for (int stripx = 0; stripx < strip.getLength(); stripx++) {
        color c = get(int(stripx*xscale),int(stripy*yscale));
        strip.setPixel(c, stripx);
      }
      stripy++;
    }
  }
}
