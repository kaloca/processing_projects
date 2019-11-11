class Object {
  PVector pos, vel, accel;
  float mass, wi, he, rad;

  Object(float m) {
    this.pos = new PVector(random(60, width), random(40, height- 80));
    this.vel = new PVector(0, 0);
    this.accel = new PVector(0, 0);
    this.mass = m;
    this.he = m*16;
    this.wi = m*16;
    this.rad = wi/2;
  }
  void update() {
    this.vel.add(accel);
    this.pos.add(vel);
    this.accel.mult(0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, this.mass);
    // f.div(this.mass);
    this.accel.add(f);
  }

  void show() {
    ellipse (this.pos.x, this.pos.y, this.wi, this.he);
  }
  void edges() {
    if (this.pos.x + this.rad > width) {
      this.pos.x = width - this.rad;
      this.vel.x *= -1;
    }
    if (this.pos.x - this.rad < 0) {
      this.pos.x = this.rad;        
      this.vel.x *= -1;
    }
    if (this.pos.y + this.rad > height) {
      this.pos.y = height - this.rad;
      this.vel.y *= -1;
    }
    if (this.pos.y - this.rad < 0) {
      this.pos.y = this.rad;
      this.vel.y *= -1;
    }
  }
}
