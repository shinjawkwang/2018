import java.util.Scanner;

public class Converter {
	public static void main(String args[]) {
		
		/* Variables - one integer and 3 String for convert */
		int num;
		String Binary, Octal, Hexa;
		
		/* Keyboard input */
		Scanner inpt = new Scanner(System.in);
		System.out.print("Input decimal number: ");
		num = inpt.nextInt();
		
		/* Converting */
		Binary = Integer.toBinaryString(num);
		Octal = Integer.toOctalString(num);
		Hexa = Integer.toHexString(num);
		
		/* Print output */
		System.out.println("Binary number: " + Binary);
		System.out.println("Octal number: " + Octal);
		System.out.println("Hexadecimal number: " + Hexa);
	}
	
}
