
void wificam(){
  cam.beginDraw();
  if (camera.isAvailable()) {
    camera.read();
    tint(255,255);
    cam.image(camera,30,10);
  }
  cam.endDraw();
  image(cam, 36, 95);
}

