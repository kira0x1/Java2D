class Player extends Agent {

  private Stats stats = new Stats();
  private Inventory inventory = new Inventory();

  ArrayList<Arrow> arrows = new ArrayList<Arrow>();
  
  
  //Player sprites file paths
  String imgPathLeft = "assets/player/player_left";
  String imgPathRight= "assets/player/player_right";
  String imgPathUp= "assets/player/player_up";
  String imgPathDown= "assets/player/player_down";
  
  private void setup(){
    agentColor = color(0,200,180, 100);
    inventory.AddItem(Items.healthPot);
    System.out.println(inventory.toString());
  }

  public Player(float x, float y,float w, float h){
    super(x,y,w,h, "assets/player/player_left.png","assets/player/player_right.png","assets/player/player_up.png","assets/player/player_down.png");
    setup();
  }

  public Player(){
    super();
    setup();
  }


  //Check if the player has stopped holding down a key
  void keyReleased() {
    if (key == 'd' && movDir.x == stats.GetSpeed()) {
      movDir.x = 0;
    }else if(key == 'a' && movDir.x == -stats.GetSpeed()){
     movDir.x = 0; 
   }

   if(key == 's' && movDir.y == -stats.GetSpeed()){
     movDir.y = 0; 
   }else if (key == 'w' && movDir.y == stats.GetSpeed()){
     movDir.y = 0; 
   }
 }

  //Check if player is holding w,a,s,d
  void keyPressed()
  {
   inventory.keyPressed();

   if (key == 'd') {
    if (movDir.x != stats.GetSpeed()) {
      movDir.x = stats.GetSpeed();
    }
  } else if (key == 'a') {
    if (movDir.x != -stats.GetSpeed()) {
      movDir.x = -stats.GetSpeed();
    }
  }

  if (key == 'w') {
    if (movDir.y != stats.GetSpeed()) {
      movDir.y = stats.GetSpeed();
    }
  } else if (key == 's') {
    if (movDir.y != -stats.GetSpeed()) {
      movDir.y = -stats.GetSpeed();
    }
  }
    //System.out.println(movDir.toString());

    if(key == 'x'){
      Vec2 pos = getPosition();
      arrows.add(new Arrow(pos.x, pos.y));
    }
  }

  public Vec2 getPosition(){
    return box2d.getBodyPixelCoord(body);
  }

  @Override
  public void display(){
    super.display();
    for(Arrow arrow : arrows){
      arrow.display();
    }
  }
}
