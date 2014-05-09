
int roomSize, tileSize;
ArrayList<Collidable> collidables;
boolean collided;
Wall[] walls;
Tank player1;

void setup() {
  size(512, 512);
  background(#EEEEEE);

  // roomSize cannot be 0;
  roomSize = 8; // 8x8 Room 
  tileSize = width/roomSize;
  
  collidables = new ArrayList<Collidable>();
  walls = new Wall[roomSize];

  for (int i=0;i<walls.length;i++) {
    walls[i] = new Wall(i*tileSize, 0, tileSize, tileSize);
    collidables.add(walls[i]);
  }
  
  player1 = new Tank(300,300,64,64);
}

void draw() {
  background(#EEEEEE);

  //Walls
  for (int i=0;i<walls.length;i++) {
    walls[i].display();
  }
  
  // Check for collisions
  collided = false;
  for(Collidable c : collidables) {
    if(player1.collidesWith(c)) {
      collided = true;
      break;
    }
  }
  if(collided){
    player1.returnToPreviousPosition();
  }
  else {
    player1.move();
  }
  player1.display();
}
