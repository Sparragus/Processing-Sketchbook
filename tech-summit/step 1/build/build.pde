/*
	Visualización del ajuste por combustible que aparece en la
	factura de energía de la Autoridad de Energía Eléctrica de
	Puerto Rico.

	Autor: Richard B. Kaufman-López <richardbkaufman@gmail.com>
	Fecha: 2014-06-02
*/

Table data, inflatedData;

boolean CURVED = true;

void setup() {
	size(800,800);
	background(#FFFFFF);

	createStuff();
	noLoop();
}

void createStuff() {
	data = new Table("ajuste-por-combustible.csv");
	inflatedData = new Table("ajuste-por-combustible-inflacion.csv");
}

void drawDataShape(Table table, color c) {
	fill(c);
	noStroke();

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
		beginShape();
			for (int row = 1; row < table.getRowCount(); ++row) {
				date = table.getRowName(row);
				cost = table.getFloat(row, 1);
				mappedCost = map(cost, 4.7045, 22.9372, 77, 375);

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
			line(0,0,x, y);

			angle -= dAngle;
		}
	popMatrix();
}

void draw() {
	drawDataShape(inflatedData, #AA0000);
	drawDataShape(data, #5ED9EF);
	drawDataLines(inflatedData, #333333);
}
				