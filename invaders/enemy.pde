class enemy
{
  float x, y;
  boolean isDead = false;
  int size = 40;
  
  enemy(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void show()
  {
      if (!isDead){
      noStroke();
      fill(255,255,255,200);
      ellipseMode(CENTER);
      ellipse(this.x, this.y, size, size); 
      }  
}
      
  void die()
  {
    this.isDead = true;
  }
  
}
