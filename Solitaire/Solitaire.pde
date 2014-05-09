void setup() {
  size(500, 400);
  frameRate(240);
}

void draw() {
  fill(#BADA55);
  stroke(90);
  float padding = 10;
  float cardWidth = 70;
  float cardHeight = 100;
  rect(map(cos(radians(frameCount)/4), -1, 1, padding, width-cardWidth-padding), map(abs(sin(radians(frameCount))), 0, 1, height-cardHeight-padding, padding), 70, 100);
}
