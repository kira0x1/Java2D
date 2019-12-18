// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame = 1;
  int curTick = 1;
  
  int animSpeed = 6;

  Animation(String imagePrefix, String fileExtension, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i+1, 1) + "." + fileExtension;
      images[i] = loadImage(filename);

      //System.out.println("Loaded: " + filename);
      frame = (frame+1) % imageCount;
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }

  int getWidth() {
    return images[0].width;
  }
  public PImage GetImage() {
    curTick ++;

    if (curTick >= animSpeed) {
      frame = (frame+1) % imageCount;
      curTick = 0;
    }

    return images[frame];
  }
}
