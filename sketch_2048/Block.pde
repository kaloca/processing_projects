class Block {

  float x;
  float y;
  int size = 100;

  float xspeed;
  float yspeed;

  float xaccel = 1;
  float yaccel = 1;
  
  int xd = 0;
  int yd = 0;

  color bcolor = color(239, 227, 185);

  Block(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void show() {
    fill(bcolor);
    rect(this.x, this.y, size, size, 10);
  }

  void move() {

    this.x += xspeed*xdir;
    this.y += yspeed*ydir;

    if (xdir != 0) {
      this.xspeed += this.xaccel;
    }
    if (ydir != 0) {
      this.yspeed += this.yaccel;
    }

    if (this.x > 367) {
      this.xspeed = 0;
      this.x = 366;
    }
    if (this.x < 35) {
      this.xspeed = 0;
      this.x = 36;
    }
    if (this.y > 467) {
      this.y = 462;
      this.yspeed = 0;
      
    }
    if (this.y < 133) {
      this.yspeed = 0;
      this.y = 132;
    }
    if (this.yspeed != 0) {
      this.xspeed = 0;
    }
    if (this.xspeed != 0) {
      this.yspeed = 0;
    }
  }
}
