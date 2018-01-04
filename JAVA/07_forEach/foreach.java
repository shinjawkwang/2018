import java.util.ArrayList;
/* Don't Forget to import ArrayList!!! */

public class foreach{
  public static void main(String[] args){
    ArrayList <Integer> arr = new ArrayList <Integer>();
    arr.add(100);
    arr.add(90);
    arr.add(12);
    /* Normal for - as same as C, C++ */
    for(int i=0; i<arr.size(); i++){
      System.out.println(arr.get(i));
    }
    /* forEach Phrase - like python */
    for(int array : arr){
      System.out.println(array);
    }
  }
}
