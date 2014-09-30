void sensors(){

if(mcu_connected){
//if(myPort.available() > 0){
if (mcu.available() > 0) {
//dataIn = myPort.readString();
dataIn = mcu.readString();
if(dataIn.charAt(0)=='q'){
if (dataIn != null) {
      int hp=dataIn.indexOf("h");
      int cp=dataIn.indexOf("c");
      int xp=dataIn.indexOf("x");
      int yp=dataIn.indexOf("y");
      int gp=dataIn.indexOf("g");
      int sp=dataIn.indexOf("s");
      int fp=dataIn.indexOf("f");
      int op=dataIn.indexOf("o");
      int kp=dataIn.indexOf("k");
      
      if(hp>-1&&cp>-1&&xp>-1&&yp>-1&&gp>-1&&sp>-1&&fp>-1&&op>-1&&kp>-1){
      String hs = dataIn.substring(1,hp);
      String cs = dataIn.substring(hp+1,cp);
      String xs = dataIn.substring(cp+1,xp);
      String ys = dataIn.substring(xp+1,yp);
      String gs = dataIn.substring(yp+1,gp);
      String ss = dataIn.substring(gp+1,sp);
      String fs = dataIn.substring(sp+1,fp);
      String os = dataIn.substring(fp+1,op);
      String ks = dataIn.substring(op+1,kp);
      
     // if(!hs.contains("n"))
      hk=Integer.parseInt(hs);
     // if(!cs.contains("n"))
      ck=Integer.parseInt(cs);
    //  if(!xs.contains("n"))
      xk=-Integer.parseInt(xs);
    //  if(!ys.contains("n"))
      yk=Integer.parseInt(ys);
    //  if(!gs.contains("n"))
      gk=Integer.parseInt(gs);
    //  if(!ss.contains("n"))
      sk=Integer.parseInt(ss);
    //  if(!fs.contains("n"))
      fk=Integer.parseInt(fs);
    //  if(!os.contains("n"))
      ok=Integer.parseInt(os);
    //  if(!ks.contains("n"))
      kk=Integer.parseInt(ks);
      
      
///////////// Write to DataBase File /////////////    
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
  if(db.right){ 
    println(db.right);  
    id = q_id();
    String time = year()+"."+month()+"."+day()+"_"+hour()+":"+minute()+":"+second();
    insert(id,time,hk,ck,xk,yk,gk,sk,fk,ok,kk);
  }
    savedTime = millis();
  }
///////////// Write to DataBase File /////////////    
      
      
      }
 }
}
}
}
}

