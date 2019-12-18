public static class Items {
  public static Item healthPot;

  public static void init() {
    healthPot = app.new Item("health potion", "", app. new Stats(), "assets/items/potions/healthPot.png");
  }
}
