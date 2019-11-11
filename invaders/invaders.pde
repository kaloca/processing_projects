int direction = 0;
int enemyNumber = 7;
int points = 0;

player user = new player();
ArrayList<bullet> shots = new ArrayList<bullet>(1);
ArrayList<enemy> enemies = new ArrayList<enemy>();

void setup()
{
  size(500,500);
  smooth();
 // frameRate(60);
  for (int i = 0; i < 3; i++)
  {
    for (int j = 0; j <7; j++){
    enemies.add(new enemy(j*70 + 34,  i*50 + 34));
    }
  }
}



void keyPressed()
{
  
  print(key);
 
  if(key == 'd' || keyCode == RIGHT)
  {
    direction = 1;
    //print("d");
  }
 
  else if(key == 'a' || keyCode == LEFT)
  {
    direction = 2;
    //print("a");
  }

  else if (key == ' ') 
  {
    bullet shot = new bullet(user.x, 460);
    shots.add(shot);
    //print("SPACE");
  }
  
  else
  {
    direction = 0; 
  } 
  
}

void keyReleased()
{
  if (key != ' '){
  //direction = 0;
  }
}

void draw()
{
  background(0,100,120);
  user.show();
  user.move(direction);
  
  for(bullet s : shots)
  {
    s.show();
    s.shoot();
    if (s.edge())
    {
      s.die();
      println("dead");
    }
  }
  
  for (int i = shots.size()-1; i >= 0; i--) 
  {
    bullet s = shots.get(i);
    if (s.isDead) 
    {
      shots.remove(i);
    }
    for (int k = 0; k < enemies.size(); k++)
    {
     if (dist(s.x,s.y, enemies.get(k).x, enemies.get(k).y) < s.size/2 + enemies.get(k).size/2)
     { 
       s.die();
       enemies.remove(k);
       println("hit");
       points ++;
     }
    }
  }
  
  for (int i = 0; i < enemies.size(); i++)
  {
    enemies.get(i).show();
  }
  
  for (int i = enemies.size()-1; i >= 0; i--) 
  {
    if (enemies.get(i).isDead) 
    {
      
    }
  }
  textSize(30);
  text(points/2,460,460);
}
