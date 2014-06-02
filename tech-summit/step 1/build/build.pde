/*
	Visualización del ajuste por combustible que aparece en la
	factura de energía de la Autoridad de Energía Eléctrica de
	Puerto Rico.

	Autor: Richard B. Kaufman-López <richardbkaufman@gmail.com>
	Fecha: 2014-06-02
*/

// Real = Adjusted for inflation.
// Nominal = Not adjusted for inflation.

import processing.pdf.*;

Table data;

boolean CURVED = true;

void setup() {
	// size(800,800, P2D);
	size(800,800, PDF, "graph.pdf");
	background(#FFFFFF);

	createStuff();
}

void createStuff() {
	data = new Table("ajuste-por-combustible.csv");
}

void drawDataShape(Table table, int column, color c) {
	fill(c, 200);
	noStroke();

	float x,y;
	float cost, mappedCost;
	String date;
	float angle = -HALF_PI;
	float dAngle = TWO_PI/(table.getRowCount()-1);

	float minimum = table.getColumnMin(column);
	float maximum = table.getColumnMax(column);


	/* String[] columns = ["Fecha","Residencial","Comercial","Industrial",
						   "AlumbradoPúblico","Agrícola","Otros","Total","Nota"];
	*/

	pushMatrix();
		translate(width/2, height/2);
		beginShape();
			for (int row = 1; row < table.getRowCount(); ++row) {
				date = table.getRowName(row);
				cost = table.getFloat(row, column);
				mappedCost = map(cost, minimum, maximum, 77, 375);

				x = mappedCost * cos(angle);
				y = mappedCost * sin(angle);
				if(CURVED) {
				curveVertex(x, y);
				}
				else{
					vertex(x, y);
				}

				angle -= dAngle;
			}
		endShape(CLOSE);
	popMatrix();
}

void drawDataLines(Table table, color c) {
	noFill();
	stroke(c, 60);

	float x,y;
	float cost, mappedCost;
	String date;
	float angle = -HALF_PI;
	float dAngle = TWO_PI/(table.getRowCount()-1);

	/* String[] columns = ["Fecha","Residencial","Comercial","Industrial",
						   "AlumbradoPúblico","Agrícola","Otros","Total","Nota"];
	*/

	pushMatrix();
		translate(width/2, height/2);
		for (int row = 1; row < table.getRowCount(); ++row) {
			date = table.getRowName(row);
			cost = table.getFloat(row, 1);
			mappedCost = map(cost, 4.7045, 22.9372, 77, 375);

			x = mappedCost * cos(angle);
			y = mappedCost * sin(angle);
			line(0,0,x,y);

			angle -= dAngle;
		}
	popMatrix();
}

void draw() {
	//Precio Real Barril Petroleo
	drawDataShape(data, 4, #F92772);

	//Precio Real Ajuste Combustible
	drawDataShape(data, 2, #5ED9EF);


	exit();
}
				