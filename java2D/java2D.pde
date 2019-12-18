import java.util.*; 
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// testing room and level creation
Level test;

//Static reference of this app so we can use static classes
public static java2D app;
public static UI ui;

private CursorManager cursorManager;

Box2DProcessing box2d;
//bully me if i dont anotate code

//Player Variable
Player player;

ArrayList<Box> boxes = new ArrayList<Box>();


void setup() {
  
  frameRate(60);

  //Set app to this class
  app = this;

  //Initilize static class for items ( This is basically a database for items )
  Items.init();
  
  //Init ui
  ui = new UI();
  
  //Init CursorManager
  cursorManager = new CursorManager();


  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  //Turn on collision detection
  box2d.listenForCollisions();

  size(800, 800);


  //Create the player
  player = new Player(width/2, height/2, 30, 30);

  test = new Level(3, 11);

  //Add some boxes for collision testing
  for (int i = 0; i < 5; i ++) {
    Box box = new Box(10, 10);
    box.body.applyForceToCenter(new Vec2(5550, -5510));  
    boxes.add(box);
  }
}

void draw() {
  //<<<<<<< HEAD
  //println((int)random(2));
  //=======
  //ad>>>>>>> d2b44a1b149b5a066c6f7139c47fe422b28b66ca
  strokeWeight(0);
  background(255);

  //Step time
  box2d.step();


  test.show();

  //Show the player
  player.display();

  //Show the boxes
  for (Box box : boxes) {
    box.display();
  }
  
  
  ui.display();
}

void keyPressed() {
  player.keyPressed();
}

void keyReleased() {
  player.keyReleased();
} 

void mousePressed(){
   
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
