public abstract class InanimateObject extends PhysicalObject{
  private PImage foreground;

  InanimateObject(String objectName, int x, int y, int w, int h){
    super(objectName, x, y, w, h);
    this.foreground = loadImage(objectName.toLowerCase() + "-fg.png");
  }
  
  public void display() {
    drawForeground();
  }
  
  private void drawForeground() {
    if(null!=this.foreground)
      image(this.foreground, this.x, this.y, this.w, this.h);
  }
}
