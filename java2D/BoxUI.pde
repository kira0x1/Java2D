public class BoxUI implements IUi {

  int x, y, w, h;

  float transparency = 220;

  String filePath = "assets/box.png";
  PImage boxImage;

  boolean isRect = true;

  int shadeColor = 150;
  color rectColor = color(shadeColor, shadeColor, shadeColor, transparency);

  public BoxUI(int x, int y, int w, int h, boolean isRect) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.isRect = isRect;

    boxImage = loadImage(filePath);
  }

  public BoxUI(int x, int y, int w, int h, String filePath) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.filePath = filePath;
    boxImage = loadImage(filePath);

    isRect = false;
  }

  public void SetTransparency(float t) {
    transparency = t;
  }


  public void display() {


    if (isRect) {
      fill(rectColor);
      rect(x, y, w, h);
    } else {
      tint(255, transparency);
      image(boxImage, x, y, w, h);
    }
  }
}
