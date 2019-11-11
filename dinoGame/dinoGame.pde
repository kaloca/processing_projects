PImage din;
PImage rok;
PImage back;

void setup() {
  frameRate (60);
  size(600, 400);
  din = loadImage("dino.png");
  rok = loadImage("rock.png");
  back = loadImage("background.jpg");
}

float sec = 0;
int i = 0;
float speed = 6;
int num= 0;
int frames = 0;
int r = floor(random (50, 90));
int pts = 0;
float t;
float acc = 0.0008;

Dino dino = new Dino();

ArrayList <Rock> rocks = new ArrayList <Rock>(3);


void keyPressed() {

  if (key == ' ') {
    dino.jump();
    loop();
  }
}

void draw() {

  pts++;
  speed += acc;
  println("speed :" + speed + "m/s");
  background(245);
  fill(0,145,0,200);
  rect(0,240,600,160);
  fill(140,140,255,150);
  rect(0,0,600,240);
  line(0, 240, 600, 240);
  textSize (25);
  fill(0);  
  text(pts, 20, 40);
  
  frames++;
  sec = frames/60;
  //println ("sec: " + sec);

  num++;


  //while (dino.isJumping) {




  //  }





  for (int i = rocks.size()-1; i > 0; i--) {
    Rock rock = rocks.get(i);

    rock.show();
    rock.move();
    if (rock.edges()) {

      rocks.remove(i);
    }
    if (rock.isDead()) {
      pts = 0;
      noLoop();
      speed = 6;
      for (int j = rocks.size()-1; j >= 0; j--) {
        rocks.remove(j);
      }
    }
  }
  if (num == r ) {

    rocks.add(new Rock());
    num = 0;
    r = floor(random (30, 100));
    
  }
  
  dino.show();  
}
