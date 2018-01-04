import java.util.HashMap;
/* There are more map, LinkedHashMap && TreeMap */
/* LinkedHashMap - print like queue FIFO */
/* TreeMap - Sort keys and print */

public class map {
  public static void main(String[] args){
    /* Map is like dictionary. in < >, first is key, second is value. */
    HashMap <Integer, String> map = new HashMap <Integer, String>();
    map.put(0, "NULL");
    map.put(1, "NELL");

    System.out.println(map.get(0)); // As same with ArrayList.

    System.out.println(map.containsValue("NELL"));
    System.out.println(map.containsKey(1));

    /* Is remove overloaded?? Is it is as same with ArrayList, it will print NULLtrue. - But it prints NULLnull! */
    /* => remove is overloaded, but it works when used by map.values().remove(valueToRemove) */
    System.out.println(map.remove(0) + " " + map.values().remove("NELL"));
    System.out.println(map.size());
  }
}
