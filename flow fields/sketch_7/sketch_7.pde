PImage colours;
float a;
float t = 0;
float z = 0;

// Using this variable to decide whether to draw all the stuff
boolean debug = false;

FlowField flowfield;
ArrayList<Vehicle> vehicles;

void setup() {
  //size(1000, 600, P3D);
  fullScreen(P3D);
  flowfield = new FlowField(10);
  vehicles = new ArrayList<Vehicle>();
  // Make vehicles with random maxspeed and maxforce values - Gaussian Location

  for (int i = 0; i < 400; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height)), random(8), random(0.1, 0.9)));
  }
  background(39);
  fill(200);
  noStroke();
}

void draw() {
  background(39);
  ambientLight(200, 200, 255);
  translate(-400, 0, 0);
  rotateY(radians(90));
  // Display the flowfield in "debug" mode
  if (debug) flowfield.display();
  // Tell all the vehicles to follow the flow field
  blendMode(ADD);
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }
  
  if(frameCount % 30 == 0){
    t += 0.1;
    flowfield.init();
  }

}


void keyPressed() {
  if (key == 's') {
    saveFrame("flow-######.png");
  }
}

// Make a new flowfield
void mousePressed() {
  flowfield.init();
}