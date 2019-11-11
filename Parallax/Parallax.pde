PImage back;
int x;
ArrayList<Image> imgs, imgs2;
boolean dead, dead2;

void setup() {

  size(500, 400,P2D);
  frameRate(60);
  
//LOADING IMAGE
  back = loadImage("Background.png");
  
// ARRAYS OF IMAGES 
  imgs = new ArrayList<Image>();
  imgs.add(new Image(width));
  imgs2 = new ArrayList<Image>();
  imgs2.add(new Image(0));
}

void draw() {

  parallax();
  
}
