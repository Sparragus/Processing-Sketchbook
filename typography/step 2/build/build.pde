/*
	Places N random letters wherever a pixel is dark/black.
*/

int num = 1200;
PImage sourceImage;
PFont font;
String letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

int maxBrightness = 255;

void setup() {
	size(800,800);
	background(#FFFFFF);
	fill(#000000);
	smooth();

	// Load image
	sourceImage = loadImage("face.jpg");
	sourceImage.loadPixels();
	
	// Match canvas size to image size
	size(sourceImage.width, sourceImage.height);
	
	// Load font
	font = loadFont("Baskerville-48.vlw");
	
	createStuff();
}

void createStuff() {
	for (int i = 0; i < num; ++i) {
		int x = (int) random(sourceImage.width);
		int y = (int) random(sourceImage.height);
		int pixelIndex = y*sourceImage.width + x;

		int b = (int) brightness(sourceImage.pixels[pixelIndex]);

		if (b <= maxBrightness) {
			//Draw a letter
			textFont(font, map(b, 0, maxBrightness, 18, 48));
			fill( constrain(b, 000, maxBrightness) );
			text(letters.charAt( (int) random(0, letters.length()) ), x, y);
		}
	}
}

void draw() {

}

void keyPressed() {
	background(#FFFFFF);
	createStuff();
	saveFrame("frames/frame-####.gif");
}