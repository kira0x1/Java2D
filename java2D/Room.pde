class Room {
  ArrayList<Wall> walls = new ArrayList<Wall>();
  ArrayList<Doorway> doors = new ArrayList<Doorway>();
  ArrayList<Direction> doorwayDirections = new ArrayList<Direction>();
  ArrayList<Direction> wallDirections;
  
  
  Room(Direction entryPoint) {
    doorwayDirections.add(entryPoint);
    wallDirections = DirectionRemover(entryPoint);
    println(" room const wall di" + wallDirections);
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
  public ArrayList<Direction> getWallDirections() {
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
      doorwayDirections.add(input);
      wallDirections.remove(input);
    }
    else { print("tried to remove wall from a none valid direction"); }
  }
  
}
