class UI {

  public ArrayList<IUi> uis = new ArrayList<IUi>();

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
