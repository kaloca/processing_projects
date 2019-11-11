class Object {
  PVector pos, vel, accel;
  float mass, wi, he, rad;

  Object(float m, float x, float w, float h, float v) {
    this.vel = new PVector(v, 0);
    this.accel = new PVector(0, 0);
    this.mass = m;
    this.he = h;
    this.wi = w;
    this.pos = new PVector(x, height - this.he);
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
    rect (this.pos.x, this.pos.y, this.wi, this.he);
  }
  void edges() {
    if (this.pos.x + this.wi > width) {
      this.pos.x = width - this.wi;
      this.vel.x *= -1;
    }
    if (this.pos.x < 0) {
      this.pos.x = 0;        
      this.vel.x *= -1;
    }
  }
}
void flip() {
  PVector f1 = new PVector(o2.mass * this.o2.vel.x,0/100);
  //PVector f2 = new PVector(o2.mass * this.o2.vel.x,0);
  //PVector f2 = new PVector(

  //o1.applyForce();
  o1.applyForce(f1);
  
}
