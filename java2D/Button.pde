/**
 * Button. 
 * 
 * Click on one of the colored squares in the 
 * center of the image to change the color of 
 * the background. 
 */

class Button implements IUi {
  
  String backgroundImagePath = "assets/button.png";
  PImage bgImage;

  int rectX, rectY;      // Position of square button
  int rectSize = 90;     // Diameter of rect
  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  boolean rectOver = false;

  public Button(int x, int y, int size) {
    
    bgImage = new PImage();
    bgImage = loadImage(backgroundImagePath);
    
    rectColor = color(0);
    rectHighlight = color(51);
    baseColor = color(102);
    currentColor = baseColor;

    rectX = x;
    rectY = y;
    rectSize = size;
  }

  public void display() {
    update(mouseX, mouseY);
 
     

    if (rectOver) {
      fill(rectHighlight);
    } else {
      fill(rectColor);
    }
    
    
    //stroke(255);
    //rect(rectX, rectY, rectSize, rectSize);
    
    
    image(bgImage, rectX, rectY, rectSize, rectSize);
  }

  public void update(int x, int y) {
    if ( overRect(rectX, rectY, rectSize, rectSize) ) {
      rectOver = true;
    } else {
      rectOver = false;
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

  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
}
