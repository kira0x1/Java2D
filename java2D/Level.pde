class Level {
  ArrayList<Room> rooms = new ArrayList<Room>();
  Map map;
  Level(int roomAmount, int maxSize) {
    map = new Map(maxSize);
    //first room always starts at the south
    rooms.add(new Room(Direction.SOUTH));
    roomSpawner(roomAmount);
  }
  void roomSpawner(int possibleRooms) {
    
     for(int x = 0; x < possibleRooms; x++){
        rooms.add(new Room(Direction.SOUTH)); 
     }
    
    int chanceIncrease = 0;
    //while we still need rooms it will check everyone room for a place to put one and maybe spawn one
    while (possibleRooms > 0) {
      for (int i = 0; i < rooms.size(); ++i) {


        Room curRoom = rooms.get(i);
        Direction[] wallDirs = curRoom.wallDirections.toArray(new Direction[curRoom.wallDirections.size()]);

        chanceIncrease += 5;


        for (int j = 0; j < wallDirs.length; j++) {
          int chance = (int)random(101);
          
          Direction dir = wallDirs[j];

          if (chance+chanceIncrease > 75) {
            println(chance+chanceIncrease);
            curRoom.changeWallToDoor(dir);
            --possibleRooms;
          }
        }
      }
    }


    print(possibleRooms);
    //after setting all the directions for walls and doors add them to their arrays
    for (Room room : rooms) {
      room.wallDoorCreator();
    }
  }
  //just a temp testing function optamise and animate later
  void show() {
    for (Room room : rooms) {
      room.show();
    }
  }
}
