import dawesometoolkit.*;

PFont font;
DawesomeToolkit dawesome;
int margin = 100;
int grid_width = 9;
int grid_height = 6;
int line_count = 5;
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
  colors = dawesome.colorSpectrum(line_count, 0.6, 0.8);

  for (int i = 0; i < line_count; i++) {
    lines[i] = new TubeLine(i*0, color(colors.get(i)));
  }
  
  font = createFont("ArialNarrow-Bold-18.vlw", 14);
}

void draw() {
  for (int i = 0; i < line_count; i++) {
    lines[i].render();
  }

  for (Station stat : stations) {
    stat.render();
  }
  
}