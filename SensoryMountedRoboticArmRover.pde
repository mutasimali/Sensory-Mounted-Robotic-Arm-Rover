import processing.serial.*;
import org.jfree.data.general.*;
import org.jfree.chart.plot.*;
import org.jfree.chart.*;
import com.leapmotion.leap.*;
import processing.net.*;
import java.awt.Color;
import ipcapture.*;
import de.looksgood.ani.*;
import de.bezier.data.sql.*;



//database

SQLite db;
int id;
boolean on;
String db_name = "Log.db";
int savedTime;
int totalTime = 1000;

//database

int hk,ck,xk,yk,gk,sk,fk,ok,kk;
PImage topbar,topbarback;
PImage scirX,scirR;
int scx = 276, scr = 276;
PImage pcirX,pcirR;
int pcx = 366, pcr = 366;
PImage bcirX,bcirR;
int bcx = 457, bcr = 457;
PImage crcirX,crcirR;
int crci= 71;
PImage arcirX,arcirR;
int arci= 131;
PImage cmcirX,cmcirR;
int cmci= 191;
PImage slgr,slgy;
int slci= 276;
PImage plgr,plgy;
int plci= 366;
PImage blgr,blgy;
int blci= 457;
PImage bzgr,bzgy;
int bzci= 551;
PImage kilgr,kilgy;
int kilci= 234;
PImage lock,lockg;
int lbp= 236;
int getmousX,getmousY;
int crt=255,art=255,cmt=255,slt=255,plt=255,blt=255,bzt=255,lkt=255,kilt;
boolean crb =false,arb =false,cmb =false,slb =false,plb =false,blb =false,bzb =false,lockb=false,killb=false;


PGraphics cam,topbarg,balanceg,tieg,introg,cubeg;

char[] ch ={'q','h','c','x','y','g','s','f','o','k'};

IPCapture camera;

Client mcu; 
boolean mcu_connected = false;
boolean arm_connected = false;
boolean cam_connected = false;

String dataIn = null;
String[] files;
byte interesting = 's';

Controller leap;

PImage handler,thermometer,dis_gas; 

static int thermo=0;
static String humidity;

//int hk,ck,xk,yk,gk,sk,fk,ok,kk;
float tk;

int displayWidth = 500;
int displayHeight = 750;

int windowWidth = 800;
int windowHeight = 800;

int joycOutputRangex = 30;  //Maximum value for full horiz or vert position where centered is 0.
int joycOutputRangey = 20;  //Maximum value for full horiz or vert position where centered is 0.

int Xtext,Ytext,Xctext, Yctext;  //Display positions for text feedback values.
float Xctex,Yctex;

int fontSpace = 7;

float curJoycDisplayWidth;
float curJoycDisplayHeight;

float maxJoycRange=120;     //Maximum joystick range

float curJoycAngle;         //Current joystick angle
float curJoycRange;         //Current joystick range

float joycDisplayCenterX;   //Joystick displayed Center X
float joycDisplayCenterY;   //Joystick displayed Center Y

boolean isMousecTracking=false;
boolean w_lock=false,wo_lock=false;

int appw=650;
int apph=700;
 
PFont font;

 int tieplus = 1;
  int introint = 800;
  int introtint = 255;
PImage camb,thermob,joyb,balanceb,tiep,introp;


//Serial myPort;



void setup() {
  // applet setup
  size(650, 700,OPENGL);

  
// video wifi camera setup
  cam = createGraphics(340, 260);
  camera = new IPCapture(this, "http://192.168.10.1:8080", "", "");
  
  introg = createGraphics(650,700);
  topbarg = createGraphics(650, 78,  P3D);
  balanceg = createGraphics(310, 400,  P3D);
  cubeg = createGraphics(190, 190,  P3D);
  tieg = createGraphics(58,457);
  
 // println(Serial.list());
 // myPort = new Serial(this, Serial.list()[2], 115200);  

//database

  db = new SQLite( this, db_name,on );
  savedTime = millis();
if(!db.right)
{ println(db.right);
  PrintWriter output = createWriter(db_name);
  db = new SQLite( this, db_name,on );
  create_table();}
if(db.right){println(db.right);}

//database
  
  
// leap motion controller setup
  leap = new Controller();

// joystick setup
  joycDisplayCenterX = 539;
  joycDisplayCenterY = 570;
  curJoycDisplayWidth = maxJoycRange * .85;
  curJoycDisplayHeight = curJoycDisplayWidth;
  maxJoycRange = curJoycDisplayWidth / 2;
  
// images setup
  handler = loadImage("joystick.png");
  dis_gas = loadImage("dis-gas.png");
 
// applet font setup 
  font = loadFont("MyriadArabic-It-24.vlw");
  textFont(font);
  
// top bar setup
  topbar = loadImage("top-bar.png");
  topbarback = loadImage("topbar-backg.png");
  crcirX= loadImage("top-bar-x.png");
  crcirR= loadImage("top-bar-r.png");
  arcirX= loadImage("top-bar-x.png");
  arcirR= loadImage("top-bar-r.png");
  cmcirX= loadImage("top-bar-x.png");
  cmcirR= loadImage("top-bar-r.png");
  
  scirX= loadImage("cross.png");
  pcirX= loadImage("cross.png");
  bcirX= loadImage("cross.png");
  scirR= loadImage("right.png");
  pcirR= loadImage("right.png");
  bcirR= loadImage("right.png");
  
  slgr= loadImage("top-bar-gr.png");
  slgy= loadImage("top-bar-gy.png");
  plgr= loadImage("top-bar-gr.png");
  plgy= loadImage("top-bar-gy.png");
  blgr= loadImage("top-bar-gr.png");
  blgy= loadImage("top-bar-gy.png");
 
  bzgr= loadImage("top-bar-grbz.png");
  bzgy= loadImage("top-bar-gybz.png");

  kilgr= loadImage("killgr.png");
  kilgy= loadImage("killgy.png");

  lock= loadImage("lock.png");
  lockg= loadImage("lockg.png");

  Ani.init(this);
  camb=loadImage("cam-b.png");
  thermob=loadImage("thermo-b.png");
  joyb=loadImage("joy-b.png");
  balanceb=loadImage("balance-b.png");
  tiep=loadImage("tie.png");
  introp=loadImage("logo.png");
}


void draw()
{
  background(238);



//delay 5 seconds

  introg.beginDraw();
  introg.background(238);
    Ani.to(this, 2.5, "introint", 0);
  introg.image(introp,0,introint);
  introg.endDraw();
 
 if(introint==0)
  Ani.to(this, 6, "introtint", 0);
  tint(255,introtint);
  image(introg,0,0);

//timer
  

if(introtint==0){
tint(255,255);
 image(dis_gas, 36, 365);
  
  //camera frame
  if(cam_connected)camb=loadImage("cam-bg.png");
  else camb=loadImage("cam-b.png");
  image(camb,36,95);
  
  Ani.to(this, 6, "tieplus", 500);
  tieg = createGraphics(88,tieplus);

  
tieg.beginDraw();
  tieg.background(238);
  tieg.image(tiep,0,0);
  tieg.endDraw();
  
  
  
  balance();
  cube();
  image(tieg,406,87);
  
  sensors();  
  distance();
  gas();
  thermometer();
  wificam();

  
  joystick();
  
  //balance 
  image(balanceb,36,495);

  topbar();

}
    


}
