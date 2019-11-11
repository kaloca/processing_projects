int playerDir;
ArrayList<Brick> bricks;
int columns = 8;
int rows = 4;
PImage back;
PImage brck;

void setup()
{
  size(400, 300);


  bricks = new ArrayList<Brick>(columns);
  // bricks.add(new Brick (20, 40) );
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns +1; j++) {
      bricks.add(new Brick (j * width/columns, 25*i) );
    }
  }
  back = loadImage("back.jpg");
  brck = loadImage("brick.png");
}

Paddle pad = new Paddle();
Ball ball = new Ball();

void keyPressed()
{ 
  if (key == 'd' || keyCode == RIGHT)
  {
    playerDir = 1;
    //print("d");
  } else if (key == 'a' || keyCode == LEFT) {
    playerDir = 2;
    //print("a");
  } else {
    playerDir = 0;
  }
}

void draw()
{
  if (!ball.isDead){
  image(back,0,0,width,height);

  pad.show();
  pad.move();

  ball.show();
  ball.move();
  ball.checkEdge();
  ball.checkHit();

  beginShape();
  //translate(10,10);
  fill(124,10,2);
  
  for (Brick b : bricks) {  
    b.show();
  }
  endShape();

  for (int i = bricks.size()-1; i >= 0; i--) {
    Brick b = bricks.get(i);
    
    
    if (b.circleRect(ball.pos.x, ball.pos.y, ball.r, b.x, b.y, b.w, b.h)) {
      bricks.remove(bricks.get(i)); 
      ball.changeDir();
    }
  }
  } else {
    background(255,0,0);
  }
}
