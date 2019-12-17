class Room {
  ArrayList<Wall> walls = new ArrayList<Wall>();
  ArrayList<Doorway> doors = new ArrayList<Doorway>();
  ArrayList<Direction> doorwayDirections = new ArrayList<Direction>();
  
  Room(int possibleDoors,Direction entryPoint) {
    doorwayDirections.add(entryPoint);
    
    for (Direction dir: DirectionRemover(entryPoint)) {
      int chance = (int)random(101);
      if (chance < 33 && possibleDoors != 0) {
        possibleDoors -= 1;
        doorwayDirections.add(dir);
      }
    }
    for (Direction dir: DirectionRemover(doorwayDirections)) {
      walls.add(new Wall(dir));
    }
    for (Direction passage: doorwayDirections) {
      doors.add(new Doorway(passage));
    }
  }
  public void show() {
    for (Doorway door: doors) {
      door.show();
    }
    for(Wall wall: walls) {
      wall.show();
    }
  }
  
  
  
}
