float gravAccel = 9.8; //  g/ m/sˆ2 
boolean mouseControl;
int ground = 355;
int time = millis();

int m;

void setup() {
  size (600,400);
  frameRate(60);
  
  
}

Object obj = new Object (40,40,"ellipse");

void mousePressed(){
  if (obj.type == "rect"){
    if (mouseX > obj.x && mouseX < obj.x +obj.rw && mouseY > obj.y && mouseY < obj.y + obj.rh){
      mouseControl = true;
    }
  } 
  
  if (obj.type == "ellipse"){
    if (mouseX > obj.x - obj.ew/2 && mouseX < obj.x +obj.ew/2 && mouseY > obj.y - obj.eh/2 && mouseY < obj.y + obj.eh/2){
      mouseControl = true;
    }
  } 
}
void mouseReleased(){

    mouseControl = false;
    
}

  
void draw(){
  
  
  
  background (200,200,255);
  
  println (time);
  
  rect (0,ground,width,2);
  obj.exist();
  obj.gravity();
  
}
