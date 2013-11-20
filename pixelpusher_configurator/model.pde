
class ConfigModel {
   int group;
   int controller;
   boolean turbo_mode;
   int turbo_speed;
   int strips_attached;
   int pixelsperstrip;
   boolean blank_on_idle;
   String[] stripType;
   boolean[] swap;
   String[] order;
   int[] blank;
   boolean dhcp;
   int retries;
   int artnet_universe;
   int artnet_channel;
   String ether;
   String netmask;
   String gateway;
  
   ConfigModel() {
      stripType = new String[8];
      swap = new boolean[8];
      order = new String[8];
      blank = new int[8];
      
      for (String stp : stripType) 
         stp = new String("lpd8806"); 
      
      for (boolean swp : swap)
          swp = false;
          
      for (String odr : order)
        odr = new String("rbg");
        
      for (int blk : blank)
        blk = 0;
        
      blank_on_idle = false;
      pixelsperstrip = 240;       
   } 
   
}
