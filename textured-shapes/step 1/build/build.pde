PGraphics t;
PGraphics m;

int counter = 0;

void setup() {
  size(800, 800);
  createStuff();

  // noLoop();
}
void createStuff() {
  t = createGraphics(width,height);
  m = createGraphics(width,height);
}

void updateTexture(PGraphics _texture) {
  _texture.beginDraw();
  _texture.background(#BADA55);
  _texture.noFill();
  _texture.stroke(#DABA55);
  _texture.strokeWeight(25);
  for (int x = counter%50; x < _texture.width*2; x+=50) {
    _texture.line(x,0,0,x); 
  }
  _texture.endDraw();
}

void updateMask(PGraphics _mask) {
  _mask.beginDraw();
  _mask.smooth();
  _mask.background(#000000);
  // _mask.noStroke();
  _mask.fill(#FFFFFF);
  _mask.ellipse(_mask.width/2, _mask.height/2, _mask.width/2*sin(radians(counter)), _mask.height/2*sin(radians(counter)));
  _mask.endDraw();
}

void draw() {
  background(#FFFFFF);

  updateTexture(t);
  updateMask(m);
  PGraphics pg = applyMaskToTexture(t,m);
  image(pg,0,0);

  counter++;
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