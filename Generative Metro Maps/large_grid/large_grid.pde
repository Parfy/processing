import dawesometoolkit.*;

DawesomeToolkit dawesome;
int margin = -100;
int grid_width = 200;
int grid_height = 150;
int line_count = 100;
PVector[][] grid = new PVector[grid_width][grid_height];
float x_gap, y_gap;
ArrayList<Integer> colors;
TubeLine[] lines = new TubeLine[line_count];
ArrayList<Station> stations = new ArrayList<Station>();


void setup() {

  fullScreen();
  //size(900, 600);
  background(0);
  noLoop();

  x_gap = (width - 2*margin) / (grid_width - 1);
  y_gap = (height - 2*margin) / (grid_height - 1);

  for (int y = 0; y < grid_height; y++) {
    for (int x = 0; x < grid_width; x++) {

      grid[x][y] = new PVector((margin + x*x_gap), (margin + y*y_gap));

      // fill(255);
      //  ellipse(grid[x][y].x, grid[x][y].y, 8, 8);
    }
  }
  dawesome = new DawesomeToolkit(this);
  colors = dawesome.colorSpectrum(line_count, 0.3, 0.99);

  for (int i = 0; i < line_count; i++) {
    lines[i] = new TubeLine(i*0, color(255, random(180)));
  }
  
}

void draw() {
  for (int i = 0; i < line_count; i++) {
    lines[i].render();
  }
  
}

void keyPressed(){
  if(key == 's'){
    String r = str(int(random(10)));
    saveFrame(r + "####.png");
  }
}