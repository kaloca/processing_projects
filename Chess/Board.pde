class Board {
  ArrayList<Piece> whitePieces;
  //Piece[] blackPieces;
  ArrayList<Piece> blackPieces;
  Board() {
    whitePieces = new ArrayList<Piece>();
    blackPieces = new ArrayList<Piece>();
    setupBoard();
  }
  int score = 0;

  void setupBoard() {
    this.whitePieces.add(new King(4, 7, true));
    this.whitePieces.add(new Queen(3, 7, true));
    this.whitePieces.add(new Bishop(2, 7, true));
    this.whitePieces.add(new Bishop(5, 7, true));
    this.whitePieces.add(new Knight(1, 7, true));
    this.whitePieces.add(new Tower(0, 7, true));
    this.whitePieces.add(new Knight(6, 7, true));
    this.whitePieces.add(new Tower(7, 7, true));

    this.whitePieces.add(new Pawn(4, 6, true));
    this.whitePieces.add(new Pawn(3, 6, true));
    this.whitePieces.add(new Pawn(2, 6, true));
    this.whitePieces.add(new Pawn(5, 6, true));
    this.whitePieces.add(new Pawn(1, 6, true));
    this.whitePieces.add(new Pawn(0, 6, true));
    this.whitePieces.add(new Pawn(6, 6, true));
    this.whitePieces.add(new Pawn(7, 6, true));

    ////black pieces
    this.blackPieces.add(new King(4, 0, false));
    this.blackPieces.add(new Queen(3, 0, false));
    this.blackPieces.add(new Bishop(2, 0, false));
    this.blackPieces.add(new Bishop(5, 0, false));
    this.blackPieces.add(new Knight(1, 0, false));
    this.blackPieces.add(new Tower(0, 0, false));
    this.blackPieces.add(new Knight(6, 0, false));
    this.blackPieces.add(new Tower(7, 0, false));
    
    this.blackPieces.add(new Pawn(4, 1, false));
    this.blackPieces.add(new Pawn(3, 1, false));
    this.blackPieces.add(new Pawn(2, 1, false));
    this.blackPieces.add(new Pawn(5, 1, false));
    this.blackPieces.add(new Pawn(1, 1, false));
    this.blackPieces.add(new Pawn(0, 1, false));
    this.blackPieces.add(new Pawn(6, 1, false));
    this.blackPieces.add(new Pawn(7, 1, false));
    
  }
  
  boolean isPieceAt(int x, int y) {
    for (int i = 0; i < this.whitePieces.size(); i++) {
      if (!this.whitePieces.get(i).taken && this.whitePieces.get(i).pos.x ==
        x && this.whitePieces.get(i).pos.y == y) {
        return true;
      }
    }
    for (int i = 0; i < this.blackPieces.size(); i++) {
      if (!this.blackPieces.get(i).taken && this.blackPieces.get(i).pos.x ==
        x && this.blackPieces.get(i).pos.y == y) {
        return true;
      }
    }
    return false;
  }
  
  Piece getPieceAt(int x, int y) {
    for (int i = 0; i < this.whitePieces.size(); i++) {
      if (!this.whitePieces.get(i).taken && this.whitePieces.get(i).pos.x ==
        x && this.whitePieces.get(i).pos.y == y) {
        return this.whitePieces.get(i);
      }
    }
    for (int i = 0; i < this.blackPieces.size(); i++) {
      if (!this.blackPieces.get(i).taken && this.blackPieces.get(i).pos.x ==
        x && this.blackPieces.get(i).pos.y == y) {
        return this.blackPieces.get(i);
      }
    }
    return null;
  }
}
