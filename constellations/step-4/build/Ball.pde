public class Ball {

	public PVector origin, location;
	public int radius;
	public int offset;
	public color c;

	public Ball(PVector _location, int _radius, int _offset, color _c) {
		origin = _location.get();
		location = _location.get();
		radius = _radius;
		offset = _offset;
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

	public void drawConnectionTo(Ball otherBall) {

	}

	public void display() {
		fill(c);
		noStroke();
		ellipse(location.x, location.y, radius, radius);
	}

}