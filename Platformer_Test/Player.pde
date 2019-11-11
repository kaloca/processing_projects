class Player {

  int x = 150;
  float y = 270;
  float w = 45;
  int h = 50;
  float yspeed;
  float yaccel;
  float xspeed;
  float xrspeed;
  boolean isJumping;
  boolean canJump;
  boolean running;
  int dir;
  int landingSpot = groundLevel - h;


  void show() {
    yspeed += yaccel;
    y += yspeed;
    landed_check();

    xspeed = 5 * dir;
    xrspeed = 7 * dir;
    fill(0);
    rect(x, y, w, h);
  }
  void jump() {
    if ( canJump ) {
      canJump = false;
      isJumping = true;
      yspeed = -16;
      yaccel = 0.82;
    }
  }
  void landed_check() {
    if ( y >= landingSpot ) {
      y = landingSpot;
      yspeed = 0;
      yaccel = 0;
      isJumping = false;
      canJump = true;
    }
  }
  void move() {
    if (!running) {
      x += xspeed;
    }    
    if (running) {
      x += xrspeed;
    }
  }
  void checkBrick (Brick b) {

    if (isJumping && y + h< b.y && x + h > b.x && x < b.x + b.w) {
      y = b.y - h;
      yspeed = 0;
      yaccel = 0;
      isJumping = false;
      canJump = true;
    }
    if (!isJumping && x > b.x + b.h && y < b.y || !isJumping && x + w < b.x + b.h && y < b.y){
      canJump = false;
      isJumping = true;
      yspeed = 12;
      yaccel = 0.82;  
    }
  }
}
