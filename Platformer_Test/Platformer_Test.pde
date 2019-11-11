int groundLevel = 270;

void setup() {

  size(600, 400);
}
Player user = new Player();
Brick b = new Brick(200,150);

void keyPressed() {

  if (key == ' ' || keyCode == UP) {
    user.jump();
    loop();
  }
  switch (keyCode) {
  case RIGHT:
    user.dir = 1;
    break;
  case LEFT:
    user.dir = -1;
    break;
  }
  if (keyCode == SHIFT){
    user.running = true;
  }
}

void keyReleased(){
  if (key != ' ' && keyCode != UP){
    user.dir = 0;
  }
  if (keyCode == SHIFT){
    user.running = false;
  }
}
void draw() {
  background (97,133,248);
  fill (19,130,0);
  rect (-1, groundLevel, width+1, height - groundLevel);
  user.show();
  user.move();
  user.checkBrick(b);
  
  
  
  b.show();
  
}
