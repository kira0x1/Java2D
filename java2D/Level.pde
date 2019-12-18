class Level {
  ArrayList<Room> rooms = new ArrayList<Room>();
  Map map;
  Level(int roomAmount,int maxSize) {
    map = new Map(maxSize);
    //first room always starts at the south
    rooms.add(new Room(Direction.SOUTH));
    roomSpawner(roomAmount);
  }
  void roomSpawner(int possibleRooms) {
    int chanceIncrease = 0;
    //while we still need rooms it will check everyone room for a place to put one and maybe spawn one
    while (possibleRooms > 1) {
      for (int i = 0; i < rooms.size(); ++i) {
        
        
        Room curRoom = rooms.get(i);
        Direction[] wallDirs = curRoom.wallDirections.toArray(new Direction[curRoom.wallDirections.size()]);
        
        chanceIncrease += 5;
        
        for (Direction dir: wallDirs) {
          int chance = (int)random(101);
          //need to add the valid spot check here (map stuff)
          if (chance+chanceIncrease > 75) {
            curRoom.changeWallToDoor(dir);
            --possibleRooms; 
          }
        }
      }
    }
    print(possibleRooms);
    //after setting all the directions for walls and doors add them to their arrays
    for (Room room: rooms) {
      room.wallDoorCreator();
    }
  }
  //just a temp testing function optamise and animate later
  void show() {
    for (Room room: rooms) {
      room.show();
    }
  }
}
