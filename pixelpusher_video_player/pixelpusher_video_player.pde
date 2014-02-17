import javax.swing.*; 
import processing.video.*;
import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;

Movie myMovie;
DeviceRegistry registry;
PusherObserver observer;

void setup() {
  size(640,480);
  registry = new DeviceRegistry();
  observer = new PusherObserver();
  registry.addObserver(observer);
  registry.setAntiLog(true);
  
  // set system look and feel 
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
    myMovie = new Movie(this, file.getPath());
    myMovie.loop();
  } else { 
    println("Open command cancelled by user."); 
    exit();
  }
}

void draw() {
  image(myMovie, 0, 0, width, height);
  scrape();
}

void movieEvent(Movie m) {
  m.read();
}
