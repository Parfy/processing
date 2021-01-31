

void setup(){
  size(800,800);
 // size(fullscreen);
  background(0);
  stroke(255, 255,0, 5);
  strokeWeight(0.5);
}

void draw(){
  
  translate(mouseX, mouseY);
  blendMode(ADD);
  pushMatrix();
  for(int i = 0; i < 300; i++){
    float leng = random(-100,100);
    float ang = random(-PI,PI);
    float x = leng * sin(ang);
    float y = leng * cos(ang);
    translate(random(-2,2),random(-2,2));
    line(0,0,x,y);

  }
  popMatrix();  
}