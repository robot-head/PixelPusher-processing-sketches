import g4p_controls.*;

import processing.serial.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

DetectedPusher pusher = null;
String pusherPort = null;

// The serial port:
void setup() {
  size(640, 480);
  createGUI();
}

void draw() {
  background(200, 220, 200);
}
