import g4p_controls.*;

import processing.serial.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

DetectedPusher pusher = null;

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
