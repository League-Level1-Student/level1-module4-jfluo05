int x=40;
int y=300;
int birdYVelocity=60;
int gravity=3;
int Xrect=300;
int upperPipeHeight= (int)random(100, 450);
int gap=120;
int lowerPipeTop=upperPipeHeight+gap;
int score;
String scoreString;
boolean endGame=false;

void setup(){
  size(600,600);
}
void draw(){
  
  if(endGame==true){
  background(255, 255, 255);
  textSize(30);
  text("GAME OVER your score is: "+score,40,300);
  }else{
    background(5,255,253);
  rect(600,600,0,0);
  score=score+1;
  scoreString= String.valueOf(score);
  fill(0,0,0);
  text(scoreString,30,30);
  fill(255, 26, 26);
stroke(88, 255, 77);
y=y+gravity;
ellipse(x, y, 26, 26);
fill(50, 170, 70);

Xrect=Xrect-3;
rect(Xrect,0, 50, upperPipeHeight);

if(Xrect<-50){
teleportPipes();
}

fill(50,170, 70);
Xrect=Xrect-3;
rect(Xrect,upperPipeHeight+gap, 50,500);

if (intersectsPipes()==true){
  println("INTERSECTION");
}
}
}

boolean intersectsPipes() { 
     if (y < upperPipeHeight && x > Xrect && x < (Xrect+50)){
       endGame=true;
          return true; }
     else if (y>lowerPipeTop && x > Xrect && x < (Xrect+50)) {
       endGame=true;
          return true; }
     else { return false; }
     
     
}

void mousePressed(){
  y=y-birdYVelocity;
  println("Clicked "+y);
}
void teleportPipes(){
Xrect=600;
upperPipeHeight= (int)random(200, 400);
}