/* Should Import ArrayList (Like Python) to Use ArrayList in java. */
import java.util.ArrayList;

public class list{
  public static void main(String[] args){
    /* Should use <Integer> instead <int> in C++ */
    ArrayList <Integer> pitches = new ArrayList <Integer>();
    /* add is overloaded. */
    pitches.add(167);
    pitches.add(0, 148);
    /* prints "[148, 167]". Look []! */
    System.out.println(pitches);
    for(int i=0;i<pitches.size();i++){ // size() function used
      /* pitches.get(i) == arr[i] in Array && Auto newline in each println - How can I print in one line? : use + ! */
      System.out.println(pitches.get(i));
    }
    /* Print boolean if ArrayList contain"s" an item */
    System.out.println(pitches.contains(148));
    /* remove is overloaded - value or index : value returns boolean if we succeed deletion or not */
    /* In Integer ArrayList, "index" has bigger priority, so to remove object, write code like this. */
    System.out.println(pitches.remove(new Integer(148)));
    /* index returns the deleted value */
    System.out.println(pitches.remove(0));

    System.out.println(pitches.size());
  }
}
