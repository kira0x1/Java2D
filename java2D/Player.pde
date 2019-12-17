class Player {
  public Stats stats = new Stats();

  //The players current position
  public PVector curPos = new PVector(width/2,height/2);
  
  //The direction to move the player
  public PVector movDir = new PVector();



  //TODO CHANGE TO BODY
  
  
  //Move the player
  public void Move() {
    curPos.x += movDir.x;
    curPos.y += movDir.y;
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

  public void show() {
    //Move player
    Move();
    fill(0,255,0);
    rect(curPos.x, curPos.y, 55, 55);
  }
}
