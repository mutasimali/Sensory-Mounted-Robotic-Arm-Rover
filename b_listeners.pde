void car_on(){
mcu = new Client(this, "192.168.10.100", 55555);
mcu_connected = true;
}

void car_off(){
mcu.stop();
mcu_connected = false;
}

void arm_on(){
arm_connected = true;
}
void arm_off(){
arm_connected = false;
}
void kill(){
if(arm_connected) 
mcu.write("76P0Q0F0K0L");
}

void cam_on(){
camera.start();
cam_connected=true;
}
void cam_off(){
camera.stop();
cam_connected=false;
}

void sl_on(){
if(mcu_connected)
mcu.write("W");
}
void sl_off(){
if(mcu_connected)
mcu.write("w");
}   

void pl_on(){
if(mcu_connected)
mcu.write("R");
}
void pl_off(){
if(mcu_connected)
mcu.write("r");
}

void bl_on(){
if(mcu_connected)
mcu.write("M");
}
void bl_off(){
if(mcu_connected)
mcu.write("m");
}

void bz_on(){
if(mcu_connected)
mcu.write("B");
}
void bz_off(){
if(mcu_connected)
mcu.write("b");
}
