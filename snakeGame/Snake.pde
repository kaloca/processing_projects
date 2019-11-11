class Snake {
  ArrayList<PVector> body;  
  int x ;
  int y ;
  int w = 1;
  int xspeed;
  int yspeed;
  int size = 1;

  Snake() {
    this.body = new ArrayList<PVector>();
    this.body.add(new PVector(5, 5) );
  }

  void show() {

    for (int i = 0; i < this.body.size(); i++) {
      fill(255,250);
      stroke(0);
      strokeWeight(0.01);
      rect(this.body.get(i).x, this.body.get(i).y, 1, 1);
    }
  }
  void move() {
    PVector head = this.body.get(this.body.size() - 1).copy(); 
    this.body.remove(0); 
    head.x += this.xspeed; 
    head.y += this.yspeed; 
    this.body.add(head); 
    x = floor(head.x); 
    y = floor(head.y);
    println("x: "+ x + "  y: "+y);
    if (x > 20) {
      head.x = 0;
    } else if (x < 0) {
      head.x = 19;
    }
    if (y > 20) {
      head.y = 0;
    } else if (y < 0) {
      head.y = 19;
    }

    for (int i = 0; i < this.body.size() - 1; i++) {
      PVector part = this.body.get(i);
      if (part.x == x && part.y == y) {
        fill(255,0,0);
        rect(0,0,width,height);
        noLoop();
      }
    }
  }
  void update() {

    switch (dir) {
    case -1 : 
      xspeed = -1; 
      yspeed = 0; 
      break; 
    case 1 : 
      xspeed = 1; 
      yspeed = 0; 
      break; 
    case -2 : 
      yspeed = 1; 
      xspeed = 0; 
      break; 
    case 2 : 
      yspeed = -1; 
      xspeed = 0; 
      break;
    }
  }

  void grow() {
    PVector head = this.body.get(this.body.size() - 1).copy(); 
    this.body.add(head);
  }
}
