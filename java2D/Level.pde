class Level {
  ArrayList<Room> rooms = new ArrayList<Room>();
  
  Level(int roomAmount) {
    
  }
  void recurRoomSpawner(Room loc,int possibleRooms) {
    ArrayList<Direction> test = loc.getDirection();
    for(Direction door: test) {
      rooms.add(new Room(possibleRooms,door));
      //recurRoomSpawner()
    }
  }
  
}
