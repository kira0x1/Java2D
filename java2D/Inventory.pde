class Inventory implements IUi {

  public int bagSize = 10;

  private ArrayList<Item> items = new ArrayList<Item>();

  //If the player has their inventory open. Use this to know when to draw the ui on the screen
  public boolean isOpen;

  private ArrayList<Button> buttons = new ArrayList<Button>();

  private BoxUI bgBox;

  public Inventory() {
    items = new ArrayList<Item>();

    int offset = - 8;
    int startX = width - 120;
    int startY = height - 120;
    int buttonSize = 50;

    bgBox = new BoxUI(startX-92, startY-100, 330, 350, true);

    for (int y = 0; y < bagSize / 2; y ++) {
      for (int x = 0; x < bagSize / 2; x++) {
        Button btn = new Button(((x * offset) + startX- (x * buttonSize)), (y * offset) + startY - (y*buttonSize) - offset, buttonSize); 
        buttons.add(btn);
      }
    }

    ui.addUi(this);
  }

  public ArrayList<Item> GetItems() {
    return items;
  }

  public void AddItem(Item item) {
    items.add(item);
  }

  public void keyPressed() {
    if (key == 'b') {
      ToggleInventory();
    }
  }

  public void ToggleInventory() {
    isOpen = !isOpen;
  }

  //Close inventory ui and do sound effect etc
  public void CloseInventory() {
    isOpen = false;
  }

  //Open Inventory UI and do sound effects etc
  public void OpenInventory() {
    isOpen = true;
  }

  @Override
    public String toString() {
    if (items.size() == 0) {
      return "Empty Inventory";
    }

    String result = "Inventory\n";

    int count = 1;
    for (Item item : items) {

      result += count +": " + item.name + "\n";      
      count ++;
    }

    return result;
  }

  public void display() {
    if (isOpen) {
      bgBox.display();
      for (Button btn : buttons) {
        btn.display();
      }
    }
  }
}
