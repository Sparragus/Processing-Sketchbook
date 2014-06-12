int rows = 8;
int margin = 20;
float spacing;
float thickness;

void setup() {
	size(800,800);
	smooth();

	if (rows == 0) rows = 1;
	spacing = (width-margin*2)/rows;
	thickness = spacing/5;

	stroke(#000000);
	strokeWeight(thickness);
	strokeCap(ROUND);

	createStuff();
}

void createStuff() {
	background(#ECECEC);
	for (int y = margin; y <= height-margin-spacing; y+=spacing) {
		for (int x = margin; x <= width-margin-spacing; x+=spacing) {
			if (random(1) > 0.50) {
				line(x,y,x+spacing, y+spacing);
			}	
			else {
				line(x+spacing,y,x, y+spacing);
			}	
		}
	}
}

void draw() {

}

void keyPressed() {
	createStuff();
}