import java.util.*;
import processing.core.*;
import controlP5.*;

int canvasW = 500;
int canvasH = 500;

color cBlack = color(0, 0, 0); // Black
color cWhite = color(255, 255, 255); // White
String[] aryColorsString = {"Red", "Green", "Blue", "Yellow", "Magenta", "Cyan", "Orange", "White"};
color[] aryColors = {color(250,0,0), // Red
                  color(0,255,0), // Green
                  color(0,0,255), // Blue
                  color(255,255,0), // Yellow
                  color(255,0,255), // Magenta
                  color(0,255,255), // Cyan
                  color(255,191,0), // Orange
                  color(255, 255, 255) // White
                };

ControlP5 cp5;
Textlabel txtLblWhichPusher; // text label displaying which pusher to toggle
ListBox pusherListbox; // list of available pushers

ArrayList<RadioButton> stripsColor = new ArrayList<RadioButton>();
CheckBox checkboxController;
color colorActiveCheckbox = color(255, 0, 0);
color colorHighlightCheckbox = color(0, 0, 255);
color colorLabelCheckbox = color(255, 255, 255);
int intItemsPerRow = 3;
int intCheckboxSpacing = 100;

void setup() {
  size(canvasW, canvasH);
  background(0);
  colorMode(RGB, 255, 255, 255, 255);
  rectMode(CORNER);
  
  cp5 = new ControlP5(this);
  /*
  ControlP5 cp5_2 = new ControlP5(this);
  
  RadioButton rbColor1 = cp5.addRadio("strip1Color");
  rbColor1.setId(1).setPosition(20, 20).setItemWidth(20).setItemHeight(20).setNoneSelectedAllowed(false);
  for(int colorCount = 0; colorCount < aryColors.length; colorCount++)
  {
    rbColor1.addItem(aryColorsString[colorCount], aryColors[colorCount])
           .setColorLabel(aryColors[colorCount]);
  }
  rbColor1.activate(0);
  stripsColor.add(rbColor1);
     
  RadioButton rbColor2 = cp5.addRadio("strip2Color");
  rbColor2.setId(2).setPosition(100, 20).setItemWidth(20).setItemHeight(20).setNoneSelectedAllowed(false);
  for(int colorCount = 0; colorCount < aryColors.length; colorCount++)
  {
    rbColor2.addItem(aryColorsString[colorCount], aryColors[colorCount])
           .setColorLabel(aryColors[colorCount]);
  }
  rbColor2.activate(1);
  stripsColor.add(rbColor2);
  
  for(int rCount = 0; rCount < 8; rCount++)
  {
    RadioButton rbColor = cp5.addRadioButton("strip" + (rCount + 1) + "Color")
       .setPosition((20 * rCount) + 20,(20 * rCount) + 20)
       .setItemWidth(20)
       .setItemHeight(20);
  }
  */
  
  checkboxController = cp5.addCheckBox("checkBox")
                .setPosition(30, width-100)
                .setColorForeground(colorHighlightCheckbox)
                .setColorActive(colorActiveCheckbox)
                .setColorLabel(colorLabelCheckbox)
                .setSize(40, 40)
                .setItemsPerRow(intItemsPerRow)
                .setSpacingColumn(intCheckboxSpacing)
                .setSpacingRow(20);
                
  setupController();;
}


void draw() {
  updateController();
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(checkboxController)) {
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
    int col = 0;
    controllerActivationList.clear();
    for (int i=0;i<checkboxController.getArrayValue().length;i++) {
      int n = (int)checkboxController.getArrayValue()[i];
      int checkboxControllerNo = round((int)checkboxController.getItem(i).internalValue());
      if(n==1 && !controllerActivationList.hasValue(checkboxControllerNo)) 
      {
        controllerActivationList.append(checkboxControllerNo);
      }
    }    
  }
}
