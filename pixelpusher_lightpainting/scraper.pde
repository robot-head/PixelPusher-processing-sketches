
void scrape(int xpos) {
  // scrape for the strips
  if (testObserver.hasStrips) {
    registry.startPushing();
    List<Strip> strips = registry.getStrips();
     // for only one strip:
      Strip strip1=strips.get(0);
      Strip strip2=strips.get(1);
      int stripy=0;
      float ystep = height / strip1.getLength();
      for (float y=0; y<height; y+=ystep) {
        strip1.setPixel(get(xpos,int(y)) , stripy++);
        strip2.setPixel(get(xpos,int(y)) , stripy++);
      }        
  }
}
