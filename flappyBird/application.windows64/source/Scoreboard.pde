class Scoreboard {
  
  
  void show(int score, int hscore){
      fill(255);
      noStroke();
      rect(70,140,width-140,160,20);
      fill(100);
      text("Score: " + score, 100,180);
      text("Highest Score: " + hscore, 100,230);
      fill(180);
      stroke(130);
      strokeWeight(2);
      rect(60,250,width-120,50,20);
      fill(20);
      text("Click to Play Again", 80,285);
  }
  
  
}
