class TubeLine {
  PVector p, o, q; 
  int x, y, x_start, y_start, ct;
  float dir;
  color _c;
  int offset;

  TubeLine(int i, color c) {

    offset = i;
    _c = c;
    p = new PVector(0, 0);
    o = new PVector(0, 0);
    x_start = int(random(grid_width));
    y_start = int(random(grid_height));

    //Choose whether the line runs west to east or north to south
    if (int(random(2)) > 0) { 
      x = 0;
      y = y_start;
    } else {
      x = x_start;
      y = 0;
    }
    p = grid[x][y];
    o = grid[grid_width - x - 1][grid_height - y - 1];
    q = PVector.sub(o, p);
    dir = q.heading();
  }

  void render() {
    noFill();
    stroke(_c);
    strokeWeight(8);
    strokeJoin(ROUND);
    strokeCap(ROUND);

    Boolean step = true;

    translate(offset, -offset);
    beginShape();
    vertex(grid[x][y].x, grid[x][y].y);
    ct = 0;
    for (Station stat : stations) {
      if (stat.pos == grid[x][y]) {
        ct++;
      }
    }
    if (ct == 0) { 
      stations.add(new Station(grid[x][y]));
    }

    while (step) {

      int stepx = int(round(cos((randomGaussian() * PI/6) + dir)));
      int stepy = int(round(sin((randomGaussian() * PI/6) + dir)));
      x += stepx;
      y += stepy;

      if (x >= grid_width || y >= grid_height || x < 0 || y < 0) {
        step = false;
      } else {
        ct=0;
        vertex(grid[x][y].x, grid[x][y].y);
        for (Station stat : stations) {
          if (stat.pos == grid[x][y]) {
            ct++;
          }
        }
        if (ct == 0) { 
          stations.add(new Station(grid[x][y]));
        }
      }
    }
    endShape();
  }
}