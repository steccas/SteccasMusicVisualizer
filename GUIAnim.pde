/*
Copyright ©2015 Luca Steccanella

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

public void sliderA_change1(GSlider source, GEvent event) {
  println("sliderA - GSlider >> GEvent." + event + " @ " + millis() + " " + sliderA.getValueF());
  volume=sliderA.getValueF(); //Cosi cambio il volume su minim;
  if (player !=null) player.setGain(volume);
}

public void buttonA_click1(GButton source, GEvent event) {
  println("buttonA - GButton >> GEvent." + event + " @ " + millis());
  resetGUI();
  if (a1!=null && a1.exec) {
    a1.exec=false;
    a1=null;
  }
  if (a2!=null && a2.exec) {
    a2.exec=false;
    a2=null;
  }
  player.close();
  player=null;
  minim.stop();
}

public void pausa_click1(GButton source, GEvent event) {
  println("pausa - GButton >> GEvent." + event + " @ " + millis());
  if (player.isPlaying()) player.pause();
  else player.play();
}

public void colorModeS_click1(GButton source, GEvent event) {
  println("colorModeS - GButton >> GEvent." + event + " @ " + millis());
  if (a1!=null && a1.exec) a1.colorModeVarier();
  if (a2!=null && a2.exec) a2.colorModeVarier();
}

public void opt1S_click1(GButton source, GEvent event) {
  println("opt1S - GButton >> GEvent." + event + " @ " + millis());
  if (a1!=null && a1.exec){
    background(255);
    if (a1.getOpt1()) a1.setOpt1(false);
    else a1.setOpt1(true);
  }
  if (a2!=null && a2.exec){
    background(255);
    if (a2.getOpt1()) a2.setOpt1(false);
    else a2.setOpt1(true);
  }
}

public void stepS_click1(GButton source, GEvent event) {
  println("stepS - GButton >> GEvent." + event + " @ " + millis());
  if (a1!=null && a1.exec){
    background(255);
    a1.stepVarier();
  }
}

public void createAnimGUI(){
  label1.setVisible(false);
  loadMusic.setVisible(false);
  button1.setVisible(false);
  button2.setVisible(false);
  if (sliderA==null)
  {
    sliderA= new GSlider(this, width-180, 0, 152, 126, 10.0);
    sliderA.setShowValue(true);
    sliderA.setShowLimits(true);
    sliderA.setLimits(0.0, -80.0, 14.0);
    sliderA.setNbrTicks(10);
    sliderA.setShowTicks(true);
    sliderA.setNumberFormat(G4P.DECIMAL, 1);
    sliderA.setOpaque(false);
    sliderA.addEventHandler(this, "sliderA_change1");
  }
  if (buttonA==null)
  {
    buttonA = new GButton(this, 10, height-50, 58, 40);
    buttonA.setText("CLOSE");
    buttonA.setTextBold();
    buttonA.setLocalColorScheme(GCScheme.RED_SCHEME);
    buttonA.addEventHandler(this, "buttonA_click1");
  }
  if (pausa == null)
  {
    pausa = new GButton(this, width/2-40, height-50, 80, 40);
    pausa.setText("PAUSE/PLAY");
    pausa.setTextBold();
    pausa.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    pausa.addEventHandler(this, "pausa_click1");
  }
  if (colorModeS == null)
  {
    colorModeS = new GButton(this, 10, 50, 80, 40);
    colorModeS.setText("Color");
    colorModeS.setTextBold();
    colorModeS.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    colorModeS.addEventHandler(this, "colorModeS_click1");
  }
  if (option1S == null)
  {
    option1S = new GButton(this, 100, 50, 80, 40);
    if (a1 != null && a1.exec) option1S.setText(a1.opt1text);
    if (a2 != null && a2.exec) option1S.setText(a2.opt1text);
    option1S.setTextBold();
    option1S.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    option1S.addEventHandler(this, "opt1S_click1");
  }
  if (option2S == null)
  {
    option2S = new GButton(this, 190, 50, 80, 40);
    option2S.setText("STEP");
    option2S.setTextBold();
    option2S.setLocalColorScheme(GCScheme.BLUE_SCHEME);
    option2S.addEventHandler(this, "stepS_click1");
  }
  
  sliderA.setVisible(true);
  buttonA.setVisible(true);
  pausa.setVisible(true);
  colorModeS.setVisible(true);
  if (a1 != null && a1.exec) option2S.setVisible(true);
  else option2S.setVisible(false);
  /*if (a1 != null && a1.exec)*/ option1S.setVisible(true);
  //else option1S.setVisible(false);
}

public void resetGUI()
{
  label1.setVisible(true);
  loadMusic.setVisible(true);
  button1.setVisible(true);
  button2.setVisible(true);
  sliderA.setVisible(false);
  buttonA.setVisible(false);
  pausa.setVisible(false);
  colorModeS.setVisible(false);
  option1S.setVisible(false);
  option2S.setVisible(false);
  
  sliderA=null; 
  buttonA=null;
  pausa=null;
  colorModeS=null;
  option1S=null;
  option2S=null;
}

GSlider sliderA; 
GButton buttonA;
GButton pausa;
GButton colorModeS;
GButton option1S;
GButton option2S; //step