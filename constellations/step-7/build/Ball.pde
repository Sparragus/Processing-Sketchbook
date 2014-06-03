public class Ball {

	public PVector origin, location;
	public int radius;
	public int offset;
	public color c;

	public int connections;

	public float circleRadius = 5;

	public Ball(PVector _origin, int _radius, int _offset, color _c) {
		origin = _origin.get();
		location = new PVector(0, 0);
		radius = _radius;
		offset = (int) random(0,360);
		c = _c;

		connections = 0;
	}

	public void run() {
		update();
		display();

		//Reset

		connections = 0;
	}

	public void update() {
		float angle = offset + radians( frameCount%360 );
		location.set( radius * cos( angle )
					 ,radius * sin( angle ));
	 	location.add(origin);

	 	circleRadius = map(connections, 0, 7, 5, 15);

	}

	public void display() {
		fill(c);
		// noStroke();
		stroke(#666666);
		ellipse(location.x, location.y, circleRadius, circleRadius);
	}

	public void incrementConnectionsBy(int n) {
		connections += n;
	}

}