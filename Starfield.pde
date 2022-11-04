Particle [] stars = new Particle[1500];
int speed = 1;
PImage img;
void setup(){
  background(0);
  size(500,500);
  img = loadImage("download.jpeg");
  for(int i = 1; i < stars.length; i++) {
    stars[i] = new Particle(); 
    stars[0] = new OddballParticle();
  }
}
void draw(){
  if(speed%2 == 0){
 frameRate(150);
 fill(0,0,0,15);
  rect(-10,0,510,510);
  stars[0].show();
  stars[0].update();
  }
  else{
    frameRate(60);
    fill(0,0,0);
    rect(-10,0,510,510);
  }
  translate(width/2, height/2);
  for(int i = 1; i < stars.length; i++) {
    stars[i].show();
    stars[i].update();
  }
}
class Particle{
  float x;
  float y;
  float z;
  color c;
  int d;
  Particle() {
    x = random(-width, width);
    y = random(-height,height);
    z = random(width);
    c = 255;
  }
  void update(){
  z = z - 5;
  if(z < 1){
    z = width;
    x = random(-width, width);  
    y = random(-height,height); 
  }
}
  
void show(){
  fill(c);
  noStroke();
  float sx = map(x / z, 0, 1, 0, width);
  float sy = map(y / z, 0, 1, 0, width);
  float s = map(z, 0, width, 8, 0);
  ellipse(sx,sy,s,s); 
}   
}
class OddballParticle extends Particle{
 OddballParticle(){
    d = (int)(Math.random()*4)+1;
    if(d == 1){
      x = 0;
      y = 0;
    }else if(d == 2){
      x = 500;
      y = 0;
    }else if(d == 3){
      x = 0;
      y = 500;
    }else if(d ==4){
      x = 500;
      y = 500;
    }
    c = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
 }
 void show(){
  //image(img, x, y, width/10, height/10);
  fill(c);
  ellipse(x,y,20,20);
 }
 void update(){
   if(d == 1){
   x+=(int)(Math.random()*4)-1;
   y+=(int)(Math.random()*4)-1;
   }else if(d == 2){
   x-= 0.75;
   y+=(int)(Math.random()*4)-1;
   }else if(d ==3){
   x+=(int)(Math.random()*4)-1;
   y-=0.75;
   }else if(d == 4){
   x-=0.75;
   y-=0.75;
   }
   if(y > 500){
    d = (int)(Math.random()*4)+1;
    c = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    if(d == 1){
      x = 0;
      y = 0;
    }else if(d == 2){
      x = 500;
      y = 0;
    }else if(d == 3){
      x = 0;
      y = 500;
    }else if(d ==4){
      x = 500;
      y = 500;
    }
   }else if(y < 0){
     d = (int)(Math.random()*4)+1;
     c = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
     if(d == 1){
      x = 0;
      y = 0;
    }else if(d == 2){
      x = 500;
      y = 0;
    }else if(d == 3){
      x = 0;
      y = 500;
    }else if(d ==4){
      x = 500;
      y = 500;
    }
 }else if(x < 0){
   d = (int)(Math.random()*4)+1;
   c = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
   if(d == 1){
      x = 0;
      y = 0;
    }else if(d == 2){
      x = 500;
      y = 0;
    }else if(d == 3){
      x = 0;
      y = 500;
    }else if(d ==4){
      x = 500;
      y = 500;
    }
 }else if(x > 500){
   d = (int)(Math.random()*4)+1;
   c = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
   if(d == 1){
      x = 0;
      y = 0;
    }else if(d == 2){
      x = 500;
      y = 0;
    }else if(d == 3){
      x = 0;
      y = 500;
    }else if(d ==4){
      x = 500;
      y = 500;
    }
 }
}
}
void mouseClicked(){
  speed++;
}
