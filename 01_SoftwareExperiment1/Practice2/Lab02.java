
class Book {
	
}

class Library {
	
}

// 3 peoples are exist
// Sam
// Susan
// John

public class Lab02 {
	public void Success(String people, Boolean type) {	// arg1: People's name, arg2: (0,1) = (borrow, return)
		if(type) System.out.println("Success " + people + "'s return");
		else System.out.println("Success " + people + "'s borrow");
	}

	public void Fail(String people, Boolean type) {	// arg1: People's name, arg2: (0,1) = (borrow, return)
		if(type) System.out.println("Fail " + people + "'s return");
		else System.out.println("Fail " + people + "'s borrow");
	}
	
	public static void main(String args[]) {
		Library lib = new Library("Beauty and Beast, Helen Keller, Gulliver's Travels, The Three Little Pigs");
		
	}
}
