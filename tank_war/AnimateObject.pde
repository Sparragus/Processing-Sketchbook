public abstract class AnimateObject extends PhysicalObject{
  private PImage background, foreground;
  

  AnimateObject(String objectName, int x, int y, int w, int h){
    super(objectName, x, y, w, h);
    this.foreground = loadImage(objectName.toLowerCase() + "-bg.png");
    this.foreground = loadImage(objectName.toLowerCase() + "-fg.png");
  }
  
  public void display() {
    drawBackground();
    drawForeground();
  }
  
  private void drawBackground() {
    if(null!=this.background)
    image(this.background, this.x, this.y, this.w, this.h);
  }
  private void drawForeground() {
    if(null!=this.foreground)
      image(this.foreground, this.x, this.y, this.w, this.h);
  }
}
