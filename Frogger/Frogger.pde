int x=15;
int y=385;
int ballRadius=10;

void setup(){
  size(400,400);
}


void draw(){
background(207,246,247);
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
  int carX=200;
  int carY=200;
  int carSize=20;
  int carSpeed=20;
  
  public Car(int carX, int carY, int carSize, int carSpeed){
    
  }
}