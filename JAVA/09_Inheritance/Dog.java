/* Inheritance is completely same as C++, except JAVA use "extends" instead ":" */
public class Dog extends Animal {
  public void Sleep() {
    if(this.age == 1)
      System.out.println(this.age + " year old " + this.name + " zzz...");
    else
      System.out.println(this.age + " years old " + this.name + " zzz...");
  }
  public static void main(String[] args){
    Dog poppy = new Dog();
    poppy.setName("Happy");
    poppy.setAge(1);

    poppy.Sleep();
  }
}
