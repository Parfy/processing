PImage img;
int l = 40;
color c;
PVector pos, step;
float ang;
int jump = 30;

void setup() {
  size(600, 600);
  img = loadImage("drake.jpg");
  pos = new PVector(width/2, height/2); 

  background(0);
}

void draw() {

  step = PVector.fromAngle(floor(random(4))*PI/2);
  step.mult(random(jump));

  for (int i = 0; i< 20; i++) {
    brush((int)pos.x, (int)pos.y);
  }
  pos.add(step);
  if (pos.x > width || pos.y > height || pos.x < 0 || pos.y < 0) {
    step.mult(-2);
    pos.add(step);
  }

  if ((frameCount % 100) == 0) {
    saveFrame("pic-######.png");
  }

  if ((frameCount % 2000) == 0 ) {
    l -= 5;
    jump += 10;
    if (l < 5) {
      exit();
    }
  }
}

void brush(int x, int y) {
  x = x + int(random(l));
  y = y + int(random(l));
  c = img.get(x, y);
  fill(c, 20);
  noStroke();
  pushMatrix();
  translate(x, y);
  translate(random(l), random(l));
  rect(0, 0, l*random(2), l*random(2));

  popMatrix();
}

void keyPressed() {
  saveFrame("pic-######.png");
}
