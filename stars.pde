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

class stars extends anim
{
  private int angle=-180;
  private boolean ang=false;
  
  stars()
  {
    super(1, "Rotazione");
    noStroke();
  }
  
  public void selector()
  {
    if (getColorMode() == 0) {
      if (getOpt1()) animaR();
      else anima();
    }
    else if (getColorMode() == 1) {
      if (getOpt1()) animaBR();
      else animaB();
    }
  }
  
  private void angVarier()
  {
    if (angle>= 180) ang=true;
    if (angle<= -180) ang=false;
    if (!ang) angle++;
    else angle--;
  }
  
  public void anima()
  {
    fill(0, 50);
    rect(0, 0, width, height);
    for(int i = 0; i < j; i++)
    {
      float l=player.left.get(i)*1280;
      //float lpp=200 + song.left.get(i+1)*100;
      //int ipp=i+1;
  
      float r=player.right.get(i)*1280;
      //float rpp=400 + song.right.get(i+1)*100;
      
      fill(255, 200, 100, 4);
      translate(width/2, height/2);
      //rotate(radians(frameCount/2));
      //print(radians(frameCount/2) + "\n");
      rotate(0.17);
      angVarier();
        float x = angle+sin(radians(angle-frameCount))*100;
        float y = sin(radians(angle+frameCount))*100;
      ellipse(x, y, l, r);
    }
  }
  
  public void animaR()
  {
    fill(0, 50);
    rect(0, 0, width, height);
    for(int i = 0; i < j; i++)
    {
      float l=player.left.get(i)*800;
      //float lpp=200 + song.left.get(i+1)*100;
      //int ipp=i+1;
  
      float r=player.right.get(i)*800;
      //float rpp=400 + song.right.get(i+1)*100;
      
      fill(255, 200, 100, 4);
      translate(width/2, height/2);
      rotate(radians(frameCount/2));
      //print(radians(frameCount/2) + "\n");
      //rotate(0.17);
      angVarier();
        float x = angle+sin(radians(angle-frameCount))*100;
        float y = sin(radians(angle+frameCount))*100;
      ellipse(x, y, l, r);
    }
  }
  
  public void animaB()
  {
    fill(0, 50);
    rect(0, 0, width, height);
    for(int i = 0; i < j; i++)
    {
      float l=player.left.get(i)*1280;
      //float lpp=200 + song.left.get(i+1)*100;
      //int ipp=i+1;
  
      float r=player.right.get(i)*1280;
      //float rpp=400 + song.right.get(i+1)*100;
      
      fill(3, 80, 150, 4);
      translate(width/2, height/2);
      //rotate(radians(frameCount/2));
      //print(radians(frameCount/2) + "\n");
      rotate(0.17);
      angVarier();
        float x = angle+sin(radians(angle-frameCount))*100;
        float y = sin(radians(angle+frameCount))*100;
      ellipse(x, y, l, r);
    }
  }
  
  public void animaBR()
  {
    fill(0, 50);
    rect(0, 0, width, height);
    for(int i = 0; i < j; i++)
    {
      float l=player.left.get(i)*800;
      //float lpp=200 + song.left.get(i+1)*100;
      //int ipp=i+1;
  
      float r=player.right.get(i)*800;
      //float rpp=400 + song.right.get(i+1)*100;
      
      fill(3, 80, 150, 4);
      translate(width/2, height/2);
      rotate(radians(frameCount/2));
      //print(radians(frameCount/2) + "\n");
      //rotate(0.17);
      angVarier();
        float x = angle+sin(radians(angle-frameCount))*100;
        float y = sin(radians(angle+frameCount))*100;
      ellipse(x, y, l, r);
    }
  }
}
