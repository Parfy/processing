
float n = 0;
float c = 4;
float x, y;

void setup(){
  size(600,600);
  background(0);
  noStroke();
  fill(255);
}


void draw(){

  translate(width/2, height/2);
  
  float a = radians(n * 137.5);
  float r = c * sqrt(n);
  
  x = r * cos(a);
  y = r * sin(a);
  
  ellipse(x, y, 4, 4);
  
  n++;
  
  
}