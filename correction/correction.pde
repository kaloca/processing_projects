  PVector end = new PVector();


float[] movement(float r, float L, PVector dest) {

  float d = 2*PI*r/360;
  float h = L/sqrt(3);

  //println ("h:",h);

  PVector A = new PVector(0, h);
  PVector B = new PVector(L/2, -h/2);
  PVector C = new PVector(-L/2, -h/2);
  
  println("jkesg"+A.x);
  //println ("B.x:", B.x,"B.y:", B.y);
  //println ("C.x:", C.x,"C.y:", C.y);


  float AS = sqrt( pow(dest.x, 2) + pow(h-dest.y, 2) );
  float BS = sqrt( pow(dest.x - B.x, 2) + pow(dest.y - B.y, 2) );
  float CS = sqrt( pow(dest.x - C.x, 2) + pow(dest.y - C.y, 2) );

  //println(h, d, AS, BS, CS);
  println("AS:", AS, "BS:", BS, "CS:", CS);
  //println("d:",d);

  //println (abs(h-AS), abs(h-BS), abs(h-CS));
  float[] output = {(h-AS)/d, (h-BS)/d, (h-CS)/d};

  translate(200, 200);
  triangle(A.x, -A.y, B.x, -B.y, C.x, -C.y); 
  line(A.x, -A.y, dest.x, dest.y);
  line(B.x, -B.y, dest.x, dest.y);
  line(C.x, -C.y, dest.x, dest.y);



  return output;
}

void setup() {

  size(400, 400);
  noSmooth();


  
}

void draw() {
  fill(255);
  end.x = mouseX-200;
  end.y = mouseY-200;
    background(100);

  float[] res = movement (1,100*sqrt(3), end);
  println ("A:", res[0]);
  println ("B:", res[1]);
  println ("C:", res[2]);
  fill(0);
  text ("(" + end.x + "," + end.y + ")",mouseX-180,mouseY-180);
  
}

void mousePressed(){
  mouseX = 200;
  mouseY = 200;
}
