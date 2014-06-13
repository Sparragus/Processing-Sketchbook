void setup() {
  size(512, 512);
  smooth();
  createStuff();

  noLoop();
}

void createStuff() {

}

void draw() {
  drawSevenSegment(width/2, height/2, #B42754);
}
	
void sevenSegmentPart(float _x, float _y, float _degrees, color _c) {
  int sevenSegmentWidth = 100;
  int sevenSegmentHeight = 20;

  fill(_c);

  pushMatrix();
    translate(_x, _y);
    rotate(radians(_degrees));

    beginShape();
      vertex(-sevenSegmentWidth/2, 0);
      vertex(-sevenSegmentWidth/2 + 10, -sevenSegmentHeight/2);
      vertex(sevenSegmentWidth/2 - 10, -sevenSegmentHeight/2);
      vertex(sevenSegmentWidth/2, 0);
      vertex(sevenSegmentWidth/2 - 10, sevenSegmentHeight/2);
      vertex(-sevenSegmentWidth/2 + 10, sevenSegmentHeight/2);
    endShape(CLOSE);
  popMatrix();
}

void drawSevenSegment(float _x, float _y, color _c) {
  sevenSegmentPart(_x, _y, 0, #B42754);
  sevenSegmentPart(_x-50, _y-55, 90, #B42754);
  sevenSegmentPart(_x+50, _y-55, 90, #B42754);
  sevenSegmentPart(_x, _y-110, 0, #B42754);
  sevenSegmentPart(_x-50, _y+55, 90, #B42754);
  sevenSegmentPart(_x+50, _y+55, 90, #B42754);
  sevenSegmentPart(_x, _y+110, 0, #B42754);
}