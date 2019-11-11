class bullet
{
  float x, y;
  boolean isDead = false;
  int shotSpeed = 7;
  int size = 5;
  
  bullet(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void show()
  {
      ellipse(this.x, this.y, size, size); 
  }
    
  
  void shoot()
  {
   this.y -= shotSpeed; 
  }
  
  boolean edge()
  {
    if (this.y < 0)
    {
      return true;
    }
    
    else {return false;}
  }
  
  void die()
  {
    this.isDead = true;
  }
  
}
