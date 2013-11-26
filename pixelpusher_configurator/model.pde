
class ConfigModel {
   int group;
   int controller;
   boolean turbo_mode;
   int turbo_speed;
   int strips_attached;
   int pixelsperstrip;
   boolean blank_on_idle;
   int[] stripType;
   boolean[] swap;
   int[] order;
   int[] blank;
   boolean dhcp;
   int retries;
   int artnet_universe;
   int artnet_channel;
   String ether;
   String netmask;
   String gateway;
   
   String filename;
   
   private String[] stripTypes = { "lpd8806", "lpd6803", "ws2801", "ws2811", "tlc59711", "p9813", "sd600a" };
   private String[] orders = {"rgb", "rbg", "grb", "gbr", "brg", "bgr" };
  
   ConfigModel() {
      stripType = new int[8];
      swap = new boolean[8];

      blank = new int[8];
      stripType = new int[8]; 
      order = new int[8];
      
      order[0] = order[1] = order[2] = order[3] = order[4] = order[5] = order[6] = order[7] = 1;
      
      dhcp = true;
      retries = 5;
      
      for (boolean swp : swap)
          swp = false;
        
      for (int blk : blank)
        blk = 0;
        
     ether = new String("192.168.1.137");
     netmask = new String("255.255.255.0");
     gateway = new String("192.168.1.1");
        
      blank_on_idle = false;
      pixelsperstrip = 240;  
      strips_attached = 8;     
   }
   String toString() {
     StringBuilder s = new StringBuilder();
     if (group != 0)
        s.append("group="+Integer.toString(group)+"\n");
     if (controller != 0)
        s.append("controller="+Integer.toString(controller)+"\n");
     if (artnet_universe != 0)
        s.append("artnet_universe="+Integer.toString(artnet_universe)+"\n");
     if (artnet_channel != 0)
        s.append("artnet_channel="+Integer.toString(artnet_channel)+"\n");
          
        
     if (turbo_mode)
        s.append("turbo_mode="+Integer.toString(turbo_speed)+"\n");
     if (strips_attached != 8)
        s.append("strips_attached="+Integer.toString(strips_attached)+"\n");
     if (pixelsperstrip != 240)
        s.append("pixels="+Integer.toString(pixelsperstrip)+"\n");
     if (blank_on_idle)
        s.append("blank_on_idle=1\n");
     for (int i=0; i<8; i++)
        if (stripType[i]!=0)
          s.append("strip"+Integer.toString(i+1)+"="+stripTypes[stripType[i]]+"\n");
          
     for (int i=0; i<8; i++)
        if (order[i]!=1)
          s.append("strip"+Integer.toString(i+1)+"="+orders[order[i]]+"\n");
           
     for (int i=0; i<8; i++)
        if (blank[i]!=0)
          s.append("start"+Integer.toString(i+1)+"="+Integer.toString(blank[i],16)+"\n");
          
    if (blank_on_idle)
       s.append("blank_strips_on_idle=1\n");
      
    if (dhcp) {
       if (retries != 5)
          s.append("dhcp_timeout="+Integer.toString(retries)+"\n");
    } else {
       s.append("ether="+ether+"\n");
       s.append("netmask="+netmask+"\n");
       s.append("gateway="+gateway+"\n");
    }
 
 
    // this is ugly, but...   
    boolean b=false;
    for (int i=0; i<8; i++) {
      if (swap[i])
        b=true;
    }
    if (b) {
     s.append("swap=");
     for (int i=1; i<8; i++) {
        if (swap[i])
          s.append(Integer.toString(i+1));
     } 
     s.append("\n");
    }
    
     return s.toString();
   }
   
}
