class Piece {
  PVector ppos;
  PVector pos;
  boolean isWhite, moving, taken;
  PImage img;

  Piece(int x, int y, boolean clr) {
    this.pos = new PVector (x, y);
    this.ppos = new PVector (x * 50 + 25, y * 50 + 25);
    this.isWhite = clr;
  }
  void show() {
    ellipse(this.ppos.x, this.ppos.y, 40, 40);
  }
  boolean canMove(float x, float y, int x_, int y_){
    return true; 
  }
  void die(){
   if (this.taken){
     this.pos.x = 10;
     this.pos.y = 10;
  }
  }
}

class Tower extends Piece {
  PImage img;

  Tower (int x, int y, boolean clr) {
    super (x, y, clr);
  }
  void show() {
    if (this.isWhite) this.img = tw;
    else this.img = tb;
    imageMode(CENTER);
    if (!taken) {
      if (!moving) image(this.img, this.ppos.x, this.ppos.y, 40, 40);
      if (moving) image(this.img, mouseX, mouseY, 40, 40);
    }
  }
  boolean canMove(float x, float y, int x_, int y_){
    if ((int)x == x_ && y != y_ || x != x_ && (int)y == y_) return true;
    else return false;
  }
  
}
class Knight extends Piece {
  Knight (int x, int y, boolean clr) {
    super (x, y, clr);
    if (this.isWhite) this.img = kw;
    else this.img = kb;
  }
  void show() {
    if (this.isWhite) this.img = kw;
    else this.img = kb;
    imageMode(CENTER);
    if (!taken) {
      if (!moving) image(this.img, this.ppos.x, this.ppos.y, 40, 40);
      if (moving) image(this.img, mouseX, mouseY, 40, 40);
    }
  }
  boolean canMove (float x, float y, int x_, int y_){
  if ((int)x + 2 == x_ && (int)y + 1 == y_ || (int)x - 2 == x_ && (int)y + 1 == y_ || (int)x - 2 == x_ && (int)y - 1 == y_ || (int)x + 2 == x_ && (int)y - 1 == y_ ||
    (int)x + 1 == x_ && (int)y + 2 == y_ || (int)x + 1 == x_ && (int)y - 2 == y_ || (int)x - 1 == x_ && (int)y + 2 == y_ || (int)x - 1 == x_ && (int)y - 2 == y_) return true;
    else return false;
  }
}

class Bishop extends Piece {
  Bishop (int x, int y, boolean clr) {
    super (x, y, clr);
    if (this.isWhite) this.img = bw;
    else this.img = bb;
  }
  void show() {
    if (this.isWhite) this.img = bw;
    else this.img = bb;
    imageMode(CENTER);
    if (!taken) {
      if (!moving) image(this.img, this.ppos.x, this.ppos.y, 40, 40);
      if (moving) image(this.img, mouseX, mouseY, 40, 40);
    }
  }
  boolean canMove(float x, float y, int x_, int y_){
   if (abs(x - x_) == abs(y - y_)) return true;
   else return false;
  }
}
class Queen extends Piece {
  Queen (int x, int y, boolean clr) {
    super (x, y, clr);
    if (this.isWhite) this.img = qw;
    else this.img = qb;
  }
  void show() {
    if (this.isWhite) this.img = qw;
    else this.img = qb;
    imageMode(CENTER);
    if (!taken) {
      if (!moving) image(this.img, this.ppos.x, this.ppos.y, 40, 40);
      if (moving) image(this.img, mouseX, mouseY, 40, 40);
    }
  }
  boolean canMove(float x, float y, int x_, int y_){
    if ((int)x == x_ && y != y_ || x != x_ && (int)y == y_ || abs(x - x_) == abs(y - y_)) return true;
    else return false;
  }
}

class King extends Piece {
  King (int x, int y, boolean clr) {
    super (x, y, clr);
    if (this.isWhite) this.img = kkw;
    else this.img = kkb;
  }
  void show() {
    if (this.isWhite) this.img = kkw;
    else this.img = kkb;
    imageMode(CENTER);
    if (!taken) {
      if (!moving) image(this.img, this.ppos.x, this.ppos.y, 40, 40);
      if (moving) image(this.img, mouseX, mouseY, 40, 40);
    }
  }
  boolean canMove(float x, float y, int x_, int y_){
    if ((int)x + 1 == x_ && y == y_ || (int) x != x_ && (int)y + 1 == y_ || (int) x + 1 == x_ && (int)y + 1 == y_ || (int)x - 1 == x_ && (int)y + 1 == y_ || (int)x - 1 == x_ && (int)y == y_
    || (int)x - 1 == x_ && (int)y - 1 == y_ || (int)x == x_ && (int)y - 1 == y_ || (int)x + 1 == x_ && (int)y - 1 == y_ || (int)x == x_ && (int)y + 1 == y_) return true;
    else return false;
  }
}

class Pawn extends Piece {
  Pawn (int x, int y, boolean clr) {
    super (x, y, clr);
    if (this.isWhite) this.img = pw;
    else this.img = pb;
  }
  void show() {
    if (this.isWhite) this.img = pw;
    else this.img = pb;
    imageMode(CENTER);
    if (!taken) {
      if (!moving) image(this.img, this.ppos.x, this.ppos.y, 40, 40);
      if (moving) image(this.img, mouseX, mouseY, 40, 40);
    }
  }
  boolean canMove(float x, float y, int x_, int y_){
    if (this.isWhite && (int)x == x_ && y - 1== y_ && !board.isPieceAt(x_,y_) || !this.isWhite && (int)x == x_ && y + 1== y_ && !board.isPieceAt(x_,y_)) return true;
    else if (this.isWhite && this.pos.y == 6 && (int) x == x_ && (int)y - 2 == y_ && !board.isPieceAt(x_,y_)) return true;
    else if (!this.isWhite && this.pos.y == 1 && (int) x == x_ && (int)y + 2 == y_ && !board.isPieceAt(x_,y_)) return true;
    else if (board.isPieceAt(x_,y_) && (int)x - 1 == x_ && (int)y - 1 == y_&& this.isWhite) return true;
    else if (board.isPieceAt(x_,y_) && (int)x + 1 == x_ && (int)y - 1 == y_&& this.isWhite) return true;
    else if (board.isPieceAt(x_,y_) && (int)x - 1 == x_ && (int)y - 1 == y_&& this.isWhite) return true;
    else if (board.isPieceAt(x_,y_) && (int)x + 1 == x_ && (int)y + 1 == y_&& !this.isWhite) return true;
    else if (board.isPieceAt(x_,y_) && (int)x - 1 == x_ && (int)y + 1 == y_&& !this.isWhite) return true;
    
    else return false;
  }
}
