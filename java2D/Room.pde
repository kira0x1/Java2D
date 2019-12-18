class Room {
  ArrayList<Wall> walls = new ArrayList<Wall>();
  ArrayList<Doorway> doors = new ArrayList<Doorway>();
  ArrayList<Direction> doorwayDirections = new ArrayList<Direction>();
  ArrayList<Direction> wallDirections;
  
  
  Room(int possibleDoors,Direction entryPoint) {
    doorwayDirections.add(entryPoint);
    wallDirections = DirectionRemover(entryPoint);
  }
  
  public void show() {
    for (Doorway door: doors) {
      door.show();
    }
    for(Wall wall: walls) {
      wall.show();
    }
  }
  
  public ArrayList<Direction> getDoorDirection() {
    return doorwayDirections;
  }
  public ArrayList<Direction> getWallDirection() {
    return wallDirections;
  }
  //every room only starts with one door the one it entered through
  public void wallDoorCreator() {
    
    for (Direction dir: wallDirections) {
      walls.add(new Wall(dir));
    }
    for (Direction passage: doorwayDirections) {
      doors.add(new Doorway(passage));
    }
  }
  public void changeWallToDoor(Direction input) {
    if (wallDirections.contains(input)) {
      wallDirections.remove(input);
      doorwayDirections.add(input);
      
    }
    else { print("tried to remove wall from a none valid direction"); }
  }
  
}
