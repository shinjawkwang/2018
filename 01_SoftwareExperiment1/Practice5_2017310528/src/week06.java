import java.util.Scanner;

public class week06 {
	public static void main(String args[]) {
		SimpleCalculator calc = new SimpleCalculator();
		int inpt1, inpt2, cmd;
		Scanner num1 = new Scanner(System.in);
		Scanner num2 = new Scanner(System.in);
		Scanner command = new Scanner(System.in);
		while(true) {
			System.out.println("0. Exit");
			System.out.println("1. Addition");
			System.out.println("2. Subtract");
			System.out.println("3. Print Result");
			System.out.println("4. Reset");
			
			cmd = command.nextInt();
			if(cmd == 0) {
				break;
			}
			else if(cmd==1) {
				System.out.println("Input value 1:");
				inpt1 = num1.nextInt();
				System.out.println("Input value 2:");
				inpt2 = num2.nextInt();
				try {
					calc.add(inpt1, inpt2);
				}
				catch(OutOfRangeException e) {
					System.out.println(e.getMessage());
				}
				catch(AddZeroException e) {
					System.out.println(e.getMessage());
				}
			}
			else if(cmd==2) {
				System.out.println("Input value 1:");
				inpt1 = num1.nextInt();
				System.out.println("Input value 2:");
				inpt2 = num2.nextInt();
				try {
					calc.sub(inpt1, inpt2);
				}
				catch(OutOfRangeException e) {
					System.out.println(e.getMessage());
				}
				catch(SubtractZeroException e) {
					System.out.println(e.getMessage());
				}
			}
			else if(cmd==3) {
				try {
					calc.print();
				}
				catch(OutOfRangeException e) {
					System.out.println(e.getMessage());
				}
			}
			else if(cmd==4) {
				calc.reset();
			}
		}
	}
}
