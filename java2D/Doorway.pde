class Doorway {
  float gapSize = 50;
  float standW;
  ArrayList<Wall> walls;
  
  Doorway(float x, float y, boolean hoz) {
    
    if (hoz) {
      //wall closer to 0,0
      float xInpOne = (x-gapSize/2)/2;
      float lenInpOne = (x-gapSize/2);
      walls.add(new Wall(xInpOne,y,true,lenInpOne));
      
      //further wall
      float xInpTwo = (x-gapSize/2)/2;
      float lenInpTwo = (x-gapSize/2);
      walls.add(new Wall(xInpTwo,y,true,lenInpTwo));
    }
    else {
      //wall closer to 0,0
      float yInpOne = (y-gapSize/2)/2;
      float lenInpOne = (y-gapSize/2);
      walls.add(new Wall(x,yInpOne,true,lenInpOne));
      
      //further wall
      float yInpTwo = (y-gapSize/2)/2;
      float lenInpTwo = (y-gapSize/2);
      walls.add(new Wall(x,yInpTwo,true,lenInpTwo));
    }
  }
}
