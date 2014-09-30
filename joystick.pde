
void joystick(){
image(joyb,464,495);
// start joystick
  fill(95,95,95);
  Xctext = 516;
  Yctext = (int)(645);
  text("X  =", Xctext, Yctext);
  Xctext += (5*fontSpace);
  Xctex = 90 + (joycOutputRangex*(-(cos(curJoycAngle) * curJoycRange)/ maxJoycRange));
  text(nf((int)Xctex, 2), Xctext, Yctext);
  Xctext = 516;
  Yctext += 18;  
  text("Y  =", Xctext, Yctext);
  Xctext += (5*fontSpace);
  Yctex = 90 + (joycOutputRangey*(-(sin(curJoycAngle) * curJoycRange)/maxJoycRange));
  text(nf((int)Yctex, 2), Xctext, Yctext);
  
  
  float dxc = mouseX - joycDisplayCenterX;
  float dyc = mouseY - joycDisplayCenterY;
  float hxc=joycDisplayCenterX+59;
  float lxc=joycDisplayCenterX-56;
  float hyc=joycDisplayCenterY+59;
  float lyc=joycDisplayCenterY-56;  

  if(mousePressed&&mouseX>=lxc&&mouseX<=hxc&&mouseY>=lyc&&mouseY<=hyc){
     isMousecTracking = true;
  }

  if(!mousePressed){
    isMousecTracking = false;
  }

  if (isMousecTracking){
    curJoycAngle = atan2(dyc, dxc);
    curJoycRange = dist(mouseX, mouseY, joycDisplayCenterX, joycDisplayCenterY);
  }else{
  curJoycRange = 0;
  }
 
  fill(200);
  stroke(0.10,50);
  ellipse(joycDisplayCenterX, joycDisplayCenterY, curJoycDisplayHeight, curJoycDisplayWidth);
  fill(80);
  ellipse(joycDisplayCenterX, joycDisplayCenterY, 20, 20);
  stroke(0,100);
  segmentc(joycDisplayCenterX, joycDisplayCenterY, curJoycAngle);
  
  float xxc = (float)(joycDisplayCenterX-27+(curJoycRange*cos(curJoycAngle)));
  float yyc = (float)(joycDisplayCenterY-27+(curJoycRange*sin(curJoycAngle)));

  if(mcu_connected)handler = loadImage("joystickgr.png");
  else handler = loadImage("joystick.png");redraw();


  if(isMousecTracking){
   image(handler, xxc, yyc);
  // mcu.write((int)(Xctex)+" U");
  // mcu.write((int)(Xctex)+" U"+(int)(Yctex)+" A");
  // mcu.write((int)(Yctex)+" A");
   //myPort.write((int)(Xctex)+" A");
  // myPort.write((int)(Yctex)+" U");
  }else{
   image(handler, (joycDisplayCenterX-26), (joycDisplayCenterY-26));
   center();
  }

// end joystick 

}


void center(){
  if(mcu_connected){
//mcu.write((int)(90)+" U"+(int)(90)+" A");
//mcu.write((int)(90)+" A");
//mcu.write((int)(90)+" U");
//myPort.write((int)(90)+" A");
//myPort.write((int)(90)+" U");
  }
}
 

 
void segmentc(float x, float y, float a)
{
  pushMatrix();translate(x, y);rotate(a);
  if (curJoycRange > maxJoycRange){curJoycRange = maxJoycRange;}
  line(0, 0, curJoycRange, 0);popMatrix();
}
