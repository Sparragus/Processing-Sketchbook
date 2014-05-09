public interface Collidable {
  public int getX();
  public int getY();
  public int getWidth();
  public int getHeight();
  public boolean collidesWith(Collidable c); 
}