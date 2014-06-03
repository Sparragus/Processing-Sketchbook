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

	public void drawConnectionTo(Ball otherBall) {
		float distance = location.dist( otherBall.location );
		
		int maxDistance = 50;
		if ( distance < maxDistance ) {
			int strokeAlpha = (int) map(distance, 0, maxDistance, 255, 10);
			stroke(#00FF44, strokeAlpha);
			strokeWeight(1);
			line(location.x, location.y, otherBall.location.x, otherBall.location.y);
		}
	}

	public void display() {
		fill(c);
		noStroke();
		ellipse(location.x, location.y, radius, radius);
	}

}