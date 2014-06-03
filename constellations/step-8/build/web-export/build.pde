/*
	Places N random dots wherever a pixel is dark/black.
*/

/* @pjs preload="website.png"; */

int num = 20;
ArrayList<Ball> balls;

boolean saveFrames = false;
int startFrame;

PImage backgroundImage;

void setup() {
  size(960,800);
	background(#333333);
	smooth();
	// noLoop();

	createStuff();
}

void createStuff() {
	backgroundImage = loadImage("website.png");
	size(backgroundImage.width, backgroundImage.height);

	// Black rect in center.
	rectMode(CENTER);
	fill(#000000);
	rect(width/2, height/2, width*0.90, height*0.90);
	
	// Init balls;
	balls = new ArrayList<Ball>();

	// Randomly select a pixel.
	// If it selects a black pixel, then create a circle over it.
	loadPixels();
	for (int i = 0; i < num; ++i) {
		int x = (int) random(width);
		int y = (int) random(height);
		int pixelIndex = y*height + x;
		
		if ( brightness(pixels[pixelIndex]) < 10 ) {
			PVector location = new PVector(x,y);
			int radius = (int) random(5,150);
			int offset = 0;
			color c = #FFccFF;
			balls.add(new Ball(location, radius, offset, c));
		}

	}

	background(0);

}

void draw() {
	rectMode(CENTER);
	fill(#000000, 127);
	rect(width/2, height/2, width, height);

	for (int i = 0; i < balls.size(); ++i) {
		Ball curBall = balls.get(i);

		// Draw connections. We start at j = i+1 because we don't want to make a connection
		// with balls we had already connected to, including balls[i] itself.
		for (int j = i+1; j < balls.size(); ++j) {
				Ball destinationBall = balls.get(j);
				if ( drawConnetion(curBall, destinationBall) ) {
					curBall.incrementConnectionsBy(1);
					destinationBall.incrementConnectionsBy(1);
				}
		}

		curBall.run();
	}

	if(saveFrames) {
		if(frameCount <= startFrame + 360) {
			saveFrame("frames/frame-####.gif");
		}
		else {
			println("gifsicle --colors=32 --resize-width=800 --delay=3 -O2 --loop  *.gif > animation.gif");
			saveFrames = false;
		}
	}

	image(backgroundImage, 0, 0, width, height);

}

boolean drawConnetion(Ball from, Ball to) {
	int maxDistance = 5;
	int distance = (int) from.location.dist( to.location );

	if ( distance < maxDistance ) {
		int strokeAlpha = (int) map(distance, 0, maxDistance, 255, 50);
		stroke(#00FF44, strokeAlpha);
		strokeWeight(2);
		line(from.location.x, from.location.y, to.location.x, to.location.y);
		return true;
	}
	return false;
}

void keyPressed() {
	if(key == 's') {
		saveFrames = true;
		startFrame = frameCount;
	}
}
				
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
		noStroke();
		ellipse(location.x, location.y, circleRadius, circleRadius);
	}

	public void incrementConnectionsBy(int n) {
		connections += n;
	}

}

