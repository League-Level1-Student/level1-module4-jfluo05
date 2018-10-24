int x=15;
int y=385;
int ballRadius=10;
 int carX=200;
  int carY=200;
  int carSize=20;
  int carSpeed=20;
Car car1= new Car(1000-50, 100, 20, 5);
Car car2= new Car(1000-50, 200, 20, 4);
Car car3= new Car(1000-50, 300, 20, 3);

void setup(){
  size(1000,400);
}


void draw(){
background(207,246,247);

car1.display();
car2.display();
car3.display();

car1.moveLeft();
car2.moveLeft();
car3.moveLeft();

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
      }}
      
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
}