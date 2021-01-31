
PVector p1, p2, p3;
float r1, d1, r2, d2;
float i1, i2;
float speed1 = 0.024;
float speed2 = 0.0167;
float m;
float x1, y1, x2, y2;

void setup(){
  //size(800,800);
  fullScreen();
  r1 = 200;
  r2 = 300;
  x1 = 280;
  y1 = 280;
  x2 = 420;
  y2 = 220;
  //x1 = random(width);
  //y1 = random(height);
  //x2 = random(width);
  //y2 = random(height);

  p1 = new PVector(x1 + r1, y1);
  p2 = new PVector(x2 + r2, y2);
  p3 = new PVector(0,0);

  background(0);
}


void draw(){
 // background(0);

  p1.x = x1 + r1 * sin(i1);
  p1.y = y1 + r1 * cos(i1);

  p2.x = x2 + r2 * sin(i2);
  p2.y = y2 + r2 * cos(i2);

  m = 1 + sin(i1);

  p3 = p2.sub(p1);
  p3 = p3.mult(m);
  p3 = p3.add(p1);

  //fill(255);
  //ellipse(p1.x, p1.y, 10, 10);
  //ellipse(p2.x, p2.y, 10, 10);

  //stroke(255);
  //strokeWeight(1);
  //line(p1.x, p1.y, p2.x, p2.y);

  blendMode(ADD);

  stroke(255,50);
  strokeWeight(1);
  line(p1.x, p1.y, p3.x, p3.y);

  //noStroke();
  //fill(255, 50);
  //ellipse(p3.x, p3.y, 5, 5);

  i1 += speed1;
  i2 += speed2;


}

void keyPressed(){
  saveFrame("pic-######.png");
}
