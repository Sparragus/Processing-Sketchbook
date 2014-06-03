/*
	Places N random letters wherever a pixel is dark/black.
*/

int num = 20000;
PImage sourceImage;
PFont font;
String letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";

boolean saveFrames = false;
int startFrame;

void setup() {
	size(800,800);
	background(#333333);
	smooth();
	fill(#FF6600);
	createStuff();

}

void createStuff() {

	// Load image
	sourceImage = loadImage("outline.png");
	// Match canvas size to image size
	size(sourceImage.width, sourceImage.height);
	// image(sourceImage, 0, 0);
	// Load font
	font = loadFont("Baskerville-48.vlw");

	// Randomly select a pixel.
	// If it selects a black pixel, then place a random letter over it.
	sourceImage.loadPixels();
	for (int i = 0; i < num; ++i) {
		int x = (int) random(sourceImage.width);
		int y = (int) random(sourceImage.height);
		int pixelIndex = y*sourceImage.width + x;
		
		if ( brightness(sourceImage.pixels[pixelIndex]) < 10 ) {
			pushMatrix();
				translate(x,y);

				boolean foundWhite = false;
				int dx,dy;
				int r = 1;
				int angle = 0;
				while(!foundWhite) {
					dx = (int) (r * cos(radians(angle)));
					dy = (int) (r * sin(radians(angle++))); 
					if(angle%360 == 0) {
						++r;
					}

					pixelIndex = (y+dy)*sourceImage.width + (x+dx);

					if (pixelIndex<sourceImage.pixels.length && brightness(sourceImage.pixels[pixelIndex]) > 10 ) {
						foundWhite = true;
					}

				}
				textFont(font, (int) map(r, 1,10,8,20));

				// rotate(random(0, TWO_PI));
				//Draw a letter
				text(letters.charAt( (int) random(0, letters.length()) ), 0, 0);
			popMatrix();
		}

	}

}

void draw() {
	
}

void keyPressed() {
	if(key == 's') {
		saveFrames = true;
		startFrame = frameCount;
	}
}
				