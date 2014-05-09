import controlP5.*;
ControlP5 cp5;

float startAngle = 0;
float angularVelocity = 0.00;
float angularAcceleration = 0.001;

float startRadius = 5;
float growRadius = 5;

int shapeSize = 80;

boolean colored = true;


void setup() {
  size(800, 800);
  smooth();

  cp5 = new ControlP5(this);
  cp5.addSlider("shapeSize").setValue(80).setRange(1, 200);
  cp5.addToggle("colored").setValue(false).setPosition(10, 50);

  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0);

  float radius = startRadius;
  float angle = startAngle;

  float x;
  float y;

  fill(255);
  if (colored) {
    fill(map(noise(angle/(360*TWO_PI)), 0, 1, 0, 360), 100, 100);
  }
  stroke(0);
  strokeWeight(10);
  beginShape();
  for (int i = 0; i < shapeSize ; i++) {
    x = width/2 + radius * cos(angle);
    y = height/2 + radius * sin(angle);
    pushMatrix();

    if (mousePressed) { 
      noFill();
      stroke(255);
      if (colored) {
        stroke(map(noise(angle/(360*TWO_PI)), 0, 1, 0, 360), 100, 100);
      }
    }
    vertex(x, y);
    popMatrix();
    radius += growRadius;
    angle += angularVelocity;
  }
  endShape();

  startAngle += TWO_PI;
  angularVelocity += angularAcceleration;
}
