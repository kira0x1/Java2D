class Doorway {
  float gapSize = 100;
  float standW;
  ArrayList<Wall> walls = new ArrayList<Wall>();
  
  Doorway(float x, float y, boolean hoz) {
    //max size of the appropriate axis
    float maxSize;
    float remDist;
    if (hoz) {
      maxSize = width;
      remDist = maxSize - x;
      //wall closer to 0,0
      float xInpOne = (x-(gapSize/2))/2;
      float lenInpOne = x-(gapSize/2);
      walls.add(new Wall(xInpOne,y,true,lenInpOne));
      
      //further wall
      float xInpTwo = maxSize - (x-(gapSize/2))/2;
      float lenInpTwo = remDist - (gapSize/2);
      walls.add(new Wall(xInpTwo,y,true,lenInpTwo));
    }
    else {
      
      maxSize = height;
      remDist = maxSize - y;
      //wall closer to 0,0
      float yInpOne = (y-gapSize/2)/2;
      float lenInpOne = (y-gapSize/2);
      walls.add(new Wall(x,yInpOne,false,lenInpOne));
      
      //further wall
      float yInpTwo = y + (gapSize/2) + (remDist/2);
      float lenInpTwo = (y-gapSize/2);
      walls.add(new Wall(x,yInpTwo,false,lenInpTwo));
      
    }
  }
  void show() {
    for(Wall a: walls) {
      a.show();
    }
  }
}
