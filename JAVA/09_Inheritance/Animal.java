class yearPasser{
  public void yearPass(Animal animal){
    animal.age ++;
  }
}

public class Animal{
  String name;
  int age;
  /* We call this "Function" in other languages. But in JAVA, It is on the another hand. */
  /* Because, Every function in JAVA should be in class. */
  /* So, we call function in class "method" */
  public void setName(String name){
    /* Use "this" when you want to use same name. */
    /* I already suffered this in C++! */
    this.name = name;
  }
  public void setAge(int age){
    this.age = age;
  }

  /* This is "main method" */
  public static void main(String[] args){
    /* Automately Initialize values by NULL */
    Animal cat = new Animal();
    /* Print "null" */
    System.out.println(cat.name + "'s age is " + cat.age + "\n");

    cat.setName("Nyang Cat");
    cat.setAge(9);
    System.out.println(cat.name + "'s age is " + cat.age);

    System.out.println("A year passed and . . .");
    yearPasser oneYear = new yearPasser();
    oneYear.yearPass(cat);
    System.out.println(cat.name + "'s age is " + cat.age);
  }
}
