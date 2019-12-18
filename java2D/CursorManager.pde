public class CursorManager implements IUi {

  private String filePath = "assets/FFcursor.gif";
  private PImage cursor;

  public CursorManager() {
    cursor = loadImage(filePath);
    ui.addUi(this);
  }


  public void display() {
    cursor(cursor);
  }
}
