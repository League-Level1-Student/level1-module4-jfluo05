int x=15;
int y=385;
int ballRadius=10;
 int carX=200;
  int carY=200;
  int carSize=20;
  int carSpeed=20;
  boolean endGame=false;
  
int car1Random = (int)random(50, 120);
int car2Random = (int)random(130, 210);
int car3Random = (int)random(220, 310);
int car4Random = (int)random(320, 380);

int car1Speed = (int)random(10,15);
int car2Speed = (int)random(10,15);
int car3Speed = (int)random(10,15);
int car4Speed = (int)random(10,15);

Car car1= new Car(1000-50, car1Random, 20, car1Speed);
Car car2= new Car(1000-50, car2Random, 20, car2Speed);
Car car3= new Car(1000-50, car3Random, 20, car3Speed);
Car car4= new Car(1000-50, car4Random, 20, car4Speed);

void setup(){
  size(1000,400);
}


void draw(){
  if(endGame==true){
    background(255,255,255);
    textSize(30);
    text("You WIN!!!!",500,200);
  }else{
background(207,246,247);

println("car1 "+car1Speed);
println("car2 "+car2Speed);
println("car3 "+car3Speed);
println("car4 "+car4Speed);

car1.display();
car2.display();
car3.display();
car4.display();

car1.moveLeft();
car2.moveLeft();
car3.moveLeft();
car4.moveLeft();


if(y>10){
endGame=true;
}


if(car1.intersects(x,y,ballRadius)==true){
 x=15;
 y=385;
}
if(car2.intersects(x,y,ballRadius)==true){
 x=15;
 y=385;
}
if(car3.intersects(x,y,ballRadius)==true){
 x=15;
 y=385;
}
if(car4.intersects(x,y,ballRadius)==true){
 x=15;
 y=385;
}

//code for frog
fill(30, 180, 60);
ellipse(x, y, 20, 20);

KeepTheFrogIn();
  }


void KeepTheFrogIn(){
if(x>width-ballRadius){
 x=width-ballRadius; 
}
else if(y>height-ballRadius){
 y=height-ballRadius; 
}
else if(x<ballRadius){
 x=ballRadius; 
}
else if(y<ballRadius){
 y=ballRadius; 
}
}
  
void keyPressed()
{
      if(key == CODED){
            if(keyCode == UP)
            {
              y=y-20;
              println(y);
                  //Frog Y position goes up
            }
            else if(keyCode == DOWN)
            {
               y=y+20;
                println(y);
                  //Frog Y position goes down 
            }
            else if(keyCode == RIGHT)
            {
               x=x+20;
                println(x);
                  //Frog X position goes right
            }
            else if(keyCode == LEFT)
            {
              x=x-20;
               println(x);
                  //Frog X position goes left
            }
      }
}
}
      
class Car{
 int carX;
 int carY;
 int carSize;
 int carSpeed;
  
  public Car(int carX, int carY, int carSize, int carSpeed){
    this.carX=carX;
    this.carY=carY;
    this.carSize=carSize;
    this.carSpeed=carSpeed;
  }
  
void display() {
      fill(255,0,0);
      rect(carX , carY, 50, carSize);
      
}
void moveLeft(){
  carX=carX-carSpeed;
  
  if(carX<-40){
    carX=width;
    
  }
}
boolean intersects(int x, int y, int ballRadius) {
      if ((x+ballRadius>carX && x-ballRadius<carX+carSize && y+ballRadius>carY && y-ballRadius<carY+20)){
             return true;
      } else {
             return false;
      }
}
int getX(){
  return x;
}
int getY(){
  return y;
}
int getSize(){
  return carSize;
}
}