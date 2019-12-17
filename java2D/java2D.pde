import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


public static java2D app;


Box2DProcessing box2d;
//bully me if i dont anotate code
Doorway test;

//Player Variable
Player player;

ArrayList<Box> boxes = new ArrayList<Box>();


void setup() {

  app = this;
  Items.init();
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
 
   //Turn on collision detection
   box2d.listenForCollisions();

  size(800, 800);

  player = new Player(width/2, height/2, 20, 20);

  test = new Doorway(400, height-11, true);
  
  for(int i = 0; i < 5; i ++){
     Box box = new Box(10,10);
     box.body.applyForceToCenter(new Vec2(5550,-5510));  
     boxes.add(box);
  }
}

void draw() {
  clear();
  background(255);
  
  //Step time
   box2d.step();
  
  
  test.show();
  player.display();
  
  for(Box box: boxes){
    box.display(); 
  }
}

void keyPressed() {
  player.keyPressed();
}

void keyReleased() {
  player.keyReleased();
}

// Collision event functions!
void beginContact(Contact cp) {
  // Get both fixtures
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  
}


// Objects stop touching each other
void endContact(Contact cp) {
}
