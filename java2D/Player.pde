class Player {
  public Stats stats = new Stats();

  public PVector curPos = new PVector();
  public PVector movDir = new PVector();



  public void Move() {
    curPos.x += movDir.x;
    curPos.y += movDir.y;
  }



  void keyPressed() {
    if (key == 'd') {
      if (movDir.x != stats.GetSpeed())
      {
        movDir.x = stats.GetSpeed();
      } else {
        movDir.x = 0;
      }
    } else if (key == 'a') {
      if (movDir.x != -stats.GetSpeed()) {
        movDir.x = -stats.GetSpeed();
      } else {
        movDir.x = 0;
      }
    }

    if (key == 'w') {
      if (movDir.y == 0)
        movDir.y = -stats.GetSpeed();
      else 
      movDir.y = 0;
    } else if (key == 's') {
      if (movDir.y == 0)
        movDir.y = stats.GetSpeed();
      else 
      movDir.y = 0;
    }


    System.out.println(movDir.toString());
  }

  public void show() {
    Move();
    rect(curPos.x, curPos.y, 55, 55);
  }
}
