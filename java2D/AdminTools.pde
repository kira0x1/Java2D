//This class is here to help you with testing, debuging


public class AdminTools implements IUi {

  private boolean showPlayerStats;
  private PlayerStatsDisplay playerStatsDisplay = new PlayerStatsDisplay();
  private Player player;

  public AdminTools(Player player) {
    this.player = player;
    ui.addUi(this);
  }


  public void keyReleased() {
    if (key == 'c') {
      showPlayerStats = !showPlayerStats;
    }
  }

  public void display() {
    if (showPlayerStats) {
      playerStatsDisplay.display();
    }
  }
}

public class PlayerStatsDisplay implements IUi {
  
  private float x = 180;
  private float y = 180;
  private float w = 300;
  private float h = 300;
  
  private float transparency = 200;
  public color windowColor = color(40, 40, 40, transparency);


  public PlayerStatsDisplay() {
  }

  public PlayerStatsDisplay(float x, float y, float h, float w) {
    this.x = x;
    this.y = y;
    this.h = h;
    this.w = w;
  }

  public void display() {
    fill(windowColor);
    rect(x, y, h, w);
    
    fill(250);
    
    textAlign(CENTER);
    text("Stats", x , y - h/2 + 30);
    
    text("Health: " + player.stats.GetHealth(), x, y- h/2 + 80);
    text("Speed: " + player.stats.GetSpeed(), x, y- h/2 + 120);
  }
}
