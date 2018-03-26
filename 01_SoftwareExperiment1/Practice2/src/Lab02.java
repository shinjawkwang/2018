import java.util.Scanner;
class Book {
	/* True : returned */ 
	/* False : borrowed */
	public Boolean inLibrary;
	public String name;
	
	Book(String title, Boolean type){
		this.name = title;
		this.inLibrary = type;
	}
	public void Borrow() {
		this.inLibrary = false;
	}
	public void Return() {
		this.inLibrary = true;
	}
	public String getName() {
		return this.name;
	}
	public Boolean isInLibrary() {
		return this.inLibrary;
	}
}

class Library {
	Book book[] = new Book[4];
	Library(String titles) {
		String Book1 = titles.split(", ")[0];
		String Book2 = titles.split(", ")[1];
		String Book3 = titles.split(", ")[2];
		String Book4 = titles.split(", ")[3];

		book[0] = new Book(Book1, true);
		book[1] = new Book(Book2, true);
		book[2] = new Book(Book3, true);
		book[3] = new Book(Book4, true);
		
		
	}
	
	public Book Search(String search) {
		for(int i=0; i<4; i++) {
			if(book[i].name.equals(search)) {
				return book[i];
			}
		}
		System.out.println("There is no book.");
		return null;
	}
	
	public Boolean check(String title) {
		Book checker = Search(title);
		if(checker.isInLibrary()) {
			return true;
		}
		else {
			return false;
		}
	}
}

// 3 peoples are exist
// Sam
// Susan
// John

public class Lab02 {
	public static void Success(String people, Boolean type, String book) {	// arg1: People's name, arg2: (0,1) = (borrow, return)
		if(type) System.out.println(people + " succeeds to return " + book);
		else System.out.println(people + " succeeds to borrow " + book);
	}

	public static void Fail(String people, Boolean type, String book) {	// arg1: People's name, arg2: (0,1) = (borrow, return)
		if(type) System.out.println(people + " fails to return " + book);
		else System.out.println(people + " fails to borrow " + book);
	}
	
	public static void main(String args[]) {
		int order, pCode, bookNum;
		Library lib = new Library("Beauty and Beast, Helen Keller, Gulliver's Travels, The Three Little Pigs");
		String people[] = {"Sam", "Susan", "John"};
		while(true) {
			System.out.println("0. Exit");
			System.out.println("1. Print Library Status");
			System.out.println("2. Borrow Book");
			System.out.println("3. Return Book");
			System.out.print("Please choose number: ");
			Scanner inpt = new Scanner(System.in);
			order = inpt.nextInt();
			
			/* Exit */
			if(order == 0) {
				break;
			}
			
			/* Print Library Status */
			else if(order == 1) {
				System.out.println("\n");
				for(int i=0; i<4; i++) {
					if (lib.book[i].isInLibrary()) {
						System.out.println(lib.book[i].getName() + " is valid");
					}
					else {
						System.out.println(lib.book[i].getName() + " is invalid");
					}
				}
				System.out.print("\n");
			}
			
			/* Borrow Book */
			else if(order == 2) {
				System.out.println("\n\nWho are you? 1. Sam 2. Susan 3. John");
				Scanner pInpt = new Scanner(System.in);
				pCode = pInpt.nextInt() - 1;
				
				System.out.print("\n\nBooks: ");
				for(int i=0; i<4; i++) {
					System.out.print(i+1 + "." + lib.book[i].getName() + " ");
				}
				System.out.print("\n");
				Scanner bInpt = new Scanner(System.in);
				bookNum = bInpt.nextInt();
				if(lib.book[bookNum].isInLibrary()) {
					Success(people[pCode], false, lib.book[bookNum].getName());
					lib.book[bookNum].Borrow();
				}
				else {
					Fail(people[pCode], false, lib.book[bookNum].getName());
				}
				System.out.print("\n");
			}
			
			/* Return book */
			else if(order == 3) {
				System.out.println("\n\nWho are you? 1. Sam 2. Susan 3. John");
				Scanner pInpt = new Scanner(System.in);
				pCode = pInpt.nextInt() - 1;
				
				System.out.print("\n\nBooks: ");
				for(int i=0; i<4; i++) {
					System.out.print(i+1 + "." + lib.book[i].getName() + " ");
				}
				System.out.print("\n");
				Scanner bInpt = new Scanner(System.in);
				bookNum = bInpt.nextInt();
				if(!lib.book[bookNum].isInLibrary()) {
					Success(people[pCode], true, lib.book[bookNum].getName());
					lib.book[bookNum].Return();
				}
				else {
					Fail(people[pCode], true, lib.book[bookNum].getName());
				}
				System.out.print("\n");
			}
			else {
				System.out.println("Invalid option. Try again.\n");
			}
		}
	}
}
