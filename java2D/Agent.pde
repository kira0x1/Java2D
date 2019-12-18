class Agent {
  protected Body body; 
  float w = 5;
  float h = 5;

  protected color agentColor = color(127,100);

  protected Vec2 curPos = new Vec2(0, 0);
  protected Vec2 movDir = new Vec2(0, 0);

  protected PImage imageLeft;
  protected PImage imageRight;
  protected PImage imageDown;
  protected PImage imageUp;

  protected PImage playerImage;


  //Show the rect collider
  protected boolean debugPhysics = true;

  public Agent() {
    this(width/2, height/2, 20, 20);
  }

  public Agent(float x, float y, float w, float h) {
    this.w = w;
    this.h = h;

    curPos = new Vec2(x, y);


    //create box
    makeBody(curPos, w, h);

    imageDown = loadImage("assets/player/player_down.png");
    playerImage = imageDown;
  }

  //Move the player
  public void Move() {
    curPos.x -= movDir.x;
    curPos.y += movDir.y;
  }


  public void destroyBody() {
    box2d.destroyBody(body);
  }

  public void display() {
    Move();
    Vec2 pos = box2d.getBodyPixelCoord(body);

    rectMode(CENTER);
    pushMatrix();

    //TODO Change  name to agentImage
    //Display the player sprite
    image(playerImage, pos.x - playerImage.width/2, pos.y - playerImage.height/2);

    //Translate agent
    translate(pos.x, pos.y);

    //Add the movement velocity
    body.setLinearVelocity(movDir);

    if (debugPhysics) {

      //Color player
      fill(agentColor);

      rect(0, 0, w, h);
    }

    popMatrix();
  }


  public void makeBody(Vec2 center, float w_, float h_) {

    //Define Polygon
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);



    //Define Fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;


    //Define body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);
    body.setGravityScale(0);
  }
}
