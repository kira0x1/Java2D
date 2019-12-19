/**
 * Button. 
 * 
 * Click on one of the colored squares in the 
 * center of the image to change the color of 
 * the background. 
 */

class Button implements IUi {


  //How transparent the button is 
  int transparency = 200;


  //BG IMAGE
  String backgroundImagePath = "assets/brown-light.png";
  PImage bgImage;

  //BG HIGHLIGHTED IMAGE
  String bgHightltedPath = "assets/brown-dark.png";  
  PImage bgHighlitedImage;


  //ITEM ICON
  private PImage itemImage;
  private Item item;
  private boolean hasItem;
  private int iconPadding = 15;


  //BUTTON
  int rectX, rectY;      // Position of square button
  int rectSize = 90;     // Diameter of rect
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;

  public Button(int x, int y, int size) {

    //Load Images
    bgImage = new PImage();
    bgImage = loadImage(backgroundImagePath);

    //Load the highlight image
    bgHighlitedImage = new PImage();
    bgHighlitedImage = loadImage(bgHightltedPath);


    //Create a rect as a backup if theres no image
    rectColor = color(0);
    rectHighlight = color(51);
    baseColor = color(102);
    currentColor = baseColor;

    rectX = x;
    rectY = y;
    rectSize = size;
  }


  //Set the buttons Item
  public void SetItem(Item item) {
    this.item = item;
    itemImage = item.GetIcon();
    hasItem = true;
  }

  public void display() {
    update(mouseX, mouseY);


    tint(255, transparency);

    if (rectOver) {
      image(bgHighlitedImage, rectX, rectY, rectSize, rectSize);
    } else {
      image(bgImage, rectX, rectY, rectSize, rectSize);
    }

    if (hasItem) {
      int iconSize = rectSize - iconPadding;
      image(itemImage, rectX + rectSize/2 - iconSize/2, rectY + rectSize /2 - iconSize /2, iconSize, iconSize);
    }
  }

  //Check if mouse is hovering over button 
  public void update(int x, int y) {
    if ( overRect(rectX, rectY, rectSize, rectSize) ) {
      rectOver = true;
    } else {
      if(rectOver == true){
         toolTip.Hide();
      }
      rectOver = false;
    }
    
    
    if(rectOver && hasItem){
        toolTip.Show(item); 
    }
  }

  public void mousePressed() {
    if (rectOver) {
      currentColor = rectColor;
    }
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

  public boolean HasItem() {
    return hasItem;
  }
}
