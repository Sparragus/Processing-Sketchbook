/*
	Places N random dots wherever a pixel is dark/black.
*/

int num = 200;
ArrayList<Ball> balls;

void setup() {
	size(800,800);
	background(#FFFFFF);
	smooth();
	// noLoop();

	createStuff();
}

void createStuff() {

	// Black rect in center.
	rectMode(CENTER);
	fill(#000000);
	rect(width/2, height/2, width*0.60, height*0.80);
	
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
			int radius = (int) random(5,25);
			int offset = 0;
			color c = #0066FF;
			balls.add(new Ball(location, radius, offset, c));
		}

	}

}

void draw() {
	background(#FFFFFF);

	// Black rect in center.
	rectMode(CENTER);
	fill(#000000);
	rect(width/2, height/2, width*0.60, height*0.80);

	for (int i = 0; i < balls.size(); ++i) {
		Ball curBall = balls.get(i);
		curBall.run();

		// Draw connections. We start at j = i+1 because we don't want to make a connection
		// with balls we had already connected to, including balls[i] itself.
		for (int j = i+1; j < balls.size(); ++j) {
				Ball destinationBall = balls.get(j);
				if ( drawConnetion(curBall, destinationBall) ) {
					// curBall.incrementConnectionsBy(1);
				}
		}
	}
}

boolean drawConnetion(Ball from, Ball to) {
	int maxDistance = 50;
	int distance = (int) from.location.dist( to.location );

	if ( distance < maxDistance ) {
		int strokeAlpha = (int) map(distance, 0, maxDistance, 255, 10);
		stroke(#00FF44, strokeAlpha);
		strokeWeight(1);
		line(from.location.x, from.location.y, to.location.x, to.location.y);
		return true;
	}
	return false;
}
				