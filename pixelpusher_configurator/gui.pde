/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void stripsAttached_change1(GCustomSlider source, GEvent event) { //_CODE_:stripsAttached:335493:
  println("stripsAttached - GCustomSlider event occured " + System.currentTimeMillis()%10000000 );
  model.strips_attached = source.getValueI();
} //_CODE_:stripsAttached:335493:

public void controller_change1(GTextField source, GEvent event) { //_CODE_:controller:254485:
  println("controller - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.controller = Integer.parseInt(source.getText());
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:controller:254485:

public void group_change1(GTextField source, GEvent event) { //_CODE_:group:902407:
  println("group - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.group = Integer.parseInt(source.getText());
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:group:902407:

public void turboMode_clicked1(GCheckbox source, GEvent event) { //_CODE_:turboMode:863928:
  println("turboMode - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.turbo_mode = true;
  else
    model.turbo_mode = false;
} //_CODE_:turboMode:863928:

public void turboSpeed_change1(GCustomSlider source, GEvent event) { //_CODE_:turboSpeed_slider1:495170:
  println("turboSpeed_slider1 - GCustomSlider event occured " + System.currentTimeMillis()%10000000 );
  model.turbo_speed = source.getValueI();
} //_CODE_:turboSpeed_slider1:495170:

public void stripType1_click1(GDropList source, GEvent event) { //_CODE_:stripType1:439725:
  println("stripType1 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.stripType[0] = source.getSelectedIndex();
} //_CODE_:stripType1:439725:

public void stripType2_click1(GDropList source, GEvent event) { //_CODE_:stripType2:841569:
  println("stripType2 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.stripType[1] = source.getSelectedIndex();
} //_CODE_:stripType2:841569:

public void stripType3_click1(GDropList source, GEvent event) { //_CODE_:stripType3:932479:
  println("stripType3 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.stripType[2] = source.getSelectedIndex();
} //_CODE_:stripType3:932479:

public void stripType4_click1(GDropList source, GEvent event) { //_CODE_:stripType4:750214:
  println("stripType4 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.stripType[3] = source.getSelectedIndex();
} //_CODE_:stripType4:750214:

public void stripType5_click1(GDropList source, GEvent event) { //_CODE_:stripType5:565113:
  println("stripType5 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.stripType[4] = source.getSelectedIndex();
} //_CODE_:stripType5:565113:

public void stripType6_click1(GDropList source, GEvent event) { //_CODE_:stripType6:954858:
  println("stripType6 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.stripType[5] = source.getSelectedIndex();
} //_CODE_:stripType6:954858:

public void stripType7_click1(GDropList source, GEvent event) { //_CODE_:stripType7:382677:
  println("stripType7 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.stripType[6] = source.getSelectedIndex();
} //_CODE_:stripType7:382677:

public void stripType8_click1(GDropList source, GEvent event) { //_CODE_:stripType8:531216:
  println("stripType8 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.stripType[7] = source.getSelectedIndex();
} //_CODE_:stripType8:531216:

public void order1_click1(GDropList source, GEvent event) { //_CODE_:order1:200593:
  println("order1 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.order[0] = source.getSelectedIndex();
} //_CODE_:order1:200593:

public void order2_click1(GDropList source, GEvent event) { //_CODE_:order2:919384:
  println("order2 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.order[1] = source.getSelectedIndex();
} //_CODE_:order2:919384:

public void order3_click1(GDropList source, GEvent event) { //_CODE_:order3:369108:
  println("order3 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.order[2] = source.getSelectedIndex();
} //_CODE_:order3:369108:

public void order4_click1(GDropList source, GEvent event) { //_CODE_:order4:818673:
  println("order4 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.order[3] = source.getSelectedIndex();
} //_CODE_:order4:818673:

public void order5_click1(GDropList source, GEvent event) { //_CODE_:order5:787941:
  println("order5 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.order[4] = source.getSelectedIndex();
} //_CODE_:order5:787941:

public void order6_click1(GDropList source, GEvent event) { //_CODE_:order6:481405:
  println("order6 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.order[5] = source.getSelectedIndex();
} //_CODE_:order6:481405:

public void order7_click1(GDropList source, GEvent event) { //_CODE_:order7:997118:
  println("order7 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.order[6] = source.getSelectedIndex();
} //_CODE_:order7:997118:

public void order8_click1(GDropList source, GEvent event) { //_CODE_:order8:939168:
  println("order8 - GDropList event occured " + System.currentTimeMillis()%10000000 );
  model.order[7] = source.getSelectedIndex();
} //_CODE_:order8:939168:

public void pixelsPerStrip_change2(GTextField source, GEvent event) { //_CODE_:pixelsPerStrip:347862:
  println("pixelsPerStrip - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.pixelsperstrip = Integer.parseInt(source.getText());
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:pixelsPerStrip:347862:

public void blankOnIdle_clicked1(GCheckbox source, GEvent event) { //_CODE_:blankOnIdle:479519:
  println("blankOnIdle - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.blank_on_idle = true;
  else
    model.blank_on_idle = false;
} //_CODE_:blankOnIdle:479519:

public void blank1_change1(GTextField source, GEvent event) { //_CODE_:blank1:230222:
  println("blank1 - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.blank[0] = Integer.parseInt(source.getText(), 16);
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:blank1:230222:

public void blank2_change1(GTextField source, GEvent event) { //_CODE_:blank2:279194:
  println("blank2 - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.blank[1] = Integer.parseInt(source.getText(), 16);
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:blank2:279194:

public void blank3_change1(GTextField source, GEvent event) { //_CODE_:blank3:514345:
  println("blank3 - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.blank[2] = Integer.parseInt(source.getText(), 16);
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:blank3:514345:

public void blank4_change1(GTextField source, GEvent event) { //_CODE_:blank4:908652:
  println("blank4 - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.blank[3] = Integer.parseInt(source.getText(), 16);
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:blank4:908652:

public void blank5_change1(GTextField source, GEvent event) { //_CODE_:blank5:269602:
  println("textfield4 - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.blank[4] = Integer.parseInt(source.getText(), 16);
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:blank5:269602:

public void blank6_change1(GTextField source, GEvent event) { //_CODE_:blank6:630141:
  println("textfield5 - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.blank[5] = Integer.parseInt(source.getText(), 16);
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:blank6:630141:

public void blank7_change1(GTextField source, GEvent event) { //_CODE_:blank7:378599:
  println("textfield6 - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.blank[6] = Integer.parseInt(source.getText(), 16);
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:blank7:378599:

public void blank8_change1(GTextField source, GEvent event) { //_CODE_:blank8:471164:
  println("textfield7 - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.blank[7] = Integer.parseInt(source.getText(), 16);
  } 
  catch (NumberFormatException nfe) {
    // ignore this exception
  }
} //_CODE_:blank8:471164:

public void swap1_clicked1(GCheckbox source, GEvent event) { //_CODE_:swap1:639350:
  println("swap1 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.swap[0] = true;
  else
    model.swap[0]= false;
} //_CODE_:swap1:639350:

public void swap2_clicked1(GCheckbox source, GEvent event) { //_CODE_:swap2:857345:
  println("swap2 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.swap[1] = true;
  else
    model.swap[1]= false;
} //_CODE_:swap2:857345:

public void swap3_clicked1(GCheckbox source, GEvent event) { //_CODE_:swap3:257464:
  println("swap3 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.swap[2] = true;
  else
    model.swap[2]= false;
} //_CODE_:swap3:257464:

public void swap4_clicked1(GCheckbox source, GEvent event) { //_CODE_:swap4:887591:
  println("swap4 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.swap[3] = true;
  else
    model.swap[3]= false;
} //_CODE_:swap4:887591:

public void swap5_clicked1(GCheckbox source, GEvent event) { //_CODE_:swap5:879738:
  println("swap5 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.swap[4] = true;
  else
    model.swap[4]= false;
} //_CODE_:swap5:879738:

public void swap6_clicked1(GCheckbox source, GEvent event) { //_CODE_:swap6:836535:
  println("swap6 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.swap[5] = true;
  else
    model.swap[5]= false;
} //_CODE_:swap6:836535:

public void swap7_clicked1(GCheckbox source, GEvent event) { //_CODE_:swap7:827932:
  println("swap7 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.swap[6] = true;
  else
    model.swap[6]= false;
} //_CODE_:swap7:827932:

public void swap8_clicked1(GCheckbox source, GEvent event) { //_CODE_:swap8:438629:
  println("swap8 - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.swap[7] = true;
  else
    model.swap[7]= false;
} //_CODE_:swap8:438629:

public void dhcp1_clicked1(GCheckbox source, GEvent event) { //_CODE_:dhcp:722796:
  println("dhcp - GCheckbox event occured " + System.currentTimeMillis()%10000000 );
  if (source.isSelected())
    model.dhcp = true;
  else
    model.dhcp = false;
} //_CODE_:dhcp:722796:

public void dhcp_slider1_change1(GCustomSlider source, GEvent event) { //_CODE_:dhcp_slider1:698280:
  println("custom_slider1 - GCustomSlider event occured " + System.currentTimeMillis()%10000000 );
  model.retries = source.getValueI();
} //_CODE_:dhcp_slider1:698280:

public void artnet_universe_change1(GTextField source, GEvent event) { //_CODE_:artnet_universe:299380:
  println("textfield1 - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.artnet_universe = Integer.parseInt(source.getText());
  } 
  catch (NumberFormatException nfe) {
    // ignore
  }
} //_CODE_:artnet_universe:299380:

public void artnet_channel_change2(GTextField source, GEvent event) { //_CODE_:artnet_channel:826890:
  println("artnet_channel - GTextField event occured " + System.currentTimeMillis()%10000000 );
  try {
    model.artnet_channel = Integer.parseInt(source.getText());
  } 
  catch (NumberFormatException nfe) {
    // ignore
  }
} //_CODE_:artnet_channel:826890:

public void ether_change3(GTextField source, GEvent event) { //_CODE_:ether:666582:
  println("ether - GTextField event occured " + System.currentTimeMillis()%10000000 );
  model.ether = source.getText();
} //_CODE_:ether:666582:

public void netmask_change1(GTextField source, GEvent event) { //_CODE_:netmask:532911:
  println("netmask - GTextField event occured " + System.currentTimeMillis()%10000000 );
  model.netmask = source.getText();
} //_CODE_:netmask:532911:

public void gateway_change1(GTextField source, GEvent event) { //_CODE_:gateway:924214:
  println("gateway - GTextField event occured " + System.currentTimeMillis()%10000000 );
  model.gateway = source.getText();
} //_CODE_:gateway:924214:

public void write_click1(GButton source, GEvent event) { //_CODE_:write_button:890092:
  println("write_button - GButton event occured " + System.currentTimeMillis()%10000000 );
  println(model.toString());
  if (model.filename == null) {
    // create a file chooser 
    final JFileChooser fc = new JFileChooser(); 

    // in response to a button click: 
    int returnVal = fc.showSaveDialog(this); 


    if (returnVal == JFileChooser.APPROVE_OPTION) { 
      try {
        File file = fc.getSelectedFile(); 
        println(file.getCanonicalPath());
        model.filename = file.getCanonicalPath();
      } 
      catch (IOException ioe) {
        // nada
      }
    } 
    else { 
      println("Save command cancelled by user.");
    }
  }
  try {
    PrintWriter out = new PrintWriter(model.filename);
    out.println(model.toString());

    println("pixel.rc length = "+ model.toString().length());

    out.close();
  } 
  catch(FileNotFoundException fnfe) {
    // this can't happen.
  }
} //_CODE_:write_button:890092:

public void file_location_button1_click1(GButton source, GEvent event) { //_CODE_:file_location_button:203558:
  println("file_location_button - GButton event occured " + System.currentTimeMillis()%10000000 );
  // create a file chooser 
  final JFileChooser fc = new JFileChooser(); 

  // in response to a button click: 
  int returnVal = fc.showSaveDialog(this); 


  if (returnVal == JFileChooser.APPROVE_OPTION) { 
    try {
      File file = fc.getSelectedFile(); 
      println(file.getCanonicalPath());
      model.filename = file.getCanonicalPath();
    } 
    catch (IOException ioe) {
      //
    }
    try {
    PrintWriter out = new PrintWriter(model.filename);
    out.println(model.toString());
    println(model.toString());

    println("pixel.rc length = "+ model.toString().length());

    out.close();
   } catch(FileNotFoundException fnfe) {
      // this can't happen.
    }
  } 
  else { 
    println("Save command cancelled by user.");
  }
} //_CODE_:file_location_button:203558:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("PixelPusher Configurator");
  stripsAttached = new GCustomSlider(this, 110, 70, 142, 51, "grey_blue");
  stripsAttached.setShowValue(true);
  stripsAttached.setShowLimits(true);
  stripsAttached.setLimits(8, 1, 8);
  stripsAttached.setNbrTicks(8);
  stripsAttached.setStickToTicks(true);
  stripsAttached.setShowTicks(true);
  stripsAttached.setNumberFormat(G4P.INTEGER, 0);
  stripsAttached.setOpaque(false);
  stripsAttached.addEventHandler(this, "stripsAttached_change1");
  label1 = new GLabel(this, 2, 84, 96, 20);
  label1.setText("Strips attached");
  label1.setOpaque(false);
  label2 = new GLabel(this, 200, 20, 80, 20);
  label2.setText("Controller");
  label2.setOpaque(false);
  controller = new GTextField(this, 300, 20, 77, 30, G4P.SCROLLBARS_NONE);
  controller.setOpaque(true);
  controller.addEventHandler(this, "controller_change1");
  group = new GTextField(this, 110, 20, 75, 30, G4P.SCROLLBARS_NONE);
  group.setOpaque(true);
  group.addEventHandler(this, "group_change1");
  label3 = new GLabel(this, 10, 20, 80, 20);
  label3.setText("Group");
  label3.setOpaque(false);
  turboMode = new GCheckbox(this, 390, 20, 120, 20);
  turboMode.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  turboMode.setText("  Turbo mode");
  turboMode.setOpaque(false);
  turboMode.addEventHandler(this, "turboMode_clicked1");
  label4 = new GLabel(this, 10, 220, 80, 20);
  label4.setText("Strip 1");
  label4.setOpaque(false);
  turboSpeed_slider1 = new GCustomSlider(this, 520, 10, 100, 50, "grey_blue");
  turboSpeed_slider1.setShowValue(true);
  turboSpeed_slider1.setShowLimits(true);
  turboSpeed_slider1.setLimits(16, 1, 24);
  turboSpeed_slider1.setNbrTicks(8);
  turboSpeed_slider1.setNumberFormat(G4P.INTEGER, 0);
  turboSpeed_slider1.setOpaque(false);
  turboSpeed_slider1.addEventHandler(this, "turboSpeed_change1");
  stripType1 = new GDropList(this, 120, 220, 90, 66, 3);
  stripType1.setItems(loadStrings("list_439725"), 0);
  stripType1.addEventHandler(this, "stripType1_click1");
  stripType2 = new GDropList(this, 120, 270, 90, 66, 3);
  stripType2.setItems(loadStrings("list_841569"), 0);
  stripType2.addEventHandler(this, "stripType2_click1");
  stripType3 = new GDropList(this, 120, 320, 90, 66, 3);
  stripType3.setItems(loadStrings("list_932479"), 0);
  stripType3.addEventHandler(this, "stripType3_click1");
  stripType4 = new GDropList(this, 120, 370, 90, 66, 3);
  stripType4.setItems(loadStrings("list_750214"), 0);
  stripType4.addEventHandler(this, "stripType4_click1");
  stripType5 = new GDropList(this, 120, 420, 90, 66, 3);
  stripType5.setItems(loadStrings("list_565113"), 0);
  stripType5.addEventHandler(this, "stripType5_click1");
  stripType6 = new GDropList(this, 120, 470, 90, 66, 3);
  stripType6.setItems(loadStrings("list_954858"), 0);
  stripType6.addEventHandler(this, "stripType6_click1");
  stripType7 = new GDropList(this, 120, 520, 90, 66, 3);
  stripType7.setItems(loadStrings("list_382677"), 0);
  stripType7.addEventHandler(this, "stripType7_click1");
  stripType8 = new GDropList(this, 120, 570, 90, 66, 3);
  stripType8.setItems(loadStrings("list_531216"), 0);
  stripType8.addEventHandler(this, "stripType8_click1");
  label5 = new GLabel(this, 10, 270, 80, 20);
  label5.setText("Strip 2");
  label5.setOpaque(false);
  label6 = new GLabel(this, 10, 320, 80, 20);
  label6.setText("Strip 3");
  label6.setOpaque(false);
  label7 = new GLabel(this, 10, 370, 80, 20);
  label7.setText("Strip 4");
  label7.setOpaque(false);
  label8 = new GLabel(this, 10, 420, 80, 20);
  label8.setText("Strip 5");
  label8.setOpaque(false);
  label9 = new GLabel(this, 10, 470, 80, 20);
  label9.setText("Strip 6");
  label9.setOpaque(false);
  label10 = new GLabel(this, 10, 520, 80, 20);
  label10.setText("Strip 7");
  label10.setOpaque(false);
  label11 = new GLabel(this, 10, 570, 80, 20);
  label11.setText("Strip 8");
  label11.setOpaque(false);
  label12 = new GLabel(this, 280, 70, 80, 50);
  label12.setText("Pixels per strip");
  label12.setOpaque(false);
  order1 = new GDropList(this, 300, 220, 90, 66, 3);
  order1.setItems(loadStrings("list_200593"), 1);
  order1.addEventHandler(this, "order1_click1");
  order2 = new GDropList(this, 300, 270, 90, 66, 3);
  order2.setItems(loadStrings("list_919384"), 1);
  order2.addEventHandler(this, "order2_click1");
  order3 = new GDropList(this, 300, 320, 90, 66, 3);
  order3.setItems(loadStrings("list_369108"), 1);
  order3.addEventHandler(this, "order3_click1");
  order4 = new GDropList(this, 300, 370, 90, 60, 3);
  order4.setItems(loadStrings("list_818673"), 1);
  order4.addEventHandler(this, "order4_click1");
  order5 = new GDropList(this, 300, 420, 90, 66, 3);
  order5.setItems(loadStrings("list_787941"), 1);
  order5.addEventHandler(this, "order5_click1");
  order6 = new GDropList(this, 300, 470, 90, 66, 3);
  order6.setItems(loadStrings("list_481405"), 1);
  order6.addEventHandler(this, "order6_click1");
  order7 = new GDropList(this, 300, 520, 90, 66, 3);
  order7.setItems(loadStrings("list_997118"), 1);
  order7.addEventHandler(this, "order7_click1");
  order8 = new GDropList(this, 300, 570, 90, 66, 3);
  order8.setItems(loadStrings("list_939168"), 1);
  order8.addEventHandler(this, "order8_click1");
  pixelsPerStrip = new GTextField(this, 380, 80, 160, 30, G4P.SCROLLBARS_NONE);
  pixelsPerStrip.setDefaultText("240");
  pixelsPerStrip.setOpaque(true);
  pixelsPerStrip.addEventHandler(this, "pixelsPerStrip_change2");
  label13 = new GLabel(this, 600, 10, 80, 20);
  label13.setText("MHz");
  label13.setOpaque(false);
  blankOnIdle = new GCheckbox(this, 420, 140, 120, 20);
  blankOnIdle.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  blankOnIdle.setText("  Blank on idle");
  blankOnIdle.setOpaque(false);
  blankOnIdle.addEventHandler(this, "blankOnIdle_clicked1");
  label14 = new GLabel(this, 430, 170, 100, 30);
  label14.setText("Blanking colour");
  label14.setTextItalic();
  label14.setOpaque(false);
  blank1 = new GTextField(this, 440, 220, 90, 20, G4P.SCROLLBARS_NONE);
  blank1.setText("000000");
  blank1.setDefaultText("000000");
  blank1.setOpaque(true);
  blank1.addEventHandler(this, "blank1_change1");
  blank2 = new GTextField(this, 440, 270, 90, 20, G4P.SCROLLBARS_NONE);
  blank2.setText("000000");
  blank2.setDefaultText("000000");
  blank2.setOpaque(true);
  blank2.addEventHandler(this, "blank2_change1");
  blank3 = new GTextField(this, 440, 320, 90, 20, G4P.SCROLLBARS_NONE);
  blank3.setText("000000");
  blank3.setDefaultText("000000");
  blank3.setOpaque(true);
  blank3.addEventHandler(this, "blank3_change1");
  blank4 = new GTextField(this, 440, 370, 90, 20, G4P.SCROLLBARS_NONE);
  blank4.setText("000000");
  blank4.setDefaultText("000000");
  blank4.setOpaque(true);
  blank4.addEventHandler(this, "blank4_change1");
  blank5 = new GTextField(this, 440, 420, 90, 20, G4P.SCROLLBARS_NONE);
  blank5.setText("000000");
  blank5.setDefaultText("000000");
  blank5.setOpaque(true);
  blank5.addEventHandler(this, "blank5_change1");
  blank6 = new GTextField(this, 440, 470, 90, 20, G4P.SCROLLBARS_NONE);
  blank6.setText("000000");
  blank6.setDefaultText("000000");
  blank6.setOpaque(true);
  blank6.addEventHandler(this, "blank6_change1");
  blank7 = new GTextField(this, 440, 520, 90, 20, G4P.SCROLLBARS_NONE);
  blank7.setText("000000");
  blank7.setDefaultText("000000");
  blank7.setOpaque(true);
  blank7.addEventHandler(this, "blank7_change1");
  blank8 = new GTextField(this, 440, 570, 90, 20, G4P.SCROLLBARS_NONE);
  blank8.setText("000000");
  blank8.setDefaultText("000000");
  blank8.setOpaque(true);
  blank8.addEventHandler(this, "blank8_change1");
  swap1 = new GCheckbox(this, 220, 220, 60, 20);
  swap1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  swap1.setText("  swap");
  swap1.setOpaque(false);
  swap1.addEventHandler(this, "swap1_clicked1");
  swap2 = new GCheckbox(this, 220, 270, 70, 20);
  swap2.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  swap2.setText("  swap");
  swap2.setOpaque(false);
  swap2.addEventHandler(this, "swap2_clicked1");
  swap3 = new GCheckbox(this, 220, 320, 70, 20);
  swap3.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  swap3.setText("  swap");
  swap3.setOpaque(false);
  swap3.addEventHandler(this, "swap3_clicked1");
  swap4 = new GCheckbox(this, 220, 370, 70, 20);
  swap4.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  swap4.setText("  swap");
  swap4.setOpaque(false);
  swap4.addEventHandler(this, "swap4_clicked1");
  swap5 = new GCheckbox(this, 220, 420, 70, 20);
  swap5.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  swap5.setText("  swap");
  swap5.setOpaque(false);
  swap5.addEventHandler(this, "swap5_clicked1");
  swap6 = new GCheckbox(this, 220, 470, 70, 20);
  swap6.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  swap6.setText("  swap");
  swap6.setOpaque(false);
  swap6.addEventHandler(this, "swap6_clicked1");
  swap7 = new GCheckbox(this, 220, 520, 70, 20);
  swap7.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  swap7.setText("  swap");
  swap7.setOpaque(false);
  swap7.addEventHandler(this, "swap7_clicked1");
  swap8 = new GCheckbox(this, 220, 570, 70, 20);
  swap8.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  swap8.setText("  swap");
  swap8.setOpaque(false);
  swap8.addEventHandler(this, "swap8_clicked1");
  dhcp = new GCheckbox(this, 10, 660, 120, 20);
  dhcp.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  dhcp.setText("  Use DHCP");
  dhcp.setOpaque(false);
  dhcp.addEventHandler(this, "dhcp1_clicked1");
  dhcp.setSelected(true);
  dhcp_slider1 = new GCustomSlider(this, 100, 650, 100, 40, "grey_blue");
  dhcp_slider1.setShowValue(true);
  dhcp_slider1.setShowLimits(true);
  dhcp_slider1.setLimits(5, 1, 20);
  dhcp_slider1.setNumberFormat(G4P.INTEGER, 0);
  dhcp_slider1.setOpaque(false);
  dhcp_slider1.addEventHandler(this, "dhcp_slider1_change1");
  label15 = new GLabel(this, 180, 650, 80, 20);
  label15.setText("retries");
  label15.setOpaque(false);
  artnet_universe = new GTextField(this, 370, 660, 77, 30, G4P.SCROLLBARS_NONE);
  artnet_universe.setDefaultText("1");
  artnet_universe.setOpaque(true);
  artnet_universe.addEventHandler(this, "artnet_universe_change1");
  label16 = new GLabel(this, 280, 660, 80, 30);
  label16.setText("Art-Net Port");
  label16.setOpaque(false);
  artnet_channel = new GTextField(this, 540, 660, 77, 30, G4P.SCROLLBARS_NONE);
  artnet_channel.setDefaultText("1");
  artnet_channel.setOpaque(true);
  artnet_channel.addEventHandler(this, "artnet_channel_change2");
  label17 = new GLabel(this, 460, 660, 80, 30);
  label17.setText("Channel");
  label17.setOpaque(false);
  ether = new GTextField(this, 90, 710, 160, 30, G4P.SCROLLBARS_NONE);
  ether.setText("198.162.1.137");
  ether.setDefaultText("198.162.1.137");
  ether.setOpaque(true);
  ether.addEventHandler(this, "ether_change3");
  label27 = new GLabel(this, 10, 710, 80, 30);
  label27.setText("IP address");
  label27.setTextBold();
  label27.setOpaque(false);
  label18 = new GLabel(this, 280, 710, 80, 30);
  label18.setText("Netmask");
  label18.setOpaque(false);
  netmask = new GTextField(this, 360, 710, 160, 30, G4P.SCROLLBARS_NONE);
  netmask.setDefaultText("255.255.255.0");
  netmask.setOpaque(true);
  netmask.addEventHandler(this, "netmask_change1");
  gateway = new GTextField(this, 90, 760, 160, 30, G4P.SCROLLBARS_NONE);
  gateway.setDefaultText("198.162.1.1");
  gateway.setOpaque(true);
  gateway.addEventHandler(this, "gateway_change1");
  label28 = new GLabel(this, 10, 760, 80, 30);
  label28.setText("Gateway");
  label28.setOpaque(false);
  write_button = new GButton(this, 579, 788, 210, 50);
  write_button.setText("Save");
  write_button.setTextBold();
  write_button.addEventHandler(this, "write_click1");
  file_location_button = new GButton(this, 580, 719, 209, 56);
  file_location_button.setText("Save as...");
  file_location_button.addEventHandler(this, "file_location_button1_click1");
}

// Variable declarations 
// autogenerated do not edit
GCustomSlider stripsAttached; 
GLabel label1; 
GLabel label2; 
GTextField controller; 
GTextField group; 
GLabel label3; 
GCheckbox turboMode; 
GLabel label4; 
GCustomSlider turboSpeed_slider1; 
GDropList stripType1; 
GDropList stripType2; 
GDropList stripType3; 
GDropList stripType4; 
GDropList stripType5; 
GDropList stripType6; 
GDropList stripType7; 
GDropList stripType8; 
GLabel label5; 
GLabel label6; 
GLabel label7; 
GLabel label8; 
GLabel label9; 
GLabel label10; 
GLabel label11; 
GLabel label12; 
GDropList order1; 
GDropList order2; 
GDropList order3; 
GDropList order4; 
GDropList order5; 
GDropList order6; 
GDropList order7; 
GDropList order8; 
GTextField pixelsPerStrip; 
GLabel label13; 
GCheckbox blankOnIdle; 
GLabel label14; 
GTextField blank1; 
GTextField blank2; 
GTextField blank3; 
GTextField blank4; 
GTextField blank5; 
GTextField blank6; 
GTextField blank7; 
GTextField blank8; 
GCheckbox swap1; 
GCheckbox swap2; 
GCheckbox swap3; 
GCheckbox swap4; 
GCheckbox swap5; 
GCheckbox swap6; 
GCheckbox swap7; 
GCheckbox swap8; 
GCheckbox dhcp; 
GCustomSlider dhcp_slider1; 
GLabel label15; 
GTextField artnet_universe; 
GLabel label16; 
GTextField artnet_channel; 
GLabel label17; 
GTextField ether; 
GLabel label27; 
GLabel label18; 
GTextField netmask; 
GTextField gateway; 
GLabel label28; 
GButton write_button; 
GButton file_location_button; 

