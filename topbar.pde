void topbar(){
  
  topbarg.beginDraw();
 // topbarg.background(238);
topbarg.tint(255,255);
topbarg.image(topbarback, 0, 0);
topbarg.image(topbar, 0, 10);

//buttons
if(crb){topbarg.tint(255,crt);topbarg.image(crcirR,crci,37);}
else {topbarg.tint(255,crt);topbarg.image(crcirX,crci,37);}

if(arb){topbarg.tint(255,art);topbarg.image(arcirR,arci,37);}
else {topbarg.tint(255,art);topbarg.image(arcirX,arci,37);}
  
if(cmb){topbarg.tint(255,cmt);topbarg.image(cmcirR,cmci,37);}
else {topbarg.tint(255,cmt);topbarg.image(cmcirX,cmci,37);}


//toggles
if(slb){topbarg.tint(255,slt);topbarg.image(slgr,slci,34);
        topbarg.tint(255,255);topbarg.image(scirR,scx,34);}
else {topbarg.tint(255,slt);topbarg.image(slgy,slci,34);
      topbarg.tint(255,255);topbarg.image(scirX,scr,34);}

if(plb){topbarg.tint(255,plt);topbarg.image(plgr,plci,34);
        topbarg.tint(255,255);topbarg.image(pcirR,pcx,34);}
else {topbarg.tint(255,plt);topbarg.image(plgy,plci,34);
      topbarg.tint(255,255);topbarg.image(pcirX,pcr,34);}

if(blb){topbarg.tint(255,blt);topbarg.image(blgr,blci,34);
        topbarg.tint(255,255);topbarg.image(bcirR,bcx,34);}
else {topbarg.tint(255,blt);topbarg.image(blgy,blci,34);
      topbarg.tint(255,255);topbarg.image(bcirX,bcr,34);}

//buzzer  
if(bzb){topbarg.tint(255,bzt);topbarg.image(bzgr,bzci,34);}
else {topbarg.tint(255,bzt);topbarg.image(bzgy,bzci,34);}

//kill  
if(killb){topbarg.tint(255,kilt);topbarg.image(kilgr,kilci,16);}
else {topbarg.tint(255,kilt);topbarg.image(kilgy,kilci,16);}


//lock
if(lockb){topbarg.tint(255,lkt);topbarg.image(lock,lbp,36);}
else {topbarg.tint(255,lkt);topbarg.image(lockg,lbp,36);}

 topbarg.endDraw();
 image(topbarg, 0, 10);


}

void buttons(){
  if(getmousX>=crci&&getmousX<=crci+23&&getmousY>=47&&getmousY<=47+23){
  crt=0;
  Ani.to(this, 3, "crt", 255);
  if(!crb){crb = true;car_on();}
  else {crb = false;car_off();}
  getmousX=-1;
  getmousY=-1;
  }
  if(getmousX>=arci&&getmousX<=arci+23&&getmousY>=47&&getmousY<=47+23){
  art=0;
  Ani.to(this, 3, "art", 255);
  if(!arb){arb = true;arm_on();}
  else {arb = false;arm_off();}
  getmousX=-1;
  getmousY=-1;
  }
  if(getmousX>=cmci&&getmousX<=cmci+23&&getmousY>=47&&getmousY<=47+23){
  cmt=0;
  Ani.to(this, 3, "cmt", 255);
  if(!cmb){cmb = true;cam_on();}
  else {cmb = false;cam_off();}
  getmousX=-1;
  getmousY=-1;
  }
  if(getmousX>=lbp&&getmousX<=lbp+23&&getmousY>=46&&getmousY<=46+24){
  lkt=0;
  Ani.to(this, 3, "lkt", 255);
  if(!lockb) lockb = true;
  else lockb = false;
  getmousX=-1;
  getmousY=-1;
  }

}

void toggles(){
  if(getmousX>=scx&&getmousX<=307+29&&getmousY>=44&&getmousY<=44+29){
  scx = 276;
  scr = 307;
  slt=0;
  Ani.to(this, 5, "slt", 255);
  if(!slb){Ani.to(this, .4, "scx", scr);slb = true;sl_on();}
  else{Ani.to(this, .4, "scr", scx);slb = false;sl_off();}
  getmousX=-1;
  getmousY=-1;
  }
  
  if(getmousX>=pcx&&getmousX<=397+29&&getmousY>=44&&getmousY<=44+29){
  pcx = 366;
  pcr = 397;
  plt=0;
  Ani.to(this, 5, "plt", 255);
  if(!plb){Ani.to(this, .4, "pcx", pcr);plb = true;pl_on();}
  else{Ani.to(this, .4, "pcr", pcx);plb = false;pl_off();}
  getmousX=-1;
  getmousY=-1;
  }
  
  if(getmousX>=bcx&&getmousX<=487+29&&getmousY>=44&&getmousY<=44+29){
  bcx = 457;
  bcr = 487;
  blt=0;
  Ani.to(this, 5, "blt", 255);
  if(!blb){Ani.to(this, .4, "bcx", bcr);blb = true;bl_on();}
  else{Ani.to(this, .4, "bcr", bcx);blb = false;bl_off();}
  getmousX=-1;
  getmousY=-1;
  }
}

void buzz(){
  if(getmousX>=bzci&&getmousX<=bzci+42&&getmousY>=44&&getmousY<=44+29){
  bzt=0;
  Ani.to(this, 1.5, "bzt", 255);
  if(!bzb){bzb = true;bz_on();}
  else {bzb = false;bz_off();}
  getmousX=-1;
  getmousY=-1;
  }
}


void killv(){
  if(getmousX>=kilci&&getmousX<=kilci+27&&getmousY>=28&&getmousY<=28+14){
  kilt=0;
  Ani.to(this, 0.2, "kilt", 255);
  if(!killb){killb = true;kill();}
  else {killb = false;}
  getmousX=-1;
  getmousY=-1;
  }
}


void mouseReleased() {
  getmousX=mouseX;
  getmousY=mouseY;
  
  buzz();
  killv();
}

void mousePressed() {
  getmousX=mouseX;
  getmousY=mouseY;
  buttons();
  toggles();
  killv();
  buzz();
}
