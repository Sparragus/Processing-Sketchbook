public class Ball {

	public PVector location;
	public int radius;
	public color c;

	public Ball(PVector _location, int _radius, color _c) {
		location = _location;
		radius = _radius;
		c = _c;
	}

	public void run() {
		this.update();
		this.display();
	}

	public void update() {

	}

	public void setLocation(PVector _location) {
		location = _location;
	}

	public void setRadius(int _radius) {
		radius = _radius;
	}

	public void display() {
		fill(c);
		ellipse(location.x, location.y, radius, radius);
	}

}