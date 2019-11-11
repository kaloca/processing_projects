class Image {
  
  int x;
  int speed = -4;
  
  Image(int x){
    this.x = x;
  }
  
  void show(){
    image (back,this.x,0,width,height);
  }
  
  void move(){
    this.x += speed;
  }
}

//---- CHECKING EDGES -----------------------------------------------------

void parallax(){
  for (int i = imgs.size()-1; i >= 0; i--) {
    imgs.get(i).show();
    imgs.get(i).move();

    if (imgs.get(i).x < 0 && !dead) {
      dead = true;
      iremove(i);
    }
  }
  
  for (int i = imgs2.size()-1; i >= 0; i--) {
    imgs2.get(i).show();
    imgs2.get(i).move();

    if (imgs2.get(i).x + width < 0 && !dead2) {
      dead2 = true;
      jremove(i);
    }
  }
}

//---- REMOVING IMAGES -----------------------------------------------------

void iremove(int i) {
  if (dead && imgs.size() < 3) {
    imgs.add(new Image(width));
    dead = false;
    if (imgs.size() > 2) {
      imgs.remove(i);
    }
  }
}

void jremove(int j) {
  if (dead2 && imgs2.size() < 3) {
    imgs2.add(new Image(0));
    dead2 = false;
    if (imgs2.size() > 2) {
      imgs2.remove(j);
    }
  }
}
