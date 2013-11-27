class DetectedPusher {
  String port;
  String ver;

  DetectedPusher(String port, String ver) {
    this.port = port;
    this.ver = ver;
  }
}

void writeConfig(DetectedPusher dp) {
   Serial s = new Serial(this, dp.port, 115200);
   s.write("\r\nHoldoff"+Integer.toString(usbHoldoffSlider.getValueI()/4, 16));
   
   if (filename != null) {
     try {
       s.write("\r\nConfig");
       BufferedReader reader = new BufferedReader(new FileReader(filename));
       for (int i=0; i<1023; i++) {
           int c = reader.read();
           if (c == -1) {
             s.write(255);
             break;
           }
           s.write(c);
         }
      } catch (FileNotFoundException fnfe) {
         s.write(255); // just in case 
      } catch (IOException ioe) {
         s.write(255);
      } finally {
         s.stop(); 
      }
   }
}

DetectedPusher DetectPusher() {
  Serial s;
  char lf = '\n';
  Pattern vrx = Pattern.compile("PixelPusher (.*) ready and waiting");
  String pusherPort = null;
  String pusherVersion = null;

  // List all the available serial ports:
  for (String pn : Serial.list()) {
    try {
      //println("Attempting to detect PixelPusher on port " + pn);
      s = new Serial(this, pn, 115200);
      s.write("\r\nReboot");
      s.clear();
      delay(2000);
      while (s.available () > 0) {
        String r = s.readString();
        if (r != null) {
          Matcher m = vrx.matcher(r);
          if (m.find()) {
            pusherVersion = m.group(1);
            pusherPort = pn;
          }
        }
      }
      s.stop();
    } 
    catch (Exception ex) {
      //println("Couldn't open port " + pn);
    }
  }
  if (pusherPort != null) {
    println("PixelPusher found on " + pusherPort + ". Version: " + pusherVersion);
    return new DetectedPusher(pusherPort, pusherVersion);
  } 

  println("No PixelPusher found. Unplug, wait 5 seconds, and plug back in and try again");
  return null;
}

