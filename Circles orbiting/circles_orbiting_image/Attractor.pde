class Attractor {
  
  // We need to keep track of a Body and a radius
  Body body;
  float r;
  String wd;

  Attractor(float r_, float x, float y, String word) {
    r = r_;
    wd = word;
    // Define a body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    body.createFixture(cs,1);

  }


  // Formula for gravitational attraction
  // We are computing this in "world" coordinates
  // No need to convert to pixels and back
  Vec2 attract(Mover m) {
    float G = 1000; // Strength of force
    // clone() makes us a copy
    Vec2 pos = body.getWorldCenter();    
    Vec2 moverPos = m.body.getWorldCenter();
    // Vector pointing from mover to attractor
    Vec2 force = pos.sub(moverPos);
    float distance = force.length();
    // Keep force within bounds
    distance = constrain(distance,1,5);
    force.normalize();
    // Note the attractor's mass is 0 because it's fixed so can't use that
    float strength = (G * 1 * m.body.m_mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mulLocal(strength);         // Get force vector --> magnitude * direction
    return force;
  }

  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    //rotate(a);
    //texture(img_ph);
    //stroke(0);
    //strokeWeight(1);
    fill(255,85,0,200);
    ellipse(0,0,r*2,r*2);
    image(img,0,0);
    fill(255);
    text(first,0,0, 2*r,r);
    popMatrix();
  }
}

