void gas(){
  fill(133);
  Xtext = 115;
  Ytext = 412;
  float gkmp = map(gk,0,1023,0,100);
  text((int)gkmp, Xtext, Ytext);

  fill(133);
  Xtext = 115;
  Ytext = 472;
  float skmp = map(sk,0,1023,0,100);
  text((int)skmp, Xtext, Ytext);

  fill(133);
  Xtext = 195;
  Ytext = 472;
  text((int)fk, Xtext, Ytext);
}  
