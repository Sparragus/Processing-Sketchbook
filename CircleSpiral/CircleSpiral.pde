float startAngle = 0;
float angularVelocity = .05;
float angularAcceleration = 0.001;

float startRadius = 3;
float growRadius = 4;

float startDiameter = 5;
float growDiameter = 1;


void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(0);

  float radius = startRadius;
  float angle = startAngle;
  float diameter = startDiameter;

  float x = radius * cos(angle);
  float y = radius * sin(angle);


  translate(width/2, height/2);
  fill(#BADA55,100);
//  noFill();
  stroke(220);
  
  for (int i = 0; i < 50 ; i++) {
    x = radius * cos(angle);
    y = radius * sin(angle);
    pushMatrix();
    ellipse(x, y, diameter, diameter);
    popMatrix();

    radius += growRadius;
    angle += angularVelocity;
    diameter += growDiameter;
  }

  startAngle += angularVelocity;
  angularVelocity += angularAcceleration;
}
