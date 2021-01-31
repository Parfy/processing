class Station {
  String name;
  PVector pos;

  Station(PVector _pos) {
    pos = _pos;
    name = str(int(random(1000)));
  }

  void render() {
    strokeWeight(3);
    stroke(255);
    fill(0);
    ellipse(pos.x, pos.y, 10, 10);
    noStroke();
    fill(255);
    textFont(font);
    text(name, pos.x + 10, pos.y );

  }
}