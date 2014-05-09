import controlP5.*;

ControlP5 cp5;
float radius;
float theta;
float fr;
float xoff, yoff;

void setup() {
  size(500, 400);

  cp5 = new ControlP5(this);

  fr = 360;
  cp5.addSlider("fr").setValue(360).setRange(1, 720).hide();
  cp5 = new ControlP5(this);
  
  xoff = 0.0001;
  yoff = 0.0001;
}

void draw() {
//  background(255);
  frameRate(fr);

  float x = radius * cos(radians(theta));
  float y = radius * sin(radians(theta));
  pushMatrix();
  translate(width/2+noise(xoff,yoff)*100, height/2+noise(xoff+100,yoff+100)*100);

  noStroke();
  fill(0);
  ellipse(x, y, 10, 10);
  popMatrix();

  radius += 0.05;
  theta++;
  xoff+=0.001;
  yoff+=0.001;
}
