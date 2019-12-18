public class Item {
  public  String name;
  private String description;
  private Stats stats;
  private PImage icon;

  public Item(String name, String description, Stats stats, String iconPath) {
    this.name = name;
    this.description = description;
    this.stats = stats;
    
    
    this.icon = loadImage(iconPath);
  }

  public Item(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }

  public String GetDescription() {
    return description;
  }

  public Stats GetStats() {
    return stats;
  }

  public PImage GetIcon() {
    return icon;
  }
}
