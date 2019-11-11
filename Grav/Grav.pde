float gravSpeed = 9.81;
float gravVel;
float gravAccel = 0.03;
boolean mouseControl;


Rec rec = new Rec(40,25);

void setup(){
  
  size(600,400);
  
}

void mousePressed(){
  
  if (mouseX > rec.x && mouseX < rec.x +rec.rw && mouseY > rec.y && mouseY < rec.y + rec.rh){
    mouseControl = true;
  
  } 
}
void mouseReleased(){

    mouseControl = false;
    
}


void draw(){
  
  
  gravVel = gravSpeed + gravAccel;
  
  
  
  rectMode(CORNER);
  background (200,200,255);
  
  
  rect (0,355,width,2);
  
  rec.show();
  rec.fall();
  rec.control();
  
  
}
