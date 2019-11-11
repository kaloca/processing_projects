class Bird {

  float x = 70;
  float y = 30;
  float r = 15;
  float d = r*2;

  float speed;
  float accel = 0.3;
  float tilt = PI/2;
  boolean dead;
  boolean isBest;

  float fitness = 0;


  void show() {
    fill (255, 255, 0);
    //ellipse(this.x, this.y, d, d);

    push();
    translate(this.x, this.y);
    rotate(radians(270));
    rotate(tilt);
    println("TILT: "+tilt);
    image(bird, 0-r-5, 0-r, d+10, d);
    pop();

    // pop();
  }

  void move() {
    speed += accel;
    this.y += speed;
    if (this.tilt < PI) { 
      this.tilt += radians(1);
    }
    
    //this.y = mouseY;
  }
  void jump() {  
    if (this.tilt >= 0 && this.tilt <= radians(100)) {
      this.tilt = radians (74);
    } else {
      this.tilt -= radians(50);
    }
    this.speed = -5.7;
  }

  boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

    // temporary variables to set edges for testing
    float testX = cx;
    float testY = cy;

    // which edge is closest?
    if (cx < rx)         testX = rx;      // test left edge
    else if (cx > rx+rw) testX = rx+rw;   // right edge
    if (cy < ry)         testY = ry;      // top edge
    else if (cy > ry+rh) testY = ry+rh;   // bottom edge

    // get distance from closest edges
    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      return true;
    }
    return false;
  }

  Bird gimmeBaby() {
    Bird baby = new Bird();
    //baby.brain = brain.clone();//babies have the same brain as their parents
    return baby;
  }
}
