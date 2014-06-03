import controlP5.*;
import processing.pdf.*;

float rectWidth = 100;
float ellipseRadius = rectWidth/2;

ControlP5 cp5;

boolean exportPDF = false;


void setup() {
	if(exportPDF){
		size(800,800, PDF, "tiles.pdf");
		// smooth();
		ellipseRadius = 112;
	}
	else {
		size(800,800);
		smooth();
		cp5 = new ControlP5(this);
	  	cp5.addSlider("ellipseRadius")
	  	 .setValue(112)
	     .setPosition(100,50)
	     .setRange(25,400)
	     ;
	}

	
}

void draw() {
	background(#000000);
	for (int x = 0; x < width; x+=rectWidth) {
		for (int y = 0; y < height; y+=rectWidth) {
			drawTile(x,y);
		}
	}

	if(exportPDF) {
		exit();
	}
}
			
void drawTile(float x, float y){
	noFill();
	stroke(#FFFFFF);
	strokeWeight(1);

	rectMode(CENTER);
	ellipseMode(CENTER);

	rect(x+rectWidth/2, y+rectWidth/2, rectWidth, rectWidth);
	ellipse(x+rectWidth/2, y+rectWidth/2, ellipseRadius*2, ellipseRadius*2);
	ellipse(x+rectWidth, y+rectWidth, ellipseRadius/2, ellipseRadius/2);

}	