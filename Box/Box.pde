import peasy.*;

PeasyCam cam;

void setup(){
  size(400,400,P3D);
  cam = new PeasyCam(this, 500);
  
}
void draw(){
  background(125);
  translate(58,50,50);
  noFill();
  box(40,40,40);
}
