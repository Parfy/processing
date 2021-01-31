class Station {
  String name;
  PVector pos;

  Station(PVector _pos) {
    pos = _pos;
    name = names[int(random(4000))];
  }

  void render() {
    strokeWeight(3);
    stroke(255);
    fill(0);
    ellipse(pos.x, pos.y, 10, 10);
    noStroke();
    fill(255);
    textFont(font);

    pushMatrix();
    translate(pos.x + 10, pos.y);
    rotate(-PI/4);
  //  translate(pos.x + 10, pos.y);
    text(name, 0, 0);
    popMatrix();
  }
}