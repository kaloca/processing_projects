class Paddle
{
  PVector pos = new PVector(width/2,280);
  int w = 60;
  int speed = 5;
  
 void show()
 {
  noStroke();
  fill(0,0,255);
  rect(pos.x,pos.y, w, 10,10);
 }
 
 void move()
 {
  if (playerDir == 1){
    pos.x += speed;
  }
  if (playerDir == 2){
    pos.x -= speed;
  }
  
  if (pos.x <= 0){
    playerDir = 0;
  }
  if (pos.x + w >= width){
    playerDir = 0;
  }
 }
  
}
