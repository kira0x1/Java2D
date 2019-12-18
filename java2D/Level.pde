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
   while (possibleRooms > 0) {
     //randomly selects a room 
     int i = (int)random(rooms.size());
     //println("i = " + i);
     int possibleDoors = possibleRooms % 3;
     if (possibleDoors == 0) {
       possibleDoors = 3;
     }
     
     int arraySize = rooms.get(i).getWallDirections().size();
     int chance = 100;
     ArrayList<Direction> dirs = new ArrayList<Direction>();
     //will loop for each wall diection randomly selecting one to change into a door garanteeing one to spawn then lowering the chance
     for (int j = 0; j < arraySize; ++j) {
       if (possibleDoors > 0 && chance > (int)random(100)) {
         
         int randIndex = ((int)random(rooms.get(i).getWallDirections().size()));
         Direction selected = rooms.get(i).getWallDirections().get(randIndex);
         dirs.add(selected);
         //invert the direction to spawn door correctly in the next room
         rooms.add(new Room(dirInvert(selected)));
         chance -= 50;
         possibleRooms -= 1;
         //println(randIndex);
       } 
       
       
     }
     //println(dirs);
     //println(rooms.get(i).getWallDirections());
     //changes selected walls into doors
     for (Direction dir: dirs) {
       rooms.get(i).changeWallToDoor(dir);
     }
     //overriding current room to end of list for removal
     rooms.set(i, rooms.get(rooms.size()-1));
     rooms.remove(rooms.size()-1);
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
