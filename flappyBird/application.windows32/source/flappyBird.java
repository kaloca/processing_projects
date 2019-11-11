import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class flappyBird extends PApplet {

ArrayList<Pipe> pipes;
int frames;
boolean superspeed;
boolean superpipes;
boolean deadd;

int time = 140;
int points;
int hscore;

PImage back;
PImage bird;

ArrayList<Image> imgs, imgs2;
boolean dead, dead2;

public void setup() {

  
  frameRate(60);

  pipes = new ArrayList<Pipe>();
  pipes.add(new Pipe());

  back = loadImage("Background.png");
  bird = loadImage("flappy.png");

  imgs = new ArrayList<Image>();
  imgs.add(new Image(width));
  imgs2 = new ArrayList<Image>();
  imgs2.add(new Image(0));
}

Bird b = new Bird();
Scoreboard s = new Scoreboard();

public void keyPressed() {
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
public void mousePressed() {
  if  (deadd) {
    deadd = false;
    b.y = height/2;
    b.tilt = PI/2;
    b.speed = 0;
  }
}

public void draw() {
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
class Bird {

  float x = 70;
  float y = 30;
  float r = 15;
  float d = r*2;

  float speed;
  float accel = 0.3f;
  float tilt = PI/2;
  boolean dead;
  boolean isBest;

  float fitness = 0;


  public void show() {
    fill (255, 255, 0);
    //ellipse(this.x, this.y, d, d);

    push();
    translate(this.x, this.y);
    rotate(radians(270));
    rotate(tilt);
    println("TILT: "+tilt);
    image(bird, 0-r-5, 0-r, d+10, d);
    pop();

    // pop();
  }

  public void move() {
    speed += accel;
    this.y += speed;
    if (this.tilt < PI) { 
      this.tilt += radians(1);
    }
    
    //this.y = mouseY;
  }
  public void jump() {  
    if (this.tilt >= 0 && this.tilt <= radians(100)) {
      this.tilt = radians (74);
    } else {
      this.tilt -= radians(50);
    }
    this.speed = -5.7f;
  }

  public boolean circleRect(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

    // temporary variables to set edges for testing
    float testX = cx;
    float testY = cy;

    // which edge is closest?
    if (cx < rx)         testX = rx;      // test left edge
    else if (cx > rx+rw) testX = rx+rw;   // right edge
    if (cy < ry)         testY = ry;      // top edge
    else if (cy > ry+rh) testY = ry+rh;   // bottom edge

    // get distance from closest edges
    float distX = cx-testX;
    float distY = cy-testY;
    float distance = sqrt( (distX*distX) + (distY*distY) );

    // if the distance is less than the radius, collision!
    if (distance <= radius) {
      return true;
    }
    return false;
  }

  public Bird gimmeBaby() {
    Bird baby = new Bird();
    //baby.brain = brain.clone();//babies have the same brain as their parents
    return baby;
  }
}
//class Brain {
  




// void mutate() {
//    float mutationRate = 0.01;//chance that any vector in directions gets changed
    
//  }
//}
class Image {
  int x;
  int ispeed = -1;
  Image(int x) {
    this.x = x;
  }
  public void show() {
    image (back, this.x, 0, width, height);
  }
  public void move() {
    this.x += ispeed;
  }
}

//---- CHECKING EDGES -----------------------------------------------------

public void parallax() {
  for (int i = imgs.size()-1; i >= 0; i--) {
    imgs.get(i).show();
    imgs.get(i).move();

    //println("Size: " + imgs.size());

    if (imgs.get(i).x < 0 && !dead) {
      //println("dsgsdg");
      dead = true;
      iremove(i);
    }
  }
  for (int i = imgs2.size()-1; i >= 0; i--) {
    imgs2.get(i).show();
    imgs2.get(i).move();

    //println("Size2: " + imgs2.size());

    if (imgs2.get(i).x + width < 0 && !dead2) {
      //println("dsgsdg");
      dead2 = true;
      jremove(i);
    }
  }
}

//---- REMOVING IMAGES -----------------------------------------------------

public void iremove(int i) {
  if (dead && imgs.size() < 3) {
    imgs.add(new Image(width));
    //imgs.remove(i);
    dead = false;
    if (imgs.size() > 2) {
      imgs.remove(i);
    }
  }
}

public void jremove(int j) {
  if (dead2 && imgs2.size() < 3) {
    imgs2.add(new Image(0));
    //imgs.remove(i);
    dead2 = false;
    if (imgs2.size() > 2) {
      imgs2.remove(j);
    }
  }
}
class Pipe {

  int y = 0;
  int speed = - 2;
  int w = 40;
  int x = 500;
  int h;
  int space = 115;
  boolean dead;
  boolean red;

  Pipe() {
    if (!superpipes) {
      this.h = ceil(random(40, height -140));
    } else {
      this.h = ceil(random(height -140));
    }
  }

  public void show() {
    if (red) {
      fill (255, 0, 0);
    }
    stroke(0);
    strokeWeight(1.5f);
    rect(this.x, this.y -1, this.w, this.h);
    rect(this.x, this.h + space, this.w, height-this.h + space); 
    strokeWeight(2);
    rect(this.x - 5, this.h -20, this.w+10, 20);
    rect(this.x - 5, this.h + space -20, this.w+10, 20);
  }
  public void move() {
    if (!superspeed) {
      this.x+= speed;
    } else {
      this.x+= speed*2;
    }
  }
}
//class Population {
//  Bird[] birds;

//  float fitnessSum;
//  int gen = 1;

//  int bestBird = 0;

//  Population(int size) {
//    birds = new Bird[size];
//    for (int i = 0; i< size; i++) {
//      birds[i] = new Bird();
//    }
//  }

//  //------------------------------------------------------------------------------------------------------------------------------
//  void show() {
//    for (int i = 1; i< birds.length; i++) {
//      birds[i].show();
//    }
//    birds[0].show();
//  }
//  void update() {
//    for (int i = 0; i< birds.length; i++) {
//      birds[i].move();
//    }
//    String genNum = str(gen);
//    textSize(15);
//    text("Generation " + genNum, 20, 20);
//  }
//}

//void calculateFitness() {
//  for (int i = 0; i< dots.length; i++) {
//    dots[i].calculateFitness();
//  }
//}

//boolean allBirdsDead() {
//  for (int i = 0; i< dots.length; i++) {
//    if (!birds[i].dead) { 
//      return false;
//    }
//  }
//  return true;
//}
////------------------------------------------------------------------------------------------------------------------------------
//void evolution() {
//  Bird[] newBirds = new Bird[birds.length];//next gen
//  setBestBird();
//  calculateFitnessSum();

//  //the champion lives on 
//  newBirds[0] = birds[bestBird].gimmeBaby();
//  newBirds[0].isBest = true;
//  for (int i = 1; i< newBirds.length; i++) {
//    //select parent based on fitness
//    Bird parent = selectParent();

//    //get baby from them
//    newBirds[i] = parent.gimmeBaby();
//  }
//  birds = newBirds.clone();
//  gen ++;
//}
//void calculateFitnessSum() {
//  fitnessSum = 0;
//  for (int i = 0; i< dots.length; i++) {
//    fitnessSum += dots[i].fitness;
//  }
//}

////-------------------------------------------------------------------------------------------------------------------------------------

//Bird selectParent() {
//  float rand = random(fitnessSum);


//  float runningSum = 0;

//  for (int i = 0; i< birds.length; i++) {
//    runningSum+= birds[i].fitness;
//    if (runningSum > rand) {
//      return birds[i];
//    }
//  }

//  //should never get to this point

//  return null;
//}

////------------------------------------------------------------------------------------------------------------------------------------------

//void mutateBabies() {
//  for (int i = 1; i< birds.length; i++) {
//    birds[i].brain.mutate();
//  }
//}

////---------------------------------------------------------------------------------------------------------------------------------------------

//void setBestBird() {
//  float max = 0;
//  int maxIndex = 0;
//  for (int i = 0; i< birds.length; i++) {
//    if (birds[i].fitness > max) {
//      max = birds[i].fitness;
//      maxIndex = i;
//    }
//  }

//  bestBird = maxIndex;
  
//  }
//}
class Scoreboard {
  
  
  public void show(int score, int hscore){
      fill(255);
      noStroke();
      rect(70,140,width-140,160,20);
      fill(100);
      text("Score: " + score, 100,180);
      text("Highest Score: " + hscore, 100,230);
      fill(180);
      stroke(130);
      strokeWeight(2);
      rect(60,250,width-120,50,20);
      fill(20);
      text("Click to Play Again", 80,285);
  }
  
  
}
  public void settings() {  size(430, 440, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "flappyBird" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
