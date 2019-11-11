int dir;

void setup() {
  frameRate(10);
  size(500, 500);
}

Snake snake = new Snake();
Food food = new Food();

void keyPressed() {
  switch(key) {
  case 'a':
    if (dir != 1) {
      dir = -1;
    }
    break;
  case 'd':
    if (dir != -1) {
      dir = 1;
    }
    break;
  case 'w':
    if (dir != -2) {
      dir = 2;
    }
    break;
  case 's':
    if (dir != 2) {
      dir = -2;
    }
    break;
  }
  switch(keyCode) {
  case LEFT:
    if (dir != 1) {
      dir = -1;
    }
    break;
  case RIGHT:
    if (dir != -1) {
      dir = 1;
    }
    break;
  case UP:
    if (dir != -2) {
      dir = 2;
    }
    break;
  case DOWN:
    if (dir != 2) {
      dir = -2;
    }
    break;
  }
}

void mousePressed() {
  food.respawn();
  snake.grow();
}

void checkEat() {

  if (floor(snake.x) == floor(food.x) && floor(snake.y) == floor(food.y)) {
    food.respawn();
    snake.grow();
  }
}


void draw() {
  background(100);
  scale(floor(width/20));
  noStroke();
  snake.show();  
  snake.move();
  snake.update();
  food.show();
  checkEat();
}
