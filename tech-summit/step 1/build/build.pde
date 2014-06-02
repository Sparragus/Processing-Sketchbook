/*
	Visualización del ajuste por combustible que aparece en la
	factura de energía de la Autoridad de Energía Eléctrica de
	Puerto Rico.

	Autor: Richard B. Kaufman-López <richardbkaufman@gmail.com>
	Fecha: 2014-06-02
*/

Table data;

void setup() {
	size(800,800);
	background(#FFFFFF);

	createStuff();
	drawData();
}

void createStuff() {
	data = new Table("ajuste-por-combustible.csv");
}

void drawData() {
	
}

void draw() {

}
				