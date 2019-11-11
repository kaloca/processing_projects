PVector wind = new PVector(0., 0);
PVector weight = new PVector();
ArrayList<Object> objs;
int size = 40;
float gravity = 0.0981;

void setup() {
  size(400, 400, P2D);
  objs = new ArrayList<Object>();
  for (int i = 0; i <= size; i++) {
    objs.add(new Object(random(3)));
  }
}

void mousePressed() {
  wind.x = 0.0;
}
void mouseReleased() {
  wind.x = 0.01;
}


void draw() {
  background(120);

  for (Object o : objs) {
    wind.x = random (-0.1, 0.1);

    weight.y = o.mass*gravity;
    o.show();
    o.update();
    o.applyForce(wind);
    o.applyForce(weight);
    o.edges();
  }
  //mover.applyForce(gravity);
  println("Wind: "+ wind.x);
}
