float radiusOffset = 20; 
float radiusOffsetOffset = 20;
float radius, x, y;
float angleStep = TAU/360.0;
float angle = 0;
float angleOffset = 10;

void setup() {
  size(800, 800);
}

void draw() {
  background(#FFFFFF);

  translate(width/2, height/2);

  strokeWeight(3);
  fill(#aaddEE);

  beginShape();
  while (angle<=TAU) {
    radiusOffset = radiusOffsetOffset*cos(angle*angleOffset*4);
    radius = 200 + radiusOffset*cos(angle*angleOffset);
    x = radius * cos(angle);
    y = radius * sin(angle);

    vertex(x, y);

    angle += angleStep;
  }
  endShape(CLOSE);

  angle = 0;
}

void keyPressed() {
  switch(keyCode) {
  case UP:
    radiusOffsetOffset++;
    break;
  case DOWN:
    radiusOffsetOffset--;
    break;
  case LEFT:
    angleOffset--;
    break;
  case RIGHT:
    angleOffset++;
    break;
  }
}
