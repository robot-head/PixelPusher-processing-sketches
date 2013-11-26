// Need G4P library
import g4p_controls.*;
import java.io.*;
import javax.swing.*;

ConfigModel model;


public void setup(){
  size(800, 850, P3D);
  createGUI();
  customGUI();

  // Place your setup code here
  model = new ConfigModel();
  
}

public void draw(){
  background(230);
  
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}
