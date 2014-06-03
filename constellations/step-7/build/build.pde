/*
	Places N random dots wherever a pixel is dark/black.
 */

int num = 100;
ArrayList<Ball> balls;

boolean saveFrames = false;
int startFrame;

PFont f;

void setup() {
  size(851, 315);
  smooth();
  f = loadFont("GillSans-48.vlw");

  createStuff();
  // noLoop();
}

void createStuff() {

  // Black rect in center.
  rectMode(CORNER);
  fill(#000000);
  rect(0, 0, width, height);
  // rect(0, height/2, width/2, height/2);

  // Init balls;
  balls = new ArrayList<Ball>();

  // Randomly select a pixel.
  // If it selects a black pixel, then create a circle over it.
  loadPixels();
  for (int i = 0; i < num; ++i) {
    int x = (int) random(width);
    int y = (int) random(height);
    int pixelIndex = y*width + x;

    if ( brightness(pixels[pixelIndex]) < 10 ) {
    // if ( (x < width && y < height/2) || (x < width/2 && y < height) ) {
      PVector location = new PVector(x, y);
      int radius = (int) random(5, 100);
      int offset = 0;
      color c = #FBD131;
      balls.add(new Ball(location, radius, offset, c));
    }
  }
}

void draw() {
  rectMode(CENTER);
  fill(#71B4C7, 255);
  rect(width/2, height/2, width, height);

  // Black rect in center.
  // rectMode(CENTER);
  // fill(#000000, 40);
  // rect(width/2, height/2, width*0.90, height*0.90);

  for (int i = 0; i < balls.size (); ++i) {
    Ball curBall = balls.get(i);

    // Draw connections. We start at j = i+1 because we don't want to make a connection
    // with balls we had already connected to, including balls[i] itself.
    for (int j = i+1; j < balls.size (); ++j) {
      Ball destinationBall = balls.get(j);
      if ( drawConnetion(curBall, destinationBall) ) {
        curBall.incrementConnectionsBy(1);
        destinationBall.incrementConnectionsBy(1);
      }
    }

    curBall.run();
  }

  if (saveFrames) {
    if (frameCount <= startFrame + 360) {
      saveFrame("frames/frame-####.gif");
    } else {
      println("gifsicle --colors=32 --resize-width=800 --delay=3 -O2 --loop  *.gif > animation.gif");
      saveFrames = false;
    }
  }
}

boolean drawConnetion(Ball from, Ball to) {
  int maxDistance = 75;
  int distance = (int) from.location.dist( to.location );

  if ( distance < maxDistance ) {
    int strokeAlpha = (int) map(distance, 0, maxDistance, 255, 50);
    stroke(#DC275C, strokeAlpha);
    strokeWeight(2);
    line(from.location.x, from.location.y, to.location.x, to.location.y);
    return true;
  }
  return false;
}

void keyPressed() {
  if (key == ' ') {
    createStuff();
  }
  if (key == 's') {
    // saveFrames = true;
    // startFrame = frameCount;
    saveFrame("promo-####.png");
  }

  // strokeWeight(6); 
  // stroke(230); 
  // noFill(); 
  // rectMode(CORNER);
  // rect(550, 140, 285, 135); 
  // fill(230); 
  // text("Introducción a Programación", 560, 170); 
  // text("para Artistas Visuales", 560, 192);  
  // textFont(f, 16); 
  // text("15 y 16 de mayo, 7:00-9:00pm", 560, 223); 
  // text("$25", 560, 243); 
  // text("Beta Local, Viejo San Juan", 560, 261); 
  // noLoop(); 
  // save("promo.jpg");
}

