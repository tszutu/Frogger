int frogX = 200; 
int frogY = 375; 
Car car1; 
Car car2; 
Car car3; 
Car car4; 
Car car5; 
Car car6; 

//Creating a Car Object
class Car
{
  int xPos;
  int yPos; 
  int size; 
  int speed;

  //Constructor
  Car(int xpos, int ypos, int carSize, int carSpeed)
  {
    xPos = xpos; 
    yPos = ypos; 
    speed = carSpeed;
    size = carSize; 
    //rect(x, y, length, width)
    fill(0, 255, 0); 
    rect(xPos, yPos, carSize, 50);
  }  
  
  //Method to move car to the right
  void driveRight()
  {
    xPos += speed; 
    if(xPos > 400){
      xPos = 0; 
    }    
  }
 
 //Method to move car to the left
  void driveLeft()
  {
    xPos -= speed; 
    if(xPos < 0){
      xPos = 400; 
    } 
  }
  
  //display new car in their new location
  void display() 
  {
    fill(0,255,0);
    rect(xPos, yPos, size, 50);
  }
  
}

void setup()
{
  size(400,400); 
  
  //Make cars
  car1 = new Car( 100, 50, 100, 1); 
  car2 = new Car( 250,100, 50, 2); 
  car3 = new Car( 50, 150, 150, 3); 
  car4 = new Car( 150, 200, 200, 4); 
  car5 = new Car( 0, 250, 50, 10); 
  car6 = new Car( 350, 300, 100, 5);
}

void draw()
{
  //background(red, green, blue) 
  background(0,0,0); 
  
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
  
  //frog beginning coordinates 
  fill(255, 0, 0); 
  ellipse(frogX,frogY,35,35); 

  keepFrogInCanvas(); 
   
  //even cars go right
  //odd cars go right
  car1.driveLeft(); 
  car1.display(); 
  
  car2.driveRight(); 
  car2.display(); 
  
  car3.driveLeft(); 
  car3.display(); 
  
  car4.driveRight(); 
  car4.display(); 
  
  car5.driveLeft(); 
  car5.display(); 
  
  car6.driveRight(); 
  car6.display();
  
  //Checks that frog does not touch any of the cars 
  if(intersects(car1)||intersects(car2)||intersects(car3)
    ||intersects(car4)||intersects(car5)||intersects(car6))
    {
      resetFrog(); 
    }

  //finish the game
  gameFinishBanner(); 

}

//Puts frog to starting position
void resetFrog()
{
  frogX = 200; 
  frogY = 375; 
}

//Text shows up
void gameFinishBanner()
{
  if(frogY < 50){
    fill(0,0,255);
    rect(0,0, 400, 400);
    fill(255,0,0); 
    text("YOU WIN!!!",150, 150); 
    textSize(100); 
  }
}

//Checks if frog and car intersects
boolean intersects(Car car) 
{
  //start/finish line   -------- Cars
  if ((frogY > car.yPos && frogY < car.yPos+50) && (frogX > car.xPos && frogX < car.xPos+car.size))
      return true;
  else 
    return false;
}

//make sure frog is always in boundary of the canvas 
void keepFrogInCanvas()
{

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
      if(keyCode == UP)
      {
       frogY-=50; 
      }
      else if(keyCode == DOWN)
      {
        frogY+=50; 
      }
      else if(keyCode == RIGHT)
      {
        frogX+=50; 
      }
      else if(keyCode == LEFT)
      {
        frogX-=50; 
      }
  }
} 