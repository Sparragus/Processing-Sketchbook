public abstract class PhysicalObject implements Collidable{
  protected int x, y, w, h;

  PhysicalObject(String objectName, int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

  }
  
  public abstract void display();
  
  public int getX() {
    return this.x;
  }
  public void setX(int value) {
    this.x = value;
  }  
  public int getY() {
    return this.y;
  }
  public void setY(int value) {
    this.y = value;
  }    
  public int getWidth() {
    return this.w;
  }
  public void setWidth(int value) {
    this.w = value;
  }
  public int getHeight() {
    return this.h;
  }
  public void setHeight(int value) {
    this.h = value;
  }
  
  public boolean collidesWith(Collidable obj){
    int objX = obj.getX();
    int objY = obj.getY();
    int objW = obj.getWidth();
    int objH = obj.getHeight();
    
    return !(this.x > objX+objW || this.x+this.w < objX || this.y > objY+objH || this.y+this.h < objY);
  }
}
