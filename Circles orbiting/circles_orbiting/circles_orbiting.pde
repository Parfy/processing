

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Mover[] movers = new Mover[70];
Attractor a;

Table data;
String first;
int k = 10;
int r = 100;
int leng = 1;



void setup() {
  size(displayWidth,displayHeight);
  smooth();
  noStroke();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  data = loadTable("bb.txt", "tsv");
  data.addColumn();
  data.addColumn();

for(TableRow row : data.rows()){
  String comb = row.getString(0);
  String year = comb.substring(0,4);
  String name = comb.substring(5);
  row.setString(3, year);
  row.setString(4, name);
  }

TableRow row1 = data.getRow(k);
first = row1.getString(4);

  a = new Attractor(52,width/2,height/2, first);

}

void draw() {
  background(50);

  box2d.step();

  
  if(movers[0] != null){
  for (int i = 0; i < leng; i++) {
    Vec2 force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].display();
  }
  }
    a.display();
}



void mousePressed(){
  getRels(first);
}

void getRels(String lookup){  
 int len = 0;
 String[] list = {};
  for (TableRow row : data.findRows(lookup, 4)) {
    len++;
    String entry = row.getString(4);
    list = append(list, entry);
  } 
  leng = len;
    for (int i = 0; i < leng; i++) {
    movers[i] = new Mover(random(40,60),width/2,height/2,list[i]);
  }
}





