
int margin = 160;
int grid_width = 12;
int grid_height = 8;
int line_count = 5;
int[][][] grid = new int[grid_width][grid_height][2];
float x_gap, y_gap;
TubeLine[] lines = new TubeLine[line_count];


void setup() {

  size(900, 600);
  background(0);
  noLoop();

  x_gap = (width - 2*margin) / (grid_width - 1);
  y_gap = (height - 2*margin) / (grid_height - 1);

  for (int y = 0; y < grid_height; y++) {
    for (int x = 0; x < grid_width; x++) {

      grid[x][y][0] = int(margin + x*x_gap);
      grid[x][y][1] = int(margin + y*y_gap);

      // fill(255);
      // ellipse(int(margin + x*x_gap),int(margin + y*y_gap), 8,8);
    }
  }

  for (int i = 0; i < line_count; i++) {
    lines[i] = new TubeLine(color(random(255), random(255), random(255),random(255)));
  }
}

void draw() {
  for (int i = 0; i < line_count; i++) {
    lines[i].render();
  }
}