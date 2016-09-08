
//frog beginning coordinates 
int frogX = 200; 
int frogY = 375; 

//logs coordinates 
//even logs go right
//odd logs go left
int log1x = 100; 
int log1y = 50; 
int log1Leg = 100;
int log2x = 250; 
int log2y = 100; 
int log2Leg = 50;
int log3x = 50; 
int log3y = 150; 
int log3Leg = 150;
int log4x = 150; 
int log4y = 200; 
int log4Leg = 200;
int log5x = 0; 
int log5y = 250; 
int log5Leg = 50;
int log6x = 350; 
int log6y = 300; 
int log6Leg = 100;

void setup(){
  size(400,400); 
}

void draw(){
  //background(red, green, blue) 
  background(0,0,255); 
  
  //finish line
  fill(255,255,0); 
  rect(0,0,400,50); 
  fill(0,255,0);
  text("Finish Line", 150, 25); 
  textSize(20); 
  
  //start line
  fill(255, 0,255); 
  rect(0,350,400,50); 
  fill(255,255,0);
  text("Starting Line", 150, 375); 
  textSize(20); 
  
  
  //Logs coming from the right/left 
  fill(0, 255, 0); 
  
  //rect(x, y, length, width) 
  rect(log1x, log1y, 100, 50); 
  rect(log2x, log2y, 50, 50);
  rect(log3x, log3y, 150, 50);
  rect(log4x, log4y, 200, 50);
  rect(log5x, log5y, 50, 50);
  rect(log6x, log6y, 100, 50);
  
  //drawing frog ----note: putting it after rect will allow it to be on top
  fill(255, 0, 0); 
  ellipse(frogX,frogY,35,35); 
  
  keepFrogInCanvas(); 
  log1x = moveTheLogLeft(log1x, 1); 
  log2x = moveTheLogRight(log2x, 2); 
  log3x = moveTheLogLeft(log3x, 3); 
  log4x = moveTheLogRight(log4x, 4); 
  log5x = moveTheLogLeft(log5x, 10); 
  log6x = moveTheLogRight(log6x, 5); 
  
  //Checks that frog does not touch any of the logs 
  if(intersects(log1x,log1y,log1Leg)||intersects(log2x,log2y,log2Leg)||intersects(log3x,log3y,log3Leg)
    ||intersects(log4x,log4y, log4Leg)||intersects(log5x,log5y,log5Leg)||intersects(log6x,log6y,log6Leg)){
      frogX = 200; 
      frogY = 375; 
    }

  //finish the game
  if(frogY < 50)
  {
    fill(0,0,255);
    rect(0,0, 400, 400);
    fill(255,0,0); 
    text("YOU WIN!!!",150, 150); 
    textSize(100); 
  }

}

boolean intersects(int logX, int logY, int logLength) {
  //start/finish line   -------- Logs
  if ((frogY > logY && frogY < logY+50) && (frogX > logX && frogX < logX+logLength))
      return true;
  else 
    return false;
}

int moveTheLogLeft(int logX, int speed){
  logX -= speed; 
  if(logX < 0){
    logX = 400;
  }
  return logX; 
}

int moveTheLogRight(int logX, int speed){
  logX += speed; 
  if(logX > 400){
    logX = 0;
  }
  return logX; 
}

void keepFrogInCanvas(){
  //make sure frog is always in boundary of the canvas 
  if(frogX > 400){
    frogX = 375; 
  }
  if(frogY > 400){
    frogY = 375; 
  }
  if(frogX < 25){
    frogX = 25; 
  }
  if(frogY < 25){
    frogY = 25; 
  }
}

//gives the frog movement
void keyPressed()
{
  if(key == CODED){
      if(keyCode == UP){
       frogY-=50; 
      }
      else if(keyCode == DOWN){
        frogY+=50; 
      }
      else if(keyCode == RIGHT){
        frogX+=50; 
      }
      else if(keyCode == LEFT){
        frogX-=50; 
      }
  }
}