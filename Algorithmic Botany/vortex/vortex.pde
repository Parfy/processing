
float n = 0;
float c = 12;
float x, y;
float rot = 0;

void setup(){
  size(600,600);
  background(0);
  noStroke();
  fill(255);
  
}


void draw(){

  background(0);
  translate(width/2, height/2);
  rotate(rot);
  Sunflower(1200);
   
  rot += 0.03; 
}

void Sunflower(int s){
  
    for(int i = 0; i < s; i++){
    float a = radians(i * 137.2);
    float r = c * sqrt(i);
  
    x = r * cos(a);
    y = r * sin(a);
  
    ellipse(x, y, 12, 12);
  }
}