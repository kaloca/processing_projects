ArrayList<Pipe> pipes;

boolean superspeed, superpipes, deadd, dead, dead2;;

int time = 140;
int points, hscore, frames;

PImage back, bird;

ArrayList<Image> imgs, imgs2;


void setup() {

  size(430, 600, P2D);
  frameRate(60);

  pipes = new ArrayList<Pipe>();
  pipes.add(new Pipe());

  back = loadImage("data/Background.png");
  bird = loadImage("data/flappy.png");

  imgs = new ArrayList<Image>();
  imgs.add(new Image(width));
  imgs2 = new ArrayList<Image>();
  imgs2.add(new Image(0));
}

Bird b = new Bird();
Scoreboard s = new Scoreboard();

void keyPressed() {
  if (deadd) {
    deadd = false;
    b.y = height/2;
    b.tilt = PI/2;
    b.speed = 0;
  }
  if (key == 'h') {
    //superspeed = true;
    superpipes = true;
  }
  if (key == 'g') {
    //superspeed = false;
    superpipes = false;
  } else {
    b.jump();
  }
}
void mousePressed() {
  if  (deadd) {
    deadd = false;
    b.y = height/2;
    b.tilt = PI/2;
    b.speed = 0;
  }
  
}

void draw() {
  if (!deadd) {
    parallax();

    //push();
    b.show();
    b.move();
    // pop();

    frames++;

    //---- ADDING PIPES -----------------------------------------------------

    if (superpipes) {
      time = 30;
    } else {
      time = 140;
    }

    if (frames % time == 0) {
      pipes.add(new Pipe());
     }

    if (frames % 120 == 0) {
      //println(pipes.size() + " pipes alive");
      println(b.speed);
    }

    //---- CHECKING COLLISIONS -----------------------------------------------

    for (int i = pipes.size()-1; i >= 0; i--) {
      fill (0, 255, 125);
      Pipe p = pipes.get(i);
      p.show();
      p.move();

      if (b.circleRect(b.x, b.y, b.r, p.x, p.y, p.w, p.h)) {
        p.red = true;
        b.dead = true;
        deadd = true;
        pipes.remove(p);
      }
      if (b.circleRect(b.x, b.y, b.r, p.x, p.y + p.h + p.space -20, p.w, width-p.h + p.space)) {
        p.red = true;
        b.dead = true;
        deadd = true;
        pipes.remove(p);
      }
      if (b.circleRect(b.x, b.y, b.r, p.x, p.h, 1, p.space)) {
        points++;
      }
      if (b.y > height) {
        b.dead = true;
        deadd = true;
        pipes.remove(p);
      }
    }
    for (int i = pipes.size() - 1; i >= 0; i--) {
      if (pipes.get(i).x + pipes.get(i).w < 0 && pipes.size() > 2) {
        pipes.remove(pipes.get(i));
      }
    }

    //-----------------------------------------------------------------
    //text(b.speed,30,30);
    fill(0);
    textSize(30);
    text(points/16, 390, 30);
    if (hscore == 0) {
      hscore = points/16;
    } else if (hscore < points/16) {
      hscore = points/16;
    }
    if (deadd) {
      s.show(points/16, hscore);
      points = 0;
    }
  }
}
