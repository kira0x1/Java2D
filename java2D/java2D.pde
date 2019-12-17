import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
Box2DProcessing box2d;
//bully me if i dont anotate code
Doorway test;

//Player Variable
Player player;

void setup() {
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  size(800, 800);

  player = new Player();
  test = new Doorway(400,400,true);
}

void draw() {
  clear();
  background(255);
  test.show();
  player.show();  
}

void keyPressed(){
 player.keyPressed(); 
}

void keyReleased(){
 player.keyReleased(); 
}
