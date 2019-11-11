class Rock {

  float x = 600;
  int y = 210;
  int w = floor(random (30, 70));
  int h = floor(random (30, 50));

  void show() {

    image(rok,this.x, this.y, w, h);
  }
  void move() {

    this.x -= speed;
  }

  boolean edges() {
    if (this.x < 0 - w) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean isDead() {
    
    if (dino.y + dino.h >= this.y && dino.x >= floor(this.x) && dino.x < this.x + this.w){
      print(" rwusgh" );
      return true;
    }  else  {
      return false;
    }
    
    
  }
  
}
