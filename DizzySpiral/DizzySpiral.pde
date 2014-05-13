import controlP5.*;
ControlP5 cp5;

float startAngle = 0;
float angularVelocity = 1.00;
float angularAcceleration = 0.001;

float startRadius = 5;
float growRadius = 5;

int shapeSize = 80;

boolean colored = false;
boolean stroked = true;
boolean exportFrames = false;


void setup() {
  size(800, 800);
  smooth();

  cp5 = new ControlP5(this);
  cp5.addSlider("shapeSize").setValue(80).setRange(1, 200);
  cp5.addToggle("colored").setValue(colored).setPosition(10, 50).setLabel("Color");
  cp5.addToggle("stroked").setValue(stroked).setPosition(60, 50).setLabel("Stroke");

  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0);

  float radius = startRadius;
  float angle = startAngle;

  float x;
  float y;

  //  color theColor = color(map(noise(angle/(360*TWO_PI)), 0, 1, 0, 360), 100, 100);
  color theColor = color(map(noise(angle/(360*TWO_PI)), 0, 1, 0, 60), 74, 94);

  fill(255);
  if (colored) {
    fill(theColor);
  }
  stroke(0);
  strokeWeight(10);
  beginShape();
  for (int i = 0; i < shapeSize ; i++) {
    x = width/2 + radius * cos(angle);
    y = height/2 + radius * sin(angle);
    pushMatrix();

    if (stroked) { 
      noFill();
      stroke(255);
      if (colored) {
        stroke(theColor);
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
  
  // Use ImageMagick to convert to a GIF
  // convert *.png -set delay 3.33 animation.gif
  if(exportFrames && frameCount<=30*10){saveFrame("frame-####.png");}
}
