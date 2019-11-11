class player
{
  int x = 240;
  int y = 460;
  
  void show()
  {
    rectMode(CENTER);
    rect(x,y, 20,20);
    
    if (x < 0)
    {
      direction = 1;
    }
    if (x > 500)
    {
      direction = 2;
    }
    
  }
  void move(int direction)
  {
    if (direction == 1){
      x +=6;
    }
    if (direction == 2){
      x -=6;
    }
    
  }
  
}
