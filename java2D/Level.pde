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

    //while we still need rooms it will check everyone room for a place to put one and maybe spawn one
    for (Room room : rooms) {
      room.randomizeWallDirections(possibleRooms);
    }

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
