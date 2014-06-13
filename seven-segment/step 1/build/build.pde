void setup() {
  size(512, 512);
  smooth();
  createStuff();

  noLoop();
}

void createStuff() {

}

void draw() {
  sevenSegmentPart(width/2, height/2, 0, #000000);
}
	
void sevenSegmentPart(float _x, float _y, float _angle, color _c) {
  int sevenSegmentWidth = 100;
  int sevenSegmentHeight = 20;
  

  fill(_c);

  pushMatrix();
    translate(_x, _y);
    rotate(_angle);

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