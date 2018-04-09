import java.util.ArrayList;
import HashArray.HashArray;

public class week05 {
	public static void main(String args[]) {
		HashArray<String, String> hasharray = new HashArray<String, String>();
		
		hasharray.addition("A", "Adam");
		hasharray.addition("A", "Adam");
		hasharray.addition("A", "Adam");
		hasharray.addition("A", "Adam");
		
		hasharray.addition("B", "Bicycle");
		hasharray.addition("B", "Bicycle");
		hasharray.addition("B", "Bottle");
		hasharray.addition("B", "Bottle");
		
		hasharray.addition("C", "Cabinet");
		hasharray.addition("C", "Chicken");
		hasharray.addition("C", "Chicken");
		hasharray.addition("C", "Client");
		
		hasharray.addition("D", "Data");
		hasharray.addition("D", "Dairy");
		hasharray.addition("D", "Debug");
		hasharray.addition("D", "Dangle");
		
		System.out.println("A count: " + hasharray.getCount("A"));
		System.out.println("B count: " + hasharray.getCount("B"));
		System.out.println("C count: " + hasharray.getCount("C"));
		System.out.println("D count: " + hasharray.getCount("D"));
		
		System.out.println(" ");
		
		ArrayList<String> tempA = hasharray.getArray("A");
		ArrayList<String> tempB = hasharray.getArray("B");
		ArrayList<String> tempC = hasharray.getArray("C");
		ArrayList<String> tempD = hasharray.getArray("D");
		
		for(int i=0; i < 1; i++) {System.out.println(tempA.get(i));}
		for(int i=0; i < 2; i++) {System.out.println(tempB.get(i));}
		for(int i=0; i < 3; i++) {System.out.println(tempC.get(i));}
		for(int i=0; i < 4; i++) {System.out.println(tempD.get(i));}
		
		System.out.println(" ");
		
		if(hasharray.search("C", "Debug")) {System.out.println("Debug exists");}
		else {System.out.println("Debug does not exist");}
		
		if(hasharray.search("D", "Debug")) {System.out.println("Debug exists");}
		else {System.out.println("Debug does not exist");}
	
		System.out.println(" ");
		
		hasharray.delete("A", "Adam");
		hasharray.delete("A", "Adam");
		hasharray.delete("A", "Adam");
		hasharray.delete("A", "Adam");
		
		hasharray.delete("B", "Bicycle");
		hasharray.delete("B", "Bicycle");
		hasharray.delete("B", "Bottle");
		hasharray.delete("B", "Bottle");
		
		hasharray.delete("C", "Cabinet");
		hasharray.delete("C", "Chicken");
		hasharray.delete("C", "Chicken");
		hasharray.delete("C", "Client");
		
		hasharray.delete("D", "Data");
		hasharray.delete("D", "Dairy");
		hasharray.delete("D", "Debug");
		hasharray.delete("D", "Dangle");
		
		System.out.println("A count: " + hasharray.getCount("A"));
		System.out.println("B count: " + hasharray.getCount("B"));
		System.out.println("C count: " + hasharray.getCount("C"));
		System.out.println("D count: " + hasharray.getCount("D"));
	}
}
