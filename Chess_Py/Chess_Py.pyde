def setup():
    size(400, 400)
    global tw, tb, kw, kb, bw, bb, qw, qb, kkw, kkb, pw, pb
    tw = loadImage("tw.png")
    tb = loadImage("tb.png")
    kw = loadImage("kw.png")
    kb = loadImage("kb.png")
    bw = loadImage("bw.png")
    bb = loadImage("bb.png")
    qw = loadImage("qw.png")
    qb = loadImage("qb.png")
    kkw = loadImage("kkw.png")
    kkb = loadImage("kkb.png")
    pw = loadImage("pw.png")
    pb = loadImage("pb.png")
    
    #image(kw,10,10,10,10);




class Piece:
    def __init__(self, x, y, clr):
        self.pos = PVector(x, y)
        self.ppos = PVector(x * 50 + 25, y * 50 + 25)
        self.isWhite = clr
  
    def show(self):
        ellipse(self.ppos.x, self.ppos.y, 40, 40)
  
    def canMove(self, x, y, x_, y_):
        return True
  
    def die(self):
        if (self.taken):
            self.pos.x = 10
            self.pos.y = 10
  
class Tower (Piece):
    def __init__(self, x, y, clr):
        self.pos = PVector(x, y)
        self.ppos = PVector(x * 50 + 25, y * 50 + 25)
        self.isWhite = clr
        self.taken = False
        self.moving = False
        
    def show(self):
        if (self.isWhite): self.img = tw
        else: self.img = tb
        imageMode(CENTER)
        if (not self.taken):
            if (not self.moving): image(self.img, self.ppos.x, self.ppos.y, 40, 40)
            if (self.moving): image(self.img, mouseX, mouseY, 40, 40)
    
  
    def canMove(self, x,  y,  x_,  y_):
        if (x == x_ and y != y_ or x != x_ and y == y_): return True
        else: return False
  
  

class Knight (Piece): 
    def __init__(self, x, y, clr):
        self.pos = PVector(x, y)
        self.ppos = PVector(x * 50 + 25, y * 50 + 25)
        self.isWhite = clr
        self.taken = False
        self.moving = False
  
    def show(self):
        if (self.isWhite): self.img = kw
        else: self.img = kb
        imageMode(CENTER)
        if (not self.taken):
            if (not self.moving): image(self.img, self.ppos.x, self.ppos.y, 40, 40)
            if (self.moving): image(self.img, mouseX, mouseY, 40, 40)   
  
    def canMove (self, x,  y,  x_,  y_):
        if (x + 2 == x_ and y + 1 == y_ or x - 2 == x_ and y + 1 == y_ or x - 2 == x_ and y - 1 == y_ or x + 2 == x_ and y - 1 == y_ or
        x + 1 == x_ and y + 2 == y_ or x + 1 == x_ and y - 2 == y_ or x - 1 == x_ and y + 2 == y_ or x - 1 == x_ and y - 2 == y_): return True
        else: return False
    


class Bishop (Piece):     
    def __init__(self, x, y, clr):
        self.pos = PVector(x, y)
        self.ppos = PVector(x * 50 + 25, y * 50 + 25)
        self.isWhite = clr
        self.taken = False
        self.moving = False
  
    def show(self):
        if (self.isWhite): self.img = bw
        else: self.img = bb
        imageMode(CENTER)
        if (not self.taken):
            if (not self.moving): image(self.img, self.ppos.x, self.ppos.y, 40, 40)
            if (self.moving): image(self.img, mouseX, mouseY, 40, 40)    
  
    def canMove(self, x,  y,  x_,  y_):
        if (abs(x - x_) == abs(y - y_)): return True
        else: return False
  

class Queen (Piece): 
    def __init__(self, x, y, clr):
        self.pos = PVector(x, y)
        self.ppos = PVector(x * 50 + 25, y * 50 + 25)
        self.isWhite = clr
        self.taken = False
        self.moving = False
  
    def show(self):
        if (self.isWhite): self.img = qw
        else: self.img = qb
        imageMode(CENTER)
        if (not self.taken):
            if (not self.moving): image(self.img, self.ppos.x, self.ppos.y, 40, 40)
            if (self.moving): image(self.img, mouseX, mouseY, 40, 40)    
  
    def canMove(self, x,  y,  x_,  y_):
        if (x == x_ and y != y_ or x != x_ and y == y_ or abs(x - x_) == abs(y - y_)): return True
        else: return False
  


class King (Piece): 
    def __init__(self, x, y, clr):
        self.pos = PVector(x, y)
        self.ppos = PVector(x * 50 + 25, y * 50 + 25)
        self.isWhite = clr
        self.taken = False
        self.moving = False
        
    def show(self):
        if (self.isWhite): self.img = kkw
        else: self.img = kkb
        imageMode(CENTER)
        if (not self.taken):
            if (not self.moving): image(self.img, self.ppos.x, self.ppos.y, 40, 40)
            if (self.moving): image(self.img, mouseX, mouseY, 40, 40)  
  
    def canMove(self, x,  y,  x_,  y_):
        if (x + 1 == x_ and y == y_ or  x != x_ and y + 1 == y_ or  x + 1 == x_ and y + 1 == y_ or x - 1 == x_ and y + 1 == y_ or x - 1 == x_ and y == y_
    or x - 1 == x_ and y - 1 == y_ or x == x_ and y - 1 == y_ or x + 1 == x_ and y - 1 == y_ or x == x_ and y + 1 == y_): return True
        else: return False
  


class Pawn (Piece): 
    def __init__(self, x, y, clr):
        self.pos = PVector(x, y)
        self.ppos = PVector(x * 50 + 25, y * 50 + 25)
        self.isWhite = clr
        self.moving = False
        self.taken = False
        
    def show(self):
        if (self.isWhite): self.img = pw
        else: self.img = pb
        imageMode(CENTER)
        if (not self.taken):
            if (not self.moving): image(self.img, self.ppos.x, self.ppos.y, 40, 40)
            if (self.moving): image(self.img, mouseX, mouseY, 40, 40)  
  
    def canMove(self, x,  y,  x_,  y_):
        if (self.isWhite and x == x_ and y - 1== y_ and not board.isPieceAt(x_,y_)): return True
        elif (not self.isWhite and x == x_ and y + 1== y_ and not board.isPieceAt(x_,y_)): return True
        elif (self.isWhite and self.pos.y == 6 and  x == x_ and y - 2 == y_ and not board.isPieceAt(x_,y_)): return True
        elif (not self.isWhite and self.pos.y == 1 and  x == x_ and y + 2 == y_ and not board.isPieceAt(x_,y_)): return True
        elif (board.isPieceAt(x_,y_) and x - 1 == x_ and y - 1 == y_ and self.isWhite): return True
        elif (board.isPieceAt(x_,y_) and x + 1 == x_ and y - 1 == y_ and self.isWhite): return True
        elif (board.isPieceAt(x_,y_) and x + 1 == x_ and y + 1 == y_ and not self.isWhite): return True
        elif (board.isPieceAt(x_,y_) and x - 1 == x_ and y + 1 == y_ and not self.isWhite): return True
        
        else: return False
  

class Board:
    def __init__(self):
        self.whitePieces = []
        self.blackPieces = []
        self.setupBoard()
        
    score = 0

    def setupBoard(self):
        self.whitePieces.insert(0,King(4, 7, True))
        self.whitePieces.insert(1,Queen(3, 7, True))
        self.whitePieces.insert(2, Bishop(2, 7, True))
        self.whitePieces.insert(3, Bishop(5, 7, True))
        self.whitePieces.insert(4, Knight(1, 7, True))
        self.whitePieces.insert(5, Tower(0, 7, True))
        self.whitePieces.insert(6, Knight(6, 7, True))
        self.whitePieces.insert(7, Tower(7, 7, True))

        self.whitePieces.insert(8, Pawn(4, 6, True))
        self.whitePieces.insert(9, Pawn(3, 6, True))
        self.whitePieces.insert(10, Pawn(2, 6, True))
        self.whitePieces.insert(11, Pawn(5, 6, True))
        self.whitePieces.insert(12, Pawn(1, 6, True))
        self.whitePieces.insert(13, Pawn(0, 6, True))
        self.whitePieces.insert(14, Pawn(6, 6, True))
        self.whitePieces.insert(15, Pawn(7, 6, True))

    #black pieces
        self.blackPieces.insert(0, King(4, 0, False))
        self.blackPieces.insert(1, Queen(3, 0, False))
        self.blackPieces.insert(2, Bishop(2, 0, False))
        self.blackPieces.insert(3, Bishop(5, 0, False))
        self.blackPieces.insert(4, Knight(1, 0, False))
        self.blackPieces.insert(5, Tower(0, 0, False))
        self.blackPieces.insert(6, Knight(6, 0, False))
        self.blackPieces.insert(7, Tower(7, 0, False))

        self.blackPieces.insert(8, Pawn(4, 1, False))
        self.blackPieces.insert(9, Pawn(3, 1, False))
        self.blackPieces.insert(10, Pawn(2, 1, False))
        self.blackPieces.insert(11, Pawn(5, 1, False))
        self.blackPieces.insert(12, Pawn(1, 1, False))
        self.blackPieces.insert(13, Pawn(0, 1, False))
        self.blackPieces.insert(14, Pawn(6, 1, False))
        self.blackPieces.insert(15, Pawn(7, 1, False))
    
  
  
    def isPieceAt(self, x, y): 
        for i in self.whitePieces: 
            if (not i.taken and i.pos.x == x and i.pos.y == y):
                return True
        for i in self.blackPieces: 
            if (not i and i.pos.x == x and i.pos.y == y):
                return True
        print("V")
        return False
        
    def getPieceAt(self, x, y):
        for i in self.whitePieces:
            if (not i.taken and i.pos.x ==
            x and i.pos.y == y):
                return i
      
    
        for i in self.blackPieces:
            if (not i.taken and i.pos.x ==
            x and i.pos.y == y):
                return i

        return None

rows = 9
cols = 9
board = Board()


def mousePressed():

    for i in board.whitePieces:
        x = i.ppos.x - 25
        y = i.ppos.y - 25
        #print("F")
        #print(i.ppos.x,i.ppos.y,mouseX,mouseY)
        if (mouseX > x and mouseX < x + 40 and mouseY > y and mouseY < y + 40):
            i.moving = True
            print(i)
    
  
  #print(p.pos.x, p.pos.y)


    for i in board.blackPieces:
        x = i.ppos.x - 25
        y = i.ppos.y - 25

    #print(p.ppos.x,p.ppos.y)
        if (mouseX > x and mouseX < x + 40 and mouseY > y and mouseY < y + 40):
            i.moving = True
    
  


def mouseReleased():
    tx = ceil(mouseX/50)
    ty = ceil(mouseY/50)
    for i in board.whitePieces:
        #print(p.ppos.x,p.ppos.y)
        if (i.moving and board.isPieceAt(tx, ty) and board.getPieceAt(tx, ty).isWhite):
            i.moving = False
            #board.whitePieces.remove(i)
        elif (i.moving and i.canMove(i.pos.x, i.pos.y, tx, ty)):
            if (board.isPieceAt(tx, ty) and not board.getPieceAt(tx, ty).isWhite and board.getPieceAt(tx, ty) != i): 
                board.getPieceAt(tx, ty).taken = True
                #board.whitePieces.remove(i)
                

            i.pos.x = tx
            i.ppos.x = tx * 50 + 25

            i.pos.y = ty
            i.ppos.y = ty * 50 + 25
            i.moving = False
                
        else: i.moving = False
    
  
    for i in board.blackPieces:
        #print(p.ppos.x,p.ppos.y)
        if (i.moving and board.isPieceAt(tx, ty) and not board.getPieceAt(tx, ty).isWhite):
            i.moving = False
            #board.whitePieces.remove(i)
        elif (i.moving and i.canMove(i.pos.x, i.pos.y, tx, ty)): 
            if (board.isPieceAt(tx, ty) and board.getPieceAt(tx, ty).isWhite and board.getPieceAt(tx, ty) != i): 
                board.getPieceAt(tx, ty).taken = True
          
          #board.whitePieces.remove(i)
        
        
            i.pos.x = tx
            i.ppos.x = tx * 50 + 25
            
            i.pos.y = ty
            i.ppos.y = ty * 50 + 25
            i.moving = False
            print(i)
        else: i.moving = False

def draw(): 
  #display board
   # print((board.whitePieces[1]))
    for i in range (rows):
        for j in range (cols): 
            if ((i + j) % 2 == 0): fill(245, 245, 215)
            else: fill(84, 120, 134)
            rect((i-1)*50, (j-1)*50, 50, 50)
    
    
    
  #display pieces
    for i in board.whitePieces:
        i.show()
        i.die()
  
    for i in board.blackPieces:
        i.show()
        i.die()
