   float xs,
         ys,
         zs;
   float zv,  
         yv,
         xv,
         pv,
         gv;
   int   xrst,
         zrst,
         yrst,
         prst;
   CUD   xcud,
         zcud,
         ycud,
         pcud;
   boolean xxb = true,
           zzb = true,
           yyb = true,
           ppb = true;
           
void cube(){

    InteractionBox iBox = leap.frame().interactionBox();
    HandList hands = leap.frame().hands();
    Hand hand = hands.get(0);
    FingerList fingers = hand.fingers();
    Pointable f1=fingers.get(0);
    Pointable f2=fingers.get(1);
    float ff1=f1.tipPosition().getX();
    float ff2=f2.tipPosition().getX();
    float sub=ff1-ff2;

    Vector normalizedPosition = iBox.normalizePoint(hand.palmPosition());
    float pixelX = normalizedPosition.getX() * 400;
    float pixelY = 400 - normalizedPosition.getY() * 400;
    float pixelZ = normalizedPosition.getZ()* 400;
    float pitch = hand.direction().pitch()* 100;   

    xs = map(pixelX,0,400,50,200);
    ys = map(pixelY,0,400,0,170);
    zs = map(pixelZ,0,400,-170,0);    

    zv=map(pixelZ,0,400,155,25);   
    yv=map(pixelY,0,400,155,25);
    xv=map(pixelX,0,400,156,0);
    pv=map(pitch,-90,100,155,25);
    gv=map(sub,20,90,145,75);

if(arm_connected){

    if(fingers.count()== 2 && lockb || fingers.count()== 2 && !lockb) 
    {
      w_lock=true;
      wo_lock=true;
    }

    else if(fingers.count() != 2 && lockb)
    w_lock=false;
  
    else if(fingers.count() != 2 && !lockb&&wo_lock) 
    {
      w_lock=false;
      reset();
    }
}

  if(arm_connected){
    if(w_lock){
      String v1=(int)xv+"P";
      String v2=(int)zv+"Q";
      String v3=(int)yv+"F";
      String v4=(int)pv+"K";
      String v5=(int)gv+"L";
      xrst=(int)xv;
      zrst=(int)zv;
      yrst=(int)yv;
      prst=(int)pv;

      //myPort.write(v1+v2+v3+v4+v5);
      //println(v1+v2+v3+v4+v5);
      mcu.write(v1+v2+v3+v4+v5);
      } 
  }
  
  cubeg.beginDraw();
  cubeg.background(238);
  cubeg.camera(-50, -40, (170/2)+50 / tan(PI/6), 170/2, 170/2, 0, 0, 1, 0);
  cubeg.translate(170/2+60, 170/2, -100);
  cubeg.stroke(46,137,59);
  cubeg.noFill();
  cubeg.box(205);
  cubeg.camera(-50, -40, (170/2)+50 / tan(PI/6), 170/2, 170/2, 0, 0, 1, 0);
  cubeg.stroke(0); 
  cubeg.translate(xs, ys, zs);//z-15  -170, y170  10, x60  200
  cubeg.stroke(33,127,46);
  cubeg.fill(63,179,79);
  cubeg.box(25);
  cubeg.endDraw();
  image(cubeg,225,520);

}


void reset(){
    if(arm_connected){
    if(wo_lock){
      //76 P 26 Q 25 F 97 K 108 L
if(xxb){xcud = new CUD(25, xrst, 76);
        xcud.start();xxb=false;}
      int xxx = xcud.getCount();
      String v1=(int)xxx+"P";
if(zzb){zcud = new CUD(25, zrst, 26);
      zcud.start();zzb=false;}
      int zzz = zcud.getCount();
      String v2=(int)zzz+"Q";
if(yyb){ycud = new CUD(25, yrst, 25);
      ycud.start();yyb=false;}
      int yyy = ycud.getCount();
      String v3=(int)yyy+"F";
if(ppb){pcud = new CUD(25, prst, 155);
      pcud.start();ppb=false;}
      int ppp = pcud.getCount(); 
      String v4=(int)ppp+"K";
      
      String v5=(int)gv+"L";

      mcu.write(v1+v2+v3+v4+v5);
      
      if(xxx==76&&zzz==26&&yyy==25&&ppp==155)
      {
         xcud.finish();
         zcud.finish();
         ycud.finish();
         pcud.finish();
         xxb=true;
         zzb=true;
         yyb=true;
         ppb=true;
         wo_lock = false;
      }
      } 
    }
}


class CUD extends Thread {
  boolean run;
  int delay,from,to;
  CUD (int delay, int from, int to) {
    this.delay = delay;
    run = false;
    this.to = to;
    this.from = from;
  }
  int getCount() {return from;}
  void start () {run = true; super.start();}
  void run () {
    if(to<from){
    while (run && from > to) {
      from--;
    try {sleep((long)(delay));}
    catch (Exception e) {}}}
    else if(to>from){
     while (run && to> from) {
      from++;
    try {sleep((long)(delay));}
    catch (Exception e) {}}} }
   void finish() {run = false; interrupt();
  }
}
