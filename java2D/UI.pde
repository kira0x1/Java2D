class UI {

  public ArrayList<IUi> uis = new ArrayList<IUi>();
  
  public AdminTools adminTools;
  
  private boolean debugPhys;
  
  public void setDebugPhys(boolean debugPhys){
      this.debugPhys = debugPhys;
  }
  
  
  public boolean isDebugPhysOn(){
    return debugPhys;
  }
 

  public void display() {
    for (IUi ui : uis) {
      ui.display();
    }
  }

  public void addUi(IUi ui) {
    uis.add(ui);
  }
}


interface IUi {
  public void display();
}
