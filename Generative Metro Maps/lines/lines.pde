
int margin = 160;
int grid_width = 12;
int grid_height = 8;
int line_count = 5;
int[][][] grid = new int[grid_width][grid_height][2];
float x_gap, y_gap;

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
    }
  }
}

void draw() {

  noFill();
  stroke(255, 0, 0);
  strokeWeight(8);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  beginShape();

  int x_start = int(random(grid_width));
  int y_start = int(random(grid_height));
  int x, y;
  //Choose whether the line runs west to east or north to south
  if (int(random(2)) > 0) { 
    x = 0;
    y = y_start;
  } else {
    x = x_start;
    y = 0;
  }

  Boolean step = true;

  vertex(grid[x][y][0], grid[x][y][1]);

  while (step) {
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    x += stepx;
    y += stepy;

    if (x >= grid_width || y >= grid_height || x < 0 || y < 0) {
      step = false;
    } else {
    vertex(grid[x][y][0], grid[x][y][1]);
    }
  }
  endShape();
}