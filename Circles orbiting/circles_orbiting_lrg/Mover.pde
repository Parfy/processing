
class Mover {

  Body body;
  float r;
  boolean over = false; 
  String wd;
 
  Mover(float r_, float x, float y, String word) {
    r = r_;
    wd = word;
    hover_ext = (int) r;
    // Define a body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;

    // Set its position
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(random(-5,5),random(-5,-5)));
    body.setAngularVelocity(random(-1,1));
  }

  void applyForce(Vec2 v) {
    body.applyForce(v, body.getWorldCenter());
  }


  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    //rotate(a);
    //fill(150);
    if (overEvent() ) { 
      over = true;
      fill(224, 191, 25, 225);
    } else { 
      over = false;
      fill(10,118,100,170);
    }
    //stroke(0);
    //strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    fill(255);
    text(wd,0,0,2*hover_ext,hover_ext);
    popMatrix();
    

  }


  boolean overEvent() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float disX = pos.x - mouseX;
    float disY = pos.y - mouseY;
    hover_ext = hover_ext*10;
    
 
    if (sqrt(sq(disX) + sq(disY)) < r) {
      if(mousePressed) { first = wd;}
      return true;
    } else {
      hover_ext = (int) r;
      return false;
    }
  }
}