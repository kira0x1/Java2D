class Stat {
  private String name;
  private int currentValue;
  private int baseValue = 10;
  private ArrayList<StatMod> mods = new ArrayList<StatMod>();
  private boolean isDirty = true;

  public Stat(String name, int baseValue) {
    this.name = name;
    this.baseValue = baseValue;
  }

  public String GetName() { 
    return name;
  }

  public int GetValue() {

    //If mods have been added recalculate the amount
    if (isDirty) {

      currentValue = baseValue;


      for (StatMod mod : mods) {   
        if (mod.isPercentage) {
          //Add the mod value as a percentage I.E ( 0.5 * currentValue )
          currentValue = currentValue + (currentValue * mod.amount);
        } else {
          //If its not a percentage just add it
          currentValue += mod.amount;
        }
      }

      //After recalculating set dirty to false
      isDirty = false;
    }

    return currentValue;
  }


  public void AddMod(StatMod mod) {
    mods.add(mod);
    isDirty = true;
  }
}

class StatMod {
  public int amount;
  public boolean isPercentage = false;
}
