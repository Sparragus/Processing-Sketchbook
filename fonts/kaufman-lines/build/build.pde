/* 
// Author: Richard B. Kaufman López
// Email: richardbkaufman@gmail.com
// Web: http://richardkaufman.org
//
// Title: kaufman-lines
// Description: An auto-generated font based on AdabiMT-CondensedExtraBold 
// License: MIT
//
// Dependencies: 
//   - Fontastic: http://code.andreaskoller.com/libraries/fontastic/
*/

import fontastic.*;
Fontastic f;

char[] ALL_LETTERS = new char[] {'˜','!','"','#','$','%','&','\'','(',')','*','+',',','-','.','/','0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?','@','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','[','\\',']','^','_','`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','{','|','}','~','¡','¿','Á','É','Í','Ñ','Ó','Ú','Ü','á','é','í','ñ','ó','ô','õ','ö','ú','ü'};
PFont font;

// Letter properties
int N = 25;

// Alphabet properties
int spacingX = 100;
int spacingY = 90;

void setup() {
  size(512, 1024);
  font = loadFont("AbadiMT-CondensedExtraBold-400.vlw");
}

void draw() {
  // image(drawLetter('A'),0,0);
  createFont();
  exit();
}

void createFont() {
  if (f != null) { f.cleanup(); }

  f = new Fontastic(this, "kaufman-lines");

  f.setAuthor("Richard Kaufman");
  f.setVersion("1.0");
  f.setAdvanceWidth(600);

  PVector[][] points;
  // go through alphabet and create contours for each glyph
  for (char c : ALL_LETTERS) {
    f.addGlyph(c);

    points = drawLines(drawLetter(c));

    for (PVector[] p : points) {
      f.getGlyph(c).addContour(p);
    }
  }

  f.buildFont();
  f.cleanup();
}

PGraphics drawLetter(char l) {
  PGraphics letter = createGraphics(width, height);

  letter.beginDraw();
  letter.noStroke();
  letter.background(#FFFFFF);
  letter.fill(0);
  letter.textFont(font,800);
  letter.textAlign(CENTER,CENTER);
  letter.text(l, letter.width/2, letter.height/2);
  letter.endDraw();

  return letter;
}
				
PVector[][] drawLines(PGraphics letter) {
  letter.loadPixels();

  PVector[][] p = new PVector[N][4];
  for (int i = 0; i < N; ++i) {
    for (int j = 0; j < 2; ++j) {
      int x=0,y=0;
      color c = color(255);

      while(brightness(c) > 10) {
        x = (int) random(0,letter.width);
        y = (int) random(0,letter.height);

        c = letter.pixels[y*width+x];
      }

      p[i][j] = new PVector(x,letter.height-y-1);
    }

    p[i][2] = new PVector( p[i][1].x, p[i][1].y+1 );
    p[i][3] = new PVector( p[i][0].x, p[i][0].y+1 );

  }
  
  return p;
}