import controlP5.*;

Mover[] movers;
Attractor a;
ControlP5 cp5;


void setup() {
  size(500, 500);
  background(200);

  cp5 = new ControlP5(this);

  movers = new Mover[2];
  for (int i = 0; i < movers.length; i++) {
        movers[i] = new Mover(1, 200, 200);
  }
  
  a = new Attractor();
  
  movers[0].applyForce(new PVector(10,0) );
  movers[1].applyForce(new PVector(-10,0) );
}

void draw() {
  fill(200, 40);
//  rect(0, 0, width, height);
  
  a.display();

  for (int i = 0; i < movers.length; i++) {
    PVector gravity = a.attract(movers[i]);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}
