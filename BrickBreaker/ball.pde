class Ball
{
  PVector pos = new PVector(width/2 -10, height - 6);
  PVector vel = new PVector(1, 1).mult(3.5);
  PVector dir = new PVector(1, 1);
  
  boolean isDead;

  int rad = 10;
  int r = rad/2;

  void show()
  {
    noStroke();
    //ellipseMode(CORNER);
    fill(0,180);
    ellipse(pos.x, pos.y, rad, rad);
  }


  void move()
  {
    pos.x = pos.x + vel.x * dir.x;
    pos.y = pos.y + vel.y * dir.y;
  }

  void checkEdge() {

    if (pos.x <= 0) {
      dir.x *= -1;
      //    return true;
    }
    if (pos.x >= width ) {
      dir.x *= -1;
      //    return true;
    }
    if (pos.y <= 0) {
      dir.y *= -1;
      //    return true;
    }
    if (pos.y - r >= height) {
      isDead = true;
      //    return true;
    } else {
      //     return false;
    }
  }
  void checkHit() {
    if (pos.y >= pad.pos.y && pos.x >= pad.pos.x && pos.x <= pad.pos.x + pad.w) {
      dir.y *= -1;
    }
  }
  void changeDir() {
    dir.y *= -1;
    //dir.x *= -1;
  }
}
