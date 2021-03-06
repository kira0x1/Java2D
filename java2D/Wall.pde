class Wall {

  Body body;
  float standW = 20;
  float r = 10;
  float w;
  float h;
  
  color wallColor = color(193,98,66);
  
  //constructor for room edges
  Wall(Direction dir) {
    if (dir == Direction.NORTH) {
     init(width/2f,standW/4f,true,(float)width);
    }
    else if (dir == Direction.SOUTH) {
      init(width/2f,height-(standW/4),true,width);
    }
    else if (dir == Direction.EAST) {
      init(standW/4,height/2f,false,height);
    }
    //west
    else {
      init(width - (standW/4),height/2f,false,height);
    }
  }
  
  //normals constuctor
  Wall(float x, float y, boolean hoz, float len) {
    init(x,y,hoz,len);
  }
  
  //constructor information delegation
  private void init(float x, float y, boolean hoz, float len) {
    if (hoz) {
      w = len;
      h = standW;
    }
    else {
      w = standW;
      h = len;
    }
    bodyConst(x,y);
    
  }
  public void bodyConst(float x, float y) {
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
    fd.friction = 0.5;
    fd.restitution = 0.5;

    body.createFixture(fd);
  }
  public void show() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    fill(wallColor);
    stroke(0);
    rectMode(CENTER);
    rotate(-a);
    rect(0, 0, w, h);
    popMatrix();
  }
}
