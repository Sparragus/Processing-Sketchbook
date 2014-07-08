PGraphics t;
PGraphics m;


void setup() {
  size(800, 800);
  background(#FFFFFF);

  createStuff();

  noLoop();
}
void createStuff() {
  t = createGraphics(width,height);
  m = createGraphics(width,height);

  t.beginDraw();
  t.background(#BADA55);
  t.noFill();
  t.stroke(#DABA55);
  t.strokeWeight(25);
  for (int x = 50; x < t.width*2; x+=50) {
    t.line(x,0,0,x); 
  }
  t.endDraw();

  m.beginDraw();
  m.background(#000000);
  m.noStroke();
  m.fill(#FFFFFF);
  m.ellipse(m.width/2, m.height/2, width/2, height/2);
  m.endDraw();
}

void draw() {
  PGraphics pg = applyMaskToTexture(t,m);
  image(pg,0,0);
}
				
PGraphics applyMaskToTexture(PGraphics _texture, PGraphics _mask){
  // Check sizes. texture's and mask's size must be identical.
  if(_texture.width != _mask.width ||
      _texture.height != _texture.height) {
    // throw new Exception("Texture and Mask does not have the same size.");
  }

  int _width = _texture.width;
  int _height = _texture.height;
  // Create new PGraphics with the pixels of texture where mask is white.
  PGraphics result = createGraphics(_width, _height);
  result.beginDraw();
  result.background(255, 0);
  result.endDraw();

  result.loadPixels();
  _texture.loadPixels();
  _mask.loadPixels();

  for (int y = 0; y < _height; ++y) {
    for (int x = 0; x < _width; ++x) {
      if( brightness(_mask.pixels[y*_width+x]) >= 127 ) {
        result.pixels[y*_width+x] = _texture.pixels[y*_width+x];
      }
    }
  }

  result.updatePixels();

  return result;
}