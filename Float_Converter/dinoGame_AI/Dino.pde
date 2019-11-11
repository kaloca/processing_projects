class Dino {
  
  int x = 150;
  float y = 200;
  float w = 45;
  float h = 50;
  float yspeed;
  float yaccel;
  boolean isJumping;
  boolean canJump;


  void show() {
    yspeed += yaccel;
    y += yspeed;
    landed_check();

    fill(0);
    image(din,x, y, w, h);
  }
  void jump() {
    if ( canJump ) {
      canJump = false;
      isJumping = true;
      yspeed = -12;
      yaccel = 0.82;
    }
  }
  void landed_check() {
    if ( y >= 200 ) {
      y = 200;
      yspeed = 0;
      yaccel = 0;
      isJumping = false;
      canJump = true;
    }
  }
}
