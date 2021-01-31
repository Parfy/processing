
//TOO SLOW!!!


import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

Mover[] movers = new Mover[50];
Attractor a;

Table data;
PImage img;
PImage imgMask;
String first;
int k = (int) random(0,300);
int r = 100;
int leng = 1;
int hover_ext;


void setup() {
  size(displayWidth,displayHeight);
  smooth();
  noStroke();
  
  img = loadImage("pug.jpg");
  imgMask = loadImage("circle.jpg");
  img.mask(imgMask);
  img.resize(300,300);
  
  imageMode(CENTER);

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  data = loadTable("tags_url", "csv");

TableRow row1 = data.getRow(k);
first = row1.getString(0);

  a = new Attractor(150,width/2,height/2, first);

}

void draw() {
  background(150);

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
    int perc = (int) map(row.getFloat(5),0,100,2,120);
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

void loadimg(String tag){
 
  TableRow result = data.findRow(tag, 0);
  String url = result.getString(4);
  PImage img1 = requestImage(url,"jpg");
    if (img1.width == 0) {
    // Image is not yet loaded
  } else if (img1.width == -1) {
    // This means an error occurred during image loading
  } else {
    // Image is ready to go, draw it
      img1.resize(300,300);
      img1.mask(imgMask);
      img = img1;
  }
  print(url);


}
