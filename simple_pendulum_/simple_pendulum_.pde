PVector origin, ball;

float r =15;
float angle = 0;
float len, angularVel, angularAcc, time, startTime, counter;

boolean hold, start;

void setup(){
  size(400,300);
  
  len = 170;
  
  origin = new PVector(width/2,0);
  ball = new PVector(width/2,len);
  
}

void mousePressed(){
  if (mouseX < ball.x + r && mouseX > ball.x -r
  && mouseY < ball.y + r && mouseY > ball.y - r){
    hold = true;
  }
}
void mouseReleased(){
    if (hold){
      angularVel = 0;
      startTime = millis();
      hold = false;
      start = true;
    }
    
}

void keyPressed(){
  counter++;
}


void draw(){
 background (50,100,125); 
 
 strokeWeight(2);
 
 ball.x = origin.x + len *sin(angle);
 ball.y = origin.y + len * cos(angle);

 line (origin.x,origin.y,ball.x,ball.y);
 fill(190,255,230);
 if (hold){
   fill(0);
 }
 ellipse(ball.x,ball.y,r*2,r*2);
 text(time,30,30);
 text(counter,width - 60,30);

 if (!hold){
   angularAcc = -0.063/r * sin(angle);
 
   angle += angularVel;
   angularVel += angularAcc;
 
   angularVel *= 0.995;
 }
 if (hold){
   PVector diff = PVector.sub(origin, new PVector(mouseX, mouseY));
   angle = atan2(-1*diff.y, diff.x) - radians(90);     
 }
 if (start){
   time = (millis() - startTime) / 1000;
 }
 if (counter == 25){
   noLoop();
 }
}
