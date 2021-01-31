PGraphics pg;

void setup() {
  size(800, 800);
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(0);
  pg.noStroke();
  pg.smooth();
  pg.endDraw();
  frameRate(30);
}

void draw() {
  shiftImage(-(mouseX-width/2)/30, -(mouseY-height/2)/30);
  color d = color(255,0,0);
  color e = color(255,255,0);
  for(int i = 0; i < 12; i++){
    int xp = int(100*sin(i));
    int yp = int(100*cos(i));
    drawCircle(xp, yp, d);
  }

  image(pg, 0, 0);
}

void shiftImage(int dX, int dY) {
  PImage source = pg.get();

  int w = pg.width;
  int h = pg.height;
  int l = pg.pixels.length;

  for (int y=0; y<h; y++)
    for (int x=0, iS; x<w; x++) {
      iS = w*(y+dY) + x+dX;

      if (iS >= 0 & iS < l)
        pg.pixels[w*y + x] = source.pixels[iS];
    }

  pg.updatePixels();
}

void drawCircle(int x, int y, color c) {
  pg.beginDraw();
  pg.fill(0, 1);
  pg.rect(0, 0, pg.width, pg.height);
  float rad = 60 + sin(frameCount*0.05)*50;
  pg.fill(c);
  pg.stroke(0);
  pg.translate(x, y);
  pg.ellipse(pg.width/2, pg.height/2, rad, rad);
  pg.endDraw();
}
