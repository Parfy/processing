

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

FlowField flowfield;
ArrayList<Mover> movers = new ArrayList<Mover>();

int res = 16;

void setup() {
  //size(displayWidth, displayHeight);
  size(600,600);
  smooth();
  noStroke();
  noCursor();

  float w = width/res;
  float h = height/res;

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);

  flowfield = new FlowField(20);

  for (int i = 0; i < w*h; i++) {
    int x = res * (1+int(i % w));
    int y = res * (1+int(i / w));
    float v = flowfield.lookup(x, y);
    int density;
    density = int(12 / v);
   // println(density);
    for(int j = 0; j < density; j++){
      movers.add(new Mover(v*v*v/2, x+random(-10,10), y+random(-10,10)));
      }
  }
}

void draw() {
  background(250);

  box2d.step();

  for (Mover move : movers) {
    move.display();
  }
}


void keyPressed() {
  
  if(key == 's'){
    saveFrame("####.png");
  }
 }