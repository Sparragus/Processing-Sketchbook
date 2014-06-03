void setup() {
  size(800, 800);
}

void draw() {
  drawCircles(mouseX, mouseY, abs(pmouseX-mouseX));
}

void drawCircles(float x, float y, float size) {
  color c = color(random(255), random(255), random(255));
  fill(c);
  for (int i = int(size)*2; i > 3; i=i-20) {
    fill(c);
    ellipse(x, y, i, i);
    fill(0);
    ellipse(x, y, i-10, i-10);
  }
}
