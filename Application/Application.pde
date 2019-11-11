boolean pressed;
int r = floor( random(10));

void setup() {
  size (200, 200);
  background(40, 180, 255);
  textSize (90);
}
void keyPressed() {
  if (key == ' ') {
    pressed = true; 
    if (r == 7) {
      print ("passed");
    } else {
      print ("se fudeu");
    }
  }
}
void draw() {

  if (pressed) {
    text(r, 70, 100);
  }
}
