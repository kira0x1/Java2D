class Player {
  public Stats stats = new Stats();

  public PVector curPos = new PVector();
  public PVector movDir = new PVector();


  public void Move() {
    curPos.x += movDir.x;
    curPos.y += movDir.y;

  }

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
    Move();
    rect(curPos.x, curPos.y, 55, 55);
  }
}
