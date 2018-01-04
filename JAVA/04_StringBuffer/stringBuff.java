public class stringBuff{
  public static void main(String[] args){
    /* StringBuffer is a buffer Stores String */
    StringBuffer sb = new StringBuffer();
    sb.append("JAVA");
    sb.append(" ");
    sb.append("Programming");
    /* To Print string buffer, you need to transform it into String */
    System.out.println(sb.toString());
  }
}
