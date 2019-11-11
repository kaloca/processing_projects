class Rec {

  int x = 200;
  float y = 0;
  int rw;
  float rh;
  int dir = 1;
  boolean printImpact;

  Rec (int rh, int rw) {

    this.rw = rw;
    this.rh = rh;
  }
  void show() {
    rect (this.x, this.y, this.rw, this.rh);
  }
  void fall() {

    this.y += gravVel * this.dir;

    if (this.y + this.rh >=  350 -4) {
      this.dir = 0;
      if(!printImpact){
       println("Impact"); 
       printImpact = true;
      }
    } else {
      this.dir = 1;
    }
  }

  void control() {
    if (mouseControl) {
      this.x = mouseX - this.rw/2;
      this.y = mouseY - this.rh/2;
    }
  }
}
