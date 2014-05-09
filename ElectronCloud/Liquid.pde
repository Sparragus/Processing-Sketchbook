public class Liquid {

  float x, y, w, h;
  float c;

  public Liquid(float x, float y, float w, float h, float c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }
  
  public void display() {
    noStroke();
    fill(#83B3F5, 10);
    rect(x,y,w,h);
  }
}
