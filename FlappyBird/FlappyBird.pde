int x=40;
int y=300;
int birdYVelocity=60;
int gravity=3;
int Xrect=300;
int upperPipeHeight= (int)random(200, 400);

void setup(){
  size(600,600);
}
void draw(){
  background(23, 255, 226);
  fill(255, 26, 26);
stroke(88, 255, 77);
y=y+gravity;
ellipse(x, y, 26, 26);

fill(50, 170, 70);
Xrect=Xrect-2;
rect(Xrect,0, 100, upperPipeHeight);

if(Xrect==-50){
teleportPipes();
}

fill(50,170, 70);
Xrect=Xrect-2;
rect(Xrect,500, 100, upperPipeHeight);
}
void mousePressed(){
  y=y-birdYVelocity;
  println("Clicked "+y);
}
void teleportPipes(){
  if(Xrect==-50){
Xrect=600;
upperPipeHeight= (int)random(200, 400);
}
}