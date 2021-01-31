

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Mover[] movers = new Mover[50];
Attractor a;

Table data;
String first;
int k = (int) random(0,300);
int r = 100;
int leng = 1;
int hover_ext;


void setup() {
  size(displayWidth,displayHeight);
  smooth();
  noStroke();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  data = loadTable("tags", "csv");

TableRow row1 = data.getRow(k);
first = row1.getString(0);

  a = new Attractor(150,width/2,height/2, first);
//noCursor();
}

void draw() {
  background(253,186,170);

  box2d.step();

    a.display();
  if(movers[0] != null){
  for (int i = 0; i < leng && i < 50; i++) {
    Vec2 force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].display();
  }
  }
  //  a.display();
}



void mouseReleased(){
  getRels(first);
}

void getRels(String lookup){  
 int len = 0;
 String[] list = {};
 int[] sizes = {};
  for (TableRow row : data.findRows(lookup, 0)) {
    len++;
    String entry = row.getString(1);
    int perc = (int) map(row.getFloat(4),0,100,2, 160);
 //   print(perc+" \n ");
 //  print(len);
    sizes = append(sizes, perc);
    list = append(list, entry);
  } 
  leng = len;
    for (int i = 0; i < leng && i < 50; i++) {
    movers[i] = new Mover(sizes[i] ,width/2,height/2,list[i]);
  }
}


void keyPressed(){
  saveFrame(first + ".png");
}
