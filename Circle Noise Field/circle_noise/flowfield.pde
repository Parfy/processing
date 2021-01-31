// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Flow Field Following

class FlowField {

  // A flow field is a two dimensional array of PVectors
  float[][] field;
  int cols, rows; // Columns and Rows
  int resolution; // How large is each "cell" of the flow field

  FlowField(int r) {
    resolution = r;
    // Determine the number of columns and rows based on sketch's width and height
    cols = width/resolution;
    rows = height/resolution;
    field = new float[cols][rows];
    init();
  }

  void init() {
    // Reseed noise so we get a new flow field every time
    noiseSeed((int)random(10000));
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        field[i][j] = map(noise(xoff,yoff),0,1,0.2,4);
        yoff += 0.03;
      }
      xoff += 1;
    }
  }

  float lookup(int x, int y) {
    int column = int(constrain(x/resolution,0,cols-1));
    int row = int(constrain(y/resolution,0,rows-1));
    return field[column][row];
  }


}