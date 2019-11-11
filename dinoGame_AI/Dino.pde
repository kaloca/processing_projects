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
    this.yspeed += this.yaccel;
    this.y += this.yspeed;
    this.landed_check();

    fill(0);
    image(din,this.x, this.y, this.w, this.h);
  }
  void jump() {
    if (this.canJump ) {
      this.canJump = false;
      this.isJumping = true;
      this.yspeed = -12;
      this.yaccel = 0.82;
    }
  }
  void landed_check() {
    if ( this.y >= 200 ) {
      this.y = 200;
      this.yspeed = 0;
      this.yaccel = 0;
      this.isJumping = false;
      this.canJump = true;
    }
  }
}
