class Inventory {
  private ArrayList<Item> items = new ArrayList<Item>();

  //If the player has their inventory open. Use this to know when to draw the ui on the screen
  public boolean isOpen;

  public Inventory() {
    items = new ArrayList<Item>();
  }

  public ArrayList<Item> GetItems() {
    return items;
  }

  public void AddItem(Item item) {
    items.add(item);
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
  public String toString(){
    if(items.size() == 0){
       return "Empty Inventory";
    }
    
    String result = "";
    
     int count = 1;
     for(Item item: items){
        
       result += count +": " + item.name + "\n";      
       count ++;
     }
    
   return result; 
  }
}
