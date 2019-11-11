class Object {

  float x = 300;
  float y;

  int ew; // cm
  int eh; 
  int rw;
  int rh;

  float density = 7.87; //  g/cm^3
  float mass; // g
  float volume; // cm^3
  float weight; // 
  float Cd = 1.05; // Drag Coeffiecient
  float D; //Drag
  float vel = 5;
  float force;
  float accel;



  String type;

  Object (int w, int h, String type) {
    this.type = type;
    this.volume = w*w*h;
    this.mass = this.volume / density;
    this.weight = mass*gravAccel;


    this.D = Cd * (( this.density * this.vel * this.vel) /2 ) * w*w;
    this.force = this.weight - this.D;
    this.accel = this.force / this.mass;

    switch (type) {
    case "rect":
      this.rw = w;
      this.rh = h;
      break;
    case "ellipse":
      this.ew = w;
      this.eh = h;
      break;
    }
  }

  void exist() {


    if (this.type == "rect") {

      rect (this.x, this.y, rw, rh);

      if (mouseControl) {
        this.x = mouseX - this.rw/2;
        this.y = mouseY - this.rh/2;
      }
    }

    if (this.type == "ellipse") {


      ellipse (x, y, ew, eh);

      if (mouseControl) {
        this.x = mouseX + this.ew/6;
        this.y = mouseY + this.eh/6;
      }
    }
  }

  void gravity() {
    this.vel += accel/500;
    this.y += this.vel;

    if (type == "rect")
      if (this.y + this.rh > ground) {
        this.vel = 0;
        this.accel = 0;
      }
  if (type == "ellipse")
      if (this.y - this.eh > ground) {
        this.vel = 0;
        this.accel = 0;
      }
  }
}
