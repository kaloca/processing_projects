class Image {
  int x;
  int ispeed = -1;
  Image(int x) {
    this.x = x;
  }
  void show() {
    image (back, this.x, 0, width, height);
  }
  void move() {
    this.x += ispeed;
  }
}

//---- CHECKING EDGES -----------------------------------------------------

void parallax() {
  for (int i = imgs.size()-1; i >= 0; i--) {
    imgs.get(i).show();
    imgs.get(i).move();

    //println("Size: " + imgs.size());

    if (imgs.get(i).x < 0 && !dead) {
      //println("dsgsdg");
      dead = true;
      iremove(i);
    }
  }
  for (int i = imgs2.size()-1; i >= 0; i--) {
    imgs2.get(i).show();
    imgs2.get(i).move();

    //println("Size2: " + imgs2.size());

    if (imgs2.get(i).x + width < 0 && !dead2) {
      //println("dsgsdg");
      dead2 = true;
      jremove(i);
    }
  }
}

//---- REMOVING IMAGES -----------------------------------------------------

void iremove(int i) {
  if (dead && imgs.size() < 3) {
    imgs.add(new Image(width));
    //imgs.remove(i);
    dead = false;
    if (imgs.size() > 2) {
      imgs.remove(i);
    }
  }
}

void jremove(int j) {
  if (dead2 && imgs2.size() < 3) {
    imgs2.add(new Image(0));
    //imgs.remove(i);
    dead2 = false;
    if (imgs2.size() > 2) {
      imgs2.remove(j);
    }
  }
}
