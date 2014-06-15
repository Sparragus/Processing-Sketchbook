import processing.pdf.*;
import controlP5.*;

ControlP5 cp5;

int levels = 4;
int petals = 10;

int petalWidth = 120;
int petalHeight = 60;
int petalCenter = 25;

void setup() {
  size(800,800);
  smooth();

  colorMode(HSB, 360, 100, 100);
  createStuff();

  // noLoop();
}

void createStuff() {
  cp5 = new ControlP5(this);

  cp5.addSlider("petalCenter")
    .setRange(-width/4,width/4)
    .setValue(petalCenter)
    .setPosition(10,10)
  ;

  cp5.addSlider("petalWidth")
    .setRange(1,width/2)
    .setValue(petalWidth)
    .setPosition(10,20)
  ;

  cp5.addSlider("petalHeight")
    .setRange(1,height/2)
    .setValue(petalHeight)
    .setPosition(10,30)
  ;

  cp5.addSlider("levels")
    .setRange(1,10)
    .setValue(levels)
    .setPosition(10,50)
  ;

  cp5.addSlider("petals")
    .setRange(1,50)
    .setValue(petals)
    .setPosition(10,60)
  ;
}


void draw() {
  background(#979797);

  float angleOffset, angleStep;

  noStroke();
  fill(#ED7635);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, petalCenter*2, petalCenter*2);

  for (int level = 1; level <= levels; ++level) {
    
    angleStep = TWO_PI/petals;
    angleOffset = angleStep/2.0;

    for (int i = 0; i < petals; ++i) {
      // stroke(#000000, 100);
      noStroke();
      fill(level*360.0/levels, 60, 80);
      drawPetal(width/2, height/2, 1.0/level, angleStep*i + angleOffset*(level-1));
    }
  }

}

void drawPetal(float _x, float _y, float _scale, float _angle) {
  float _petalWidth = petalWidth;
  float _petalHeight = petalHeight;
  float _petalCenter = petalCenter;

  if (_scale < 1) {
    _scale *= 4.0/3;
  }

  pushMatrix();
    translate(_x, _y);
    rotate(_angle);
    ellipseMode(CORNER);
    ellipse(_petalCenter, 0 - _petalHeight/2*_scale, _petalWidth*_scale, _petalHeight*_scale);
  popMatrix();

}

void keyPressed() {
  switch (key) {
    case 's' :
      saveVector();
    break;  
  }
}

void saveVector() {
  PGraphics tmp = null;
  tmp = beginRecord(PDF, "render-"+ frameCount +".pdf");

  if (tmp != null) {
    colorMode(HSB, 360, 100, 100);
    draw();
  } 

  endRecord();
}