class Brick {
  int x;
  int y;
  int w = 40;
  int h = 40;
  
  Brick (int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void show(){
    
    fill(149,75,12);
    rect (this.x,this.y,w,h);
  }
  
  
}
