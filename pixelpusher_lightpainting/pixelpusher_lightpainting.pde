
import javax.swing.*;
import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;

import processing.core.*;
import java.util.*;

DeviceRegistry registry;

boolean ready_to_go = true;

TestObserver testObserver;
PImage myImage;

int xpos = 0;

void setup() {
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  registry.setAntiLog(true);
  registry.setFrameLimit(1000);
  frameRate(1000);
  
  // get a file to draw.
  
  try { 
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName()); 
  } catch (Exception e) { 
    e.printStackTrace();  
  } 
   
  // create a file chooser 
  final JFileChooser fc = new JFileChooser(); 
   
  // in response to a button click: 
  int returnVal = fc.showOpenDialog(this); 
   
  if (returnVal == JFileChooser.APPROVE_OPTION) { 
    File file = fc.getSelectedFile(); 
    // see if it's an image 
    // (better to write a function and check for all supported extensions) 
    // load the image using the given file path
    myImage = loadImage(file.getPath());
    image(myImage,0,0);
    size(myImage.width, myImage.height);
  } else { 
    println("Open command cancelled by user."); 
    exit();
  }
  image(myImage,0,0);
  
}




void draw() {
  scrape(xpos++);
  if (xpos == width)
    xpos = 0;
}

void stop()
{
  super.stop();
}
