int rows = 20;
int columns = 20;
int margin = 20;

float spacingX,spacingY;
float thickness;

void setup() {
	size(800,800);
	smooth();
	
	if (rows == 0) rows = 1;
	if (columns == 0) columns = 1;

	spacingX = (width-margin*2)/rows*0.50;
	spacingY = (height-margin*2)/columns;
	thickness = spacingX/5;

	stroke(#000000);
	strokeWeight(thickness);
	strokeCap(ROUND);

	createStuff();
}

void createStuff() {
	background(#ECECEC);
	for (int y = margin; y <= height-margin-spacingY; y+=spacingY) {
		for (int x = margin; x <= width-margin-spacingX; x+=spacingX) {
			if (random(1) > 0.50) {
				line(x,y,x+spacingX, y+spacingY);
			}	
			else {
				line(x+spacingX,y,x, y+spacingY);
			}	
		}
	}
}

void draw() {

}

void keyPressed() {
	createStuff();
}