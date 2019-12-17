class Wall {

  Body body;
  float r = 10;
  float w;
  float h;

  Wall(float x, float y, float w_, float h_) {
    w = w_;
    h = h_;

    //step 1 - body definition
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));

    //step 2 = make body
    body = box2d.createBody(bd);

    //step 3 create Shape
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    //step 4 create a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    //parameters
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 0.5;

    body.createFixture(fd);
  }
  public void show() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    fill(100);
    stroke(0);
    rectMode(CENTER);
    rotate(-a);
    rect(0, 0, w, h);
    popMatrix();
  }
}
