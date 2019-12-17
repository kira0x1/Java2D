class Player extends Agent {
  
  public Stats stats = new Stats();

  public Player(float x, float y,float w, float h){
    super(x,y,w,h);
  }

   public Player(){
    super(); 
   }


  //Check if the player has stopped holding down a key
  void keyReleased() {
    if (key == 'd' && movDir.x == stats.GetSpeed()) {
      movDir.x = 0;
    }else if(key == 'a' && movDir.x == -stats.GetSpeed()){
     movDir.x = 0; 
    }
    
    if(key == 's' && movDir.y == stats.GetSpeed()){
       movDir.y = 0; 
    }else if (key == 'w' && movDir.y == -stats.GetSpeed()){
       movDir.y = 0; 
    }
  }


  //Check if player is holding w,a,s,d
  void keyPressed()
  {
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
      if (movDir.y != -stats.GetSpeed()) {
        movDir.y = -stats.GetSpeed();
      }
    } else if (key == 's') {
      if (movDir.y != stats.GetSpeed()) {
        movDir.y = stats.GetSpeed();
      }
    }
    //System.out.println(movDir.toString());
  }
}
