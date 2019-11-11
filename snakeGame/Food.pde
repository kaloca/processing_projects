class Food {
  int x = 1;
  int y = 1;
  
  void show() {
    fill(255, 0, 0);
    rect(x, y, 1, 1);
  }
  void respawn() {
    x = floor(random(19));
    y = floor(random(19));
  }
  
  
}
