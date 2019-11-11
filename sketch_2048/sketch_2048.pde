int xdir = 0;
int ydir = 0;

ArrayList<Block> blocks;

void setup() {

  size(500, 600);
  blocks = new ArrayList<Block>();
}



void keyPressed() {

  blocks.add(new Block(36, 134));
  switch (keyCode) {
  case RIGHT:
    xdir = 1;
    break;
  case LEFT:
    xdir = -1;
    break;
  case UP:
    ydir = -1;
    break;
  case DOWN:
    ydir = 1;
    break;
  }
}



void draw() {

  background(#FFD919); 
  textSize(60);
  PFont font = createFont("ClearSans-Bold.ttf",60);
  textFont(font);
  noStroke();


  fill(230);
  rect (25, 25, width - 50, height - 50, 10);

  fill(174);
  for (int i = 0; i <4; i++) {
    for (int j = 0; j < 4; j++) {
      rect(110*i + 36, 110*j + 134, 100, 100, 10);
    }
  }
  for (Block b : blocks) {
    b.show();
    b.move();
    b.xd = xdir;
    b.yd = ydir;
  }
  fill (255);
  text("2048", 40, 90);
}
