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

class anim
{
  public boolean exec;
  //public int n=0;
  
  private int colorMode;
  private int maxCM;
  private boolean opt1; //opt1
  private boolean colorModeChanged;
  
  private boolean f;
  private boolean c;
  private color colore1;
  private color colore2;
  private color colore;
  
  protected int bsize;
  
  public String opt1text;
  
  protected int j;
  protected float cacheR;
  protected float cacheL;
  
  anim(int mcm, String text)
  {
    exec=false;
    
    colorMode=0;
    maxCM=mcm; // 2
    opt1=false;
    colorModeChanged=false;
  
    f = false;
    c = false;
    colore1=0;
    colore2=0;
    colore=0;
    
    bsize = player.bufferSize();
    
    opt1text=text;
    
    j=bsize-1;
    
    player.play();
    background(255);
  }
  
  public boolean getOpt1() {return opt1;}
  
  public void setOpt1(boolean b) {opt1=b;}
  
  public void colorModeVarier()
  {
    if (colorMode==maxCM) colorMode=0;
    else colorMode=colorMode+1;
    colorModeChanged=true;
  }
  
  public void setColorMode(int cm){
    colorMode=cm;
    colorModeChanged=true;
  }
  
  public int getColorMode() {return colorMode;}
  
  public int getMaxCM() {return maxCM;}

  public color colorVarier() //Mi permette di generare colori random
  {
    if (c != true)
    {
      colore1 = color(random(0,128),random(0,128),random(0,128),random(50,255));
      colore2 = color(random(128,255),random(128,255),random(128,255),random(50,255));
      c = true;
    }
    if (f == false)
    {
      float r = red(colore);
      float g = green(colore);
      float b = blue(colore);
      if (r != red(colore2)) r++;
      if (g != green(colore2)) g++;
      if (b != blue(colore2)) b++;
      colore = color(r, g, b);
    }
    if (red(colore) == red(colore2) && green(colore) == green(colore2) && blue(colore) == blue(colore2) /* && f == false */) f = true; 
    if (f == true)
    {
      float r = red(colore);
      float g = green(colore);
      float b = blue(colore);
      if (r != red(colore1)) r--;
      if (g != green(colore1)) g--;
      if (b != blue(colore1)) b--;
      colore = color(r, g, b);
    }
    if (red(colore) == red(colore1) && green(colore) == green(colore1) && blue(colore) == blue(colore1)) {
     //print("danno"); 
     f = false; 
     c = false;
    }
    return colore;
  }
}