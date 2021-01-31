
float n = 0;
float c = 6;
float x, y;

void setup(){
  size(600,600);
  background(0);
  noStroke();
  fill(255);
  
}


void draw(){

  background(0);
  translate(width/2, height/2);
  rotate(map(mouseX, 0, width, -PI, PI));
  Sunflower(1000);
  
  
}

void Sunflower(int s){
  
    for(int i = 0; i < s; i++){
    float a = radians(i * 137.5);
    float r = c * sqrt(i);
  
    x = r * cos(a);
    y = r * sin(a);
  
    ellipse(x, y, 6, 6);
  }
}