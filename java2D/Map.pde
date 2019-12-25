class Map {
	boolean[][] map;

	Map(int maxSize) {
    //maxSize should be kept odd to have a 1 block center
    map = new boolean[maxSize][maxSize];
}
boolean[][] getMap() {
	return map;
	}
}
