void distance(){
int front,back;
if(ok>400)
front =0;
else
front = ok;

if(kk>400)
back =0;
else
back = kk;

  fill(133);
  Xtext = 319;
  Ytext = 412;
  text(front, Xtext, Ytext);

  fill(133);
  Xtext = 319;
  Ytext = 472;
  text(back, Xtext, Ytext);
}
