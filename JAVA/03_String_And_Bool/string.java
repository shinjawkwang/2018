public class string{
  public static void main(String[] argc){
    String a = "hello";
    String b = "Java Programming is Fun";
    String c = "hello";
    System.out.println(a.equals(b)); // false
    System.out.println(a.equals(c)); // true

    System.out.println(b.indexOf("Fun"));

    /* Executed Just At printing */
    System.out.println(b.replaceAll("Fun", "Fucking"));

    System.out.println(b.substring(20, 23));

    System.out.println(a.toUpperCase());
    System.out.println(a.toUpperCase().substring(0, 4));
  }
}
