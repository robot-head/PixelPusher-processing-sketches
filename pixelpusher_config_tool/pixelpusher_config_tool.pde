import g4p_controls.*;

import processing.serial.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.*;
import javax.swing.*;

DetectedPusher pusher = null;
String filename = null;

// The serial port:
void setup() {
  size(640, 480);
  createGUI();
  customizeGUI();
}

void draw() {
  background(200, 220, 200);
}

void customizeGUI() {
  configPanel.setVisible(false);
}
