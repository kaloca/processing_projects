PImage back;

void setup(){
  size(400,400);
  back = loadImage("Background.png");
  
}

Image i1 = new Image();
Image i2 = new Image();

void draw(){
  
  i1.show(0);
  i2.show(width);
  
}
