
public enum Direction { NORTH,SOUTH,EAST,WEST,ERROR }  

ArrayList<Direction> DirectionRemover(Direction one) {
    ArrayList<Direction> fullSet = new ArrayList<Direction>();
    fullSet.add(Direction.NORTH);
    fullSet.add(Direction.SOUTH);
    fullSet.add(Direction.EAST);
    fullSet.add(Direction.WEST);
    
    fullSet.remove(one);
    return fullSet;

  }
  
  ArrayList<Direction> DirectionRemover(Direction one, Direction two) {
    ArrayList<Direction> fullSet = new ArrayList<Direction>();
    fullSet.add(Direction.NORTH);
    fullSet.add(Direction.SOUTH);
    fullSet.add(Direction.EAST);
    fullSet.add(Direction.WEST);
    
    fullSet.remove(one);
    fullSet.remove(two);
    return fullSet;

  }
  
  ArrayList<Direction> DirectionRemover(Direction one, Direction two, Direction three) {
    ArrayList<Direction> fullSet = new ArrayList<Direction>();
    fullSet.add(Direction.NORTH);
    fullSet.add(Direction.SOUTH);
    fullSet.add(Direction.EAST);
    fullSet.add(Direction.WEST);
    
    fullSet.remove(one);
    fullSet.remove(two);
    fullSet.remove(three);

    return fullSet;

  }
  
  ArrayList<Direction> DirectionRemover(ArrayList<Direction> dirs) {
    ArrayList<Direction> fullSet = new ArrayList<Direction>();
    fullSet.add(Direction.NORTH);
    fullSet.add(Direction.SOUTH);
    fullSet.add(Direction.EAST);
    fullSet.add(Direction.WEST);
    
    for (Direction dir: dirs) {
      fullSet.remove(dir);
    }
    return fullSet;

  }
  Direction dirInvert(Direction dir) {
    Direction retVal = Direction.ERROR;
    switch(dir) {
      case NORTH: dir = Direction.SOUTH; break;
      case SOUTH: dir = Direction.NORTH; break;
      case EAST:  dir = Direction.WEST; break;
      case WEST:  dir = Direction.EAST; break;
    }
    return retVal;
  }
  
