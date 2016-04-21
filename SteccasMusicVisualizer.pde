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

import g4p_controls.*;

import javax.swing.JOptionPane; 
import java.awt.*;
import select.files.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

float volume=0.0;
int btnw;

Minim minim;
AudioPlayer player;
//AudioMetaData meta;
BeatDetect beat;

public void setup(){
  //size(displayWidth, displayHeight, P2D);
  size(1024, 576, P2D);
  //fullScreen(P2D);
  surface.setResizable(false);
  if (height < 620) btnw=140;
  else btnw=160;
  createGUI();
  customGUI();
}



public void fileSelected(File selection)
{
  if (selection != null){
    minim = new Minim(this);
    player = minim.loadFile(selection.getAbsolutePath());
    //meta = player.getMetaData(); 
    beat = new BeatDetect();
    beat.setSensitivity (8);
  }
}
//void keyPressed() {createAnimGUI();}

public boolean isFileSelected()
{
  if (player != null) return true;
  else
  {
    JOptionPane.showMessageDialog(frame, "Scegli un file audio pirma!");
    return false;
  }
}

//anim a;
anima1 a1;
stars a2;
boolean guia=false;

public void draw(){ 
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      saveFrame();
    }
  }
  if (a1 != null && a1.exec==true)
  {
    if (!guia) {
      createAnimGUI();
      guia = true;
    }  
    pushMatrix();
    a1.selector();
    popMatrix();
  }
  else if(a2 != null && a2.exec==true)
  {
    if (!guia) {
      createAnimGUI();
      guia = true;
    }  
    pushMatrix();
    a2.selector();
    popMatrix();
  }
  else {
    background(255);
    guia = false;
  }
}

public void customGUI(){

}