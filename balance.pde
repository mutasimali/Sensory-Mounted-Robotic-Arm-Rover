void balance()
{
  balanceg.beginDraw();
  balanceg.background(238);
  float radHoriz;
  float radVert;
  radHoriz = radians(xk) * .15;
  radVert = radians(yk-60) * .15;
  
  balanceg. noFill();
  balanceg. stroke(120);
  balanceg.pushMatrix();
  balanceg.translate(310/2, 75, 0);
  balanceg.rotateX((HALF_PI+ radians(-105) * .15)*5-15);
  balanceg.box(320/1.4+20-100, 220+20-100, 1);
  balanceg.popMatrix();

  balanceg.pushMatrix();
  balanceg.stroke(123);
  balanceg.strokeWeight(2);
  balanceg.translate(310/2,  75, 0);
  balanceg.rotateX((PI+radVert)*8-1);
  balanceg.rotateY(radHoriz*10);
  balanceg.fill(63,179,79);
  balanceg.box((320/1.4)-100, 220-100, 25);
  balanceg.popMatrix();
  
  balanceg.endDraw();
  
  image(balanceg,-20,520);
}
