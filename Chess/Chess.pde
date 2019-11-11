int rows = 8;
int cols = 8;
int coflor;
PImage tw, kw, bw, qw, kkw, pw, tb, kb, bb, qb, kkb, pb; 
Board board = new Board();


void setup() {
  size(400, 400);
  tw = loadImage("Pieces/tw.png");
  tb = loadImage("Pieces/tb.png");
  kw = loadImage("Pieces/kw.png");
  kb = loadImage("Pieces/kb.png");
  bw = loadImage("Pieces/bw.png");
  bb = loadImage("Pieces/bb.png");
  qw = loadImage("Pieces/qw.png");
  qb = loadImage("Pieces/qb.png");
  kkw = loadImage("Pieces/kkw.png");
  kkb = loadImage("Pieces/kkb.png");
  pw = loadImage("Pieces/pw.png");
  pb = loadImage("Pieces/pb.png");
}

void mousePressed() {

  for (int i = 0; i < board.whitePieces.size(); i++) {
    Piece p = board.whitePieces.get(i);
    float x = p.ppos.x - 25;
    float y = p.ppos.y - 25;

    //print(p.ppos.x,p.ppos.y);
    if (mouseX > x && mouseX < x + 40 && mouseY > y && mouseY < y + 40) {
      board.whitePieces.get(i).moving = true;
    }
  }
  //print(p.pos.x, p.pos.y);


  for (int i = 0; i < board.blackPieces.size(); i++) {
    Piece p = board.blackPieces.get(i);
    float x = p.ppos.x - 25;
    float y = p.ppos.y - 25;

    //print(p.ppos.x,p.ppos.y);
    if (mouseX > x && mouseX < x + 40 && mouseY > y && mouseY < y + 40) {
      board.blackPieces.get(i).moving = true;
    }
  }
}

void mouseReleased() {
  int tx = ceil(mouseX/50);
  int ty = ceil(mouseY/50);
  
  for (int i = 0; i < board.whitePieces.size(); i++) {
    Piece p = board.whitePieces.get(i);
    //print(p.ppos.x,p.ppos.y);
    if (p.moving) {
      if (board.isPieceAt(tx, ty) && board.getPieceAt(tx, ty).isWhite) {
        board.whitePieces.get(i).moving = false;
        //board.whitePieces.remove(i);
      } else if (p.canMove(p.pos.x, p.pos.y, tx, ty)) {
        if (board.isPieceAt(tx, ty) && !board.getPieceAt(tx, ty).isWhite && board.getPieceAt(tx, ty) != p) {
          board.getPieceAt(tx, ty).taken = true;
          //board.whitePieces.remove(i);
        }

        board.whitePieces.get(i).pos.x = tx;
        board.whitePieces.get(i).ppos.x = tx * 50 + 25;

        board.whitePieces.get(i).pos.y = ty;
        board.whitePieces.get(i).ppos.y = ty * 50 + 25;
        board.whitePieces.get(i).moving = false;
      } else board.whitePieces.get(i).moving = false;
    }
  }
  for (int i = 0; i < board.blackPieces.size(); i++) {
    Piece p = board.blackPieces.get(i);
    //print(p.ppos.x,p.ppos.y);
    if (p.moving) {
      if (board.isPieceAt(tx, ty) && !board.getPieceAt(tx, ty).isWhite) {
        board.blackPieces.get(i).moving = false;
        //board.whitePieces.remove(i);
      } else if (p.canMove(p.pos.x, p.pos.y, tx, ty)) {
        if (board.isPieceAt(tx, ty) && board.getPieceAt(tx, ty).isWhite && board.getPieceAt(tx, ty) != p) {
          board.getPieceAt(tx, ty).taken = true;
          
          //board.whitePieces.remove(i);
        }
        
        board.blackPieces.get(i).pos.x = tx;
        board.blackPieces.get(i).ppos.x = tx * 50 + 25;

        board.blackPieces.get(i).pos.y = ty;
        board.blackPieces.get(i).ppos.y = ty * 50 + 25;
        board.blackPieces.get(i).moving = false;

        
      } else board.blackPieces.get(i).moving = false;
    }
  }
}

void draw() {
  //display board
  coflor++;
  if (coflor > 255){
    coflor = 0;
  }
  for (int i = 1; i <= rows; i++) {
    for (int j = 1; j <= cols; j++) {
      if ((i + j) % 2 == 0) fill(245, 245, 215);
      else fill(84, 120, 134);
      rect((i-1)*50, (j-1)*50, 50, 50);
    }
  }  

  //display pieces
  for (int i = 0; i < board.whitePieces.size(); i++) {
    board.whitePieces.get(i).show();
    board.whitePieces.get(i).die();
  }
  for (int i = 0; i < board.blackPieces.size(); i++) {
    board.blackPieces.get(i).show();
    board.blackPieces.get(i).die();

  }
}
