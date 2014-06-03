/*
	Places N random dots wherever a pixel is dark/black.
*/

int num = 500;
ArrayList<Ball> balls;

void setup() {
	size(800,800);
	background(255);
	smooth();
	noLoop();

	createStuff();
}

void createStuff() {
	
	// Black rect in center.
	fill(#000000);
	rectMode(CENTER);
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
			fill(#FF6600);
			balls.add(new Ball(new PVector(x,y), 5, #0066FF));
		}

	}

}

void draw() {
	for (int i = 0; i < balls.size(); ++i) {
		Ball curBall = balls.get(i);

		for (int j = 0; j < balls.size(); ++j) {
			if ( j != i ) {
				curBall.drawConnectionTo( balls.get(j) );
			}
		}

		curBall.run();

	}
}
				