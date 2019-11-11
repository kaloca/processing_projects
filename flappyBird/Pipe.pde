class Pipe {

  int y = 0;
  int speed = - 2;
  int w = 40;
  int x = 500;
  int h;
  int space = 115;
  boolean dead, red;

  Pipe() {
    if (!superpipes) {
      this.h = ceil(random(40, height -140));
    } else {
      this.h = ceil(random(height -140));
    }
  }

  void show() {
    if (red) {
      fill (255, 0, 0);
    }
    stroke(0);
    strokeWeight(1.5);
    rect(this.x, this.y -1, this.w, this.h);
    rect(this.x, this.h + space, this.w, height-this.h + space); 
    strokeWeight(2);
    rect(this.x - 5, this.h -20, this.w+10, 20);
    rect(this.x - 5, this.h + space -20, this.w+10, 20);
  }
  void move() {
    if (!superspeed) {
      this.x+= speed;
    } else {
      this.x+= speed*2;
    }
  }
}
