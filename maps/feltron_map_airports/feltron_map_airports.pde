import processing.pdf.*;

PFont f;
PShape map;
String csv[];
String mets[][];

void setup(){
  size(1800,900);
  noLoop();
  f = createFont("Avenir-Medium", 12);
  
  map = loadShape("WorldMap.svg");
  csv = loadStrings("Routes with LatLong.csv");
  
  println(csv[1]);
  
  mets = new String[csv.length][17];
  for(int i = 0; i < csv.length; i++){
    mets[i] = csv[i].split(",");
  }
  
  println(mets[1][8]);

}


void draw(){
 // beginRecord(PDF, "meteorStrikes.pdf");

  shape(map, 0, 0, 1800, 900);
  
    for(int i=0; i<mets.length; i++){
    fill(255, 0, 0, 50);
    textMode(MODEL);
    noStroke();
    
    float graphLong = 0;
    float graphLat = 0;

    graphLong = map(float(mets[i][9]), -180, 180, 0, width);
    graphLat = map(float(mets[i][8]), 90, -90, 0, height);
    
  //  float markerSize = 0.05*sqrt(float(mets[i][2]))/PI;
  //  float time = map(float(mets[i][1]), 1900, 2000, 0, 6000);
    
  //  if(time < millis()){
   //ellipse(graphLong, graphLat, markerSize, markerSize);
    ellipse(graphLong, graphLat, 5, 5);
    
   // if(mets[i][6].equals("1")){
      fill(0);
      textFont(f);
//      text(mets[i][0]+", "+ mets[i][1], graphLong + markerSize + 5, graphLat + 4);
      noFill();
      stroke(0);
  //    line(graphLong+markerSize/2, graphLat, graphLong+markerSize, graphLat);
      }
   // }
  }
  
//  endRecord();

// println("PDF Saved!");
  
  
//}