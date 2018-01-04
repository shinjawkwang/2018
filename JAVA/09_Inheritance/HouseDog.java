/* in JAVA, class cannot extend over 1 class! */
public class HouseDog extends Dog {
  /* Overided Sleep Method. Also same with C++ */
  public void Sleep() {
    if(this.age == 1)
      System.out.println(this.age + " year old " + this.name + " zzz in house ...");
    else
      System.out.println(this.age + " years old " + this.name + " zzz in house ...");
  }
  /* Overloading method - same with C++ . . . */
  public void Sleep(int hour){
    if(hour < 24) // Honey Jam
      System.out.println(this.age + " years old " + this.name + " zzz in house for " + hour + " hours . . .");
    else{ // Nuclear Honey Jam
      System.out.println(this.age + " years old " + this.name + " zzz in house for " + hour + " hours . . .");
      System.out.println("... Wait, this is serious!!");
    }
  }
  public static void main(String[] args){
    HouseDog dog = new HouseDog();
    dog.setName("GabSun");
    dog.setAge(3);
    dog.Sleep();
    dog.Sleep(24);
  }
}
