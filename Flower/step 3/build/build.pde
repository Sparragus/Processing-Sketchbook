HDrawablePool pool;
HColorPool colors;

void setup() {
	size(800,800);
	H.init(this).background(#000000);
	smooth();

	colors = new HColorPool(
		// #FCFCFC,#F1F1F1, // whites
		// #D96B29,#F1B872,#EAE086,#D3CE50,#6ABFA1//, #59453A
		#E8817C,#F7B6A8,#FAD3CA,#F4C9B1,#E9E6D6,#73A596,#B6D6CC,#ABC9C0
		// #006999,#2699C6,#41B8E1,#92DCF4 // ice
		// #73CC78,#83D087,#649968,#6A9C6D,#6E8B71,#DCFEDF // mint
	);

	pool = new HDrawablePool(8*8);
	pool.autoAddToStage()
		.add(new HShape("flower-01.svg"))
		.add(new HShape("flower-02.svg"))
		.add(new HShape("flower-03.svg"))
		.add(new HShape("flower-04.svg"))
		.add(new HShape("flower-05.svg"))
		.add(new HShape("flower-06.svg"))
		.add(new HShape("flower-07.svg"))
		.add(new HShape("flower-08.svg"))
		.add(new HShape("flower-09.svg"))
		.add(new HShape("flower-10.svg"))
		
		.layout(
			new HGridLayout()
			.startX(50)
			.startY(50)
			.spacing(100,100)
			.cols(8)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj){
					HShape d = (HShape) obj;
					d
							.enableStyle(false)
							.stroke(#000000)
							.strokeWeight(1)
							.strokeJoin(ROUND)
							.strokeCap(ROUND)
							.size(100)
							.rotate(90 * ((int) random(4)))
							.anchorAt(H.CENTER)
					;
					d.randomColors(colors.fillOnly());
				}
			}
		)
		.requestAll()
	;

	H.drawStage();
}

void draw() {
	
}

void keyPressed() {
	switch (key) {
    case 's':
    	saveFrame("flower-####.png");
    	break;
  }
}