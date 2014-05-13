// City
// by Richard Kaufman
// Inspired and based on Daniel Shiffman's Noise Landscape example

// Daniel Shiffman
// The Nature of Code
// http://www.shiffman.net/teaching/nature

// Landscape with height values according to Perlin noise

Landscape land;    
float theta = 1.0;

float xpos, ypos, zpos;
float rotx;

void setup() {

  size(800,400,P3D);
  noiseDetail(16);

  // Create a landscape object
  int ratio = 1;
  rotx = PI/1.62;
  xpos = width/2*1.3+10;
  ypos = height/2+133.5;
  land = new Landscape(20/ratio/3,800*ratio,400*ratio);
}

void draw() {

  // Ok, visualize the landscape space
  background(#9AD6FA);
  pushMatrix();
  
  if(keyPressed) {
    if(key=='w'){
      zpos++;
    }
    if(key=='s'){
      zpos--;
    }
    if(key=='a'){
      xpos++;
    }
    if(key=='d'){
      xpos--;
    }
    if(keyCode==DOWN){
      rotx*=1.01;
    }
    if(keyCode==UP){
      rotx*=0.99;
    }
    if(keyCode==LEFT){
      theta*=1.01;
    }
    if(keyCode==RIGHT){
      theta*=0.99;
    }
  }
  translate(xpos,ypos,zpos);
  rotateX(rotx);
  rotateZ(theta);
  land.render(); 
  popMatrix();

  land.calculate();
  
//  theta += 0.0025;
}
