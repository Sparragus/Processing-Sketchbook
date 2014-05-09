public class Tank extends AnimateObject implements Player {
  int speed;
  int prevPosX, prevPosY;

  Tank(int x, int y, int w, int h) {
    super("Tank", x, y, w, h);
    this.speed = 2;
  }

  public void move() {  
    this.prevPosX = this.x;
    this.prevPosY = this.y;
    
    if (keyPressed) {
      switch(keyCode) {
      case UP:
        this.moveUp();
        break;
      case RIGHT:
        this.moveRight();
        break;
      case DOWN:
        this.moveDown();
        break;
      case LEFT:
        this.moveLeft();
        break;
      default:
        break;
      }
    }
  }
  
  public void returnToPreviousPosition(){
      this.x = this.prevPosX;
      this.y = this.prevPosY;
  }

  public void moveUp() {
    int tempPosY = this.y - speed;
    if (tempPosY > 0)
      this.y = tempPosY;
    else
      this.y = 0;
  }
  public void moveRight() {
    int tempPosX = this.x + speed;
    if (tempPosX+this.w < width)
      this.x = tempPosX;
    else
      this.x = width-this.w;
  }
  public void moveDown() {
    int tempPosY = this.y + speed;
    if (tempPosY+this.h < height)
      this.y = tempPosY;
    else
      this.y = height-this.h;
  }
  public void moveLeft() {
    int tempPosX = this.x - speed;
    if (tempPosX > 0)
      this.x = tempPosX;
    else
      this.x = 0;
  }
} 
