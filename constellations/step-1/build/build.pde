/*
	Places N random dots wherever a pixel is dark/black.
*/

int num = 500;

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

	// Randomly select a pixel.
	// If it selects a black pixel, then create a circle over it.
	loadPixels();
	for (int i = 0; i < num; ++i) {
		int x = (int) random(width);
		int y = (int) random(height);

		int pixelIndex = y*height + x;
		if ( brightness(pixels[pixelIndex]) < 10 ) {
			fill(#FF6600); //orange
			ellipse(x,y,10,10);
		}
	}

}

void draw() {

}
				