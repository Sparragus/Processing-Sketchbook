import controlP5.*;

int steps = 32;
float stepAngle;
float phi;
float radius;
float theFrameRate;

ControlP5 cp5;

void setup() {
  size(680, 400, P3D);
  cp5 = new ControlP5(this);

  cp5.addSlider("radius")
    .setRange(1, 500)
      .setPosition(20, 20)
        .setValue(150);

  cp5.addSlider("steps")
    .setRange(1, 100)
      .setPosition(20, 40)
        .setValue(8);
  cp5.addSlider("theFrameRate")
    .setRange(1, 100)
      .setPosition(20, 60)
        .setValue(60);



  phi = 0;
}

void draw() {
  frameRate(theFrameRate);

  fill(#37324A, 5);
  noStroke();
  rect(0, 0, width, height);

  stepAngle = 360 / steps;

  pushMatrix();
  translate(width/2, height/2);
  rotateZ(radians(phi+stepAngle));
  phi += stepAngle;

  fill(#EC9C51, 30);
  noStroke();
  ellipse(0, -65, radius, radius);
  popMatrix();
}
