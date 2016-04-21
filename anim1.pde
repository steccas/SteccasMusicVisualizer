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

class anima1 extends anim
{
  private float  r;
  private float rad;
  
  private int maxS; //opt2max
  protected int step; //opt2in
  
  private int bss;
  
  private float PIbsz;
  
  anima1(int mcm, int mS, int s) 
  {
    super(mcm, "Persistence");
    r = 240;
    rad = 70;
    
    maxS=mS;
    step=s;
    
    bss=bsize-step;
    
    PIbsz=2*PI/bsize;
  }
  
  private void trasformata()
  {
    for (int i = 0; i < j; i+=step)
    {
      //print(i + "\n");
      float iPIbsz=i*PIbsz;
      float cos=cos(iPIbsz);
      float sin=sin(iPIbsz);
      float xr = (rad)*cos;
      float yr = (rad)*sin;
      float x = (r)*cos;
      float y = (r)*sin;
      if (i==0)
      {
        cacheR=(r + player.right.get(i)*100)*sin;
        cacheL=(r + player.left.get(i)*100)*cos;
      }
      float x2 = cacheL;
      float y2 = cacheR;
      line(x, y, x2, y2);
      if (i < bss) 
      {
        int ipp=i+step;
        float ippPIbsz=(ipp)*PIbsz;
        float cospp=cos(ippPIbsz);
        float sinpp=sin(ippPIbsz);
        float x2A = cacheL = (r + player.left.get(ipp)*100)*cospp;
        float y2A = cacheR = (r + player.right.get(ipp)*100)*sinpp;
        line(x2, y2, x2A, y2A);
      }
      pushStyle();
      stroke(255);
      strokeWeight(2.5);
      point(x2, y2);
      point(xr, yr);
      popStyle();
    }
  }
  
  public void stepVarier()
  {
    if (step==maxS) step=1;
    else step=maxS;
    bss=bsize-1;
  }
  
  public void selector()
  {
    if (getColorMode() == 0) {
      if (getOpt1()) anCM0P();
      else anCM0();
    }
    else if (getColorMode() == 1) {
      if (getOpt1()) anCM1P();
      else anCM1();
    }
    else if (getColorMode() == 2) {
      if (getOpt1()) anCM2P();
      else anCM2();
    }
  }
  
  private void anCM0P()
  {
    color tonoSfondo=colorVarier();
    //background(tonoSfondo);
    float red=255 - red(tonoSfondo);
    float gr=255 - green(tonoSfondo);
    float bl=255 - blue(tonoSfondo);
    beat.detect(player.mix);
    fill(tonoSfondo, 20);
    noStroke();
    rect(0, 0, width, height);
    translate(width/2, height/2);
    noFill();
    //fill(-1, 10);
    fill(red, gr, bl);
    if (beat.isOnset()) {
      rad = rad*0.8; 
      r = r * 0.8;
    }
    else {
      rad = 70;
      r = 256;
    }
    ellipse(0, 0, 2*rad, 2*rad);
    //stroke(-1, 50);
    stroke(red, gr, bl);
    //print (bsize);
    trasformata();
  }
  
  private void anCM0()
  {
    color tonoSfondo=colorVarier();
    background(tonoSfondo);
    float red=255 - red(tonoSfondo);
    float gr=255 - green(tonoSfondo);
    float bl=255 - blue(tonoSfondo);
    beat.detect(player.mix);
    /*fill(tonoSfondo, 20);
    noStroke();
    rect(0, 0, width, height);*/
    translate(width/2, height/2);
    noFill();
    //fill(-1, 10);
    fill(red, gr, bl);
    if (beat.isOnset()) {
      rad = rad*0.8; 
      r = r * 0.8;
    }
    else {
      rad = 70;
      r = 256;
    }
    ellipse(0, 0, 2*rad, 2*rad);
    //stroke(-1, 50);
    stroke(red, gr, bl);
    //print (bsize);
    trasformata();
  }
  
  private void anCM1P()
  {
    beat.detect(player.mix);
    fill(#1A1F18, 20);
    noStroke();
    rect(0, 0, width, height);
    translate(width/2, height/2);
    noFill();
    fill(-1, 10);
    if (beat.isOnset()) {
      rad = rad*0.8; 
      r = r * 0.8;
    }
    else {
      rad = 70;
      r = 256;
    }
    ellipse(0, 0, 2*rad, 2*rad);
    stroke(-1, 50);
    //print (bsize);
    trasformata();
  }
  
  private void anCM1()
  {
    background(#1A1F18);
    beat.detect(player.mix);
    /*fill(#1A1F18, 20);
    noStroke();
    rect(0, 0, width, height);*/
    translate(width/2, height/2);
    noFill();
    fill(-1, 10);
    if (beat.isOnset()) {
      rad = rad*0.8; 
      r = r * 0.8;
    }
    else {
      rad = 70;
      r = 256;
    }
    ellipse(0, 0, 2*rad, 2*rad);
    stroke(-1, 50);
    //print (bsize);
    trasformata();
  }
  
  private void anCM2P()
  {
    //background(#2d2d30);
    beat.detect(player.mix);
    fill(#2d2d30, 20);
    noStroke();
    rect(0, 0, width, height);
    translate(width/2, height/2);
    noFill();
    fill(#68217a);
    if (beat.isOnset()) {
      rad = rad*0.8; 
      r = r * 0.8;
    }
    else {
      rad = 70;
      r = 256;
    }
    ellipse(0, 0, 2*rad, 2*rad);
    stroke(#007acc);
    //print (bsize);
    trasformata();
  }
  
  private void anCM2()
  {
    background(#2d2d30);
    beat.detect(player.mix);
    /*fill(#1A1F18, 20);
    noStroke();
    rect(0, 0, width, height);*/
    translate(width/2, height/2);
    noFill();
    fill(#68217a);
    if (beat.isOnset()) {
      rad = rad*0.8; 
      r = r * 0.8;
    }
    else {
      rad = 70;
      r = 256;
    }
    ellipse(0, 0, 2*rad, 2*rad);
    stroke(#007acc);
    //print (bsize);
    trasformata();
  }
}
