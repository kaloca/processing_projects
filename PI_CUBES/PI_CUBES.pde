PVector wind = new PVector(0.1, 0);
PVector weight = new PVector();
ArrayList<Object> objs;
int size = 2;
Object o1, o2;

void setup() {
  size(400, 400, P2D);
  objs = new ArrayList<Object>();
  o1 = new Object(1,width/2, 20,20,0);
  o2 = new Object(100,300,70,70,-1);

  objs.add(o1);
  objs.add(o2);
}

void draw() {
  background(120);

  for (Object o : objs) {

    o.show();
    o.update();
    //o.applyForce(wind);
    o.edges();
  }
  //mover.applyForce(gravity);
  println("Wind: "+ wind.x);
  if (o1.pos.x > o2.pos.x && o1.pos.x <= o2.pos.x + o2.wi){
    flip();
    print("FAF");
  }
  if (o2.pos.x > o1.pos.x && o2.pos.x <= o1.pos.x + o1.wi){
    flip();
    print("FAF");
  }
}
