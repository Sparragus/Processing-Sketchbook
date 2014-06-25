PVector pm = new PVector();
PVector m = new PVector();
PVector l = new PVector();

void setup() {
  size(800, 800);
  // frameRate(12);
}

void draw() {
  pm.set(pmouseX, pmouseY);
  m.set(mouseX, mouseY);

  l = PVector.sub(m, pm);
  pushMatrix();
    stroke(#000000);
    strokeWeight(1);

    translate(pm.x,pm.y);
    line(0,0,l.x,l.y);

    translate(l.x/2.0, l.y/2.0);
    rotate(HALF_PI);
    line(0,0,l.x,l.y);
  popMatrix();

}
				