class Level {
  ArrayList<Room> rooms = new ArrayList<Room>();
  Map map;
  Level(int roomAmount,int maxSize) {
    map = new Map(maxSize);
    //first room always starts at the south
    rooms.add(new Room(Direction.SOUTH));
    roomSpawner(rooms.get(0), roomAmount);
  }
  void roomSpawner(int possibleRooms) {
    int chanceIncrease = 0;
    //while we still need rooms it will check everyone room for a place to put one and maybe spawn one
    while (possibleRooms != 0) {
      print(possibleRooms);
      for (int i = 0; i < rooms.size(); ++i) {
        
        
        //Room curRoom = rooms.get(i);
        //Direction[] wallDirs = curRoom.wallDirections.toArray(new Direction[curRoom.wallDirections.size()]);
        ArrayList<Direction> checkDir = rooms.get(i).getWallDirection().copy();
        //chanceIncrease += 5;
        
        for (Direction dir: checkDir) {
          int chance = (int)random(101);
          //need to add the valid spot check here (map stuff)
          if (chance+chanceIncrease > 75) {       
            rooms.get(i).changeWallToDoor(dir);
            //inverse direction wanted 
            rooms.add(new Room(dir));
            --possibleRooms; 
          }
        }
      }
    }
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
