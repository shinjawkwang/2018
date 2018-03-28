
class Animal {
	String name;
	float weight;
	
	/* name methods */
	public String getName() {
		return this.name;
	}
	public void setName(String inpt) {
		this.name = inpt;
	}
	
	/* weight methods */
	public float getWeight() {
		return this.weight;
	}
	public void setWeight(float inpt) {
		this.weight = inpt;
	}
	
	/* breed */
	/* I will override */
	public void breed() {
		
	}

}

abstract class Mammal extends Animal {
	static int numMammal;
	public int getNumMammals() {
		return numMammal;
	}
}

abstract class Reptile extends Animal {
	static int numReptile;
	public int getNumReptile() {
		return numReptile;
	}
}

final class Cat extends Mammal {
	String nameSlave;
	
	/* Constructor */
	Cat(){
		
	}
	Cat(String inpt){
		this.name = inpt;
		this.weight = 0;
		numMammal ++;
	}
	Cat(String inpt1, float inpt2){
		this.name = inpt1;
		this.weight = inpt2;
		numMammal ++;
	}
	Cat(String name, float weight, String slave){
		this.name = name;
		this.weight = weight;
		this.nameSlave = slave;
		numMammal ++;
	}
	
	/* slave method */
	public String getNameSlave() {
		return this.nameSlave;
	}
	public void setNameSlave(String inpt) {
		this.nameSlave = inpt;
	}
	
	/* motion method */
	public void meow() {
		System.out.println("(" + this.name + ") : Meow");
	}
	public void sleep() {
		System.out.println("(" + this.name + ") : Zzz");
	}
	public void breed() {
		numMammal += 3;
	}
}

final class Dog extends Mammal {
	String nameMaster;
	
	/* Constructor */
	Dog(){
		
	}
	Dog(String inpt){
		this.name = inpt;
		this.weight = 0;
	}
	Dog(String inpt1, float inpt2){
		this.name = inpt1;
		this.weight = inpt2;
	}
	Dog(String name, float weight, String master){
		this.name = name;
		this.weight = weight;
		this.nameMaster = master;
		numMammal ++;
	}
	
	/* master method */
	public String getNameMaster() {
		return this.nameMaster;
	}
	public void setNameMaster(String inpt) {
		this.nameMaster = inpt;
	}
	
	/* motion method */
	public void bark() {
		System.out.println("(" + this.name + ") : bowwow");
	}
	public void breed() {
		numMammal += 5;
	}

}

final class Crocodile extends Reptile {
	/* Constructor */
	Crocodile(){
		
	}
	Crocodile(String inpt){
		this.name = inpt;
		this.weight = 0;
		numReptile ++;
	}
	Crocodile(String inpt1, float inpt2){
		this.name = inpt1;
		this.weight = inpt2;
		numReptile ++;
	}
	public void spawn() {
		numReptile += 20;
	}
}

public class week04 {
	static void printAnimal(Cat cat1, Cat cat2, Dog dog1, Dog dog2, Crocodile ccd1, Crocodile ccd2) {
		System.out.println("Cat1 name: " + cat1.getName() + ", weight: " + cat1.getWeight() + ", slave name: " + cat1.getNameSlave());
		System.out.println("Cat2 name: " + cat2.getName() + ", weight: " + cat2.getWeight() + ", slave name: " + cat2.getNameSlave());
		System.out.println("Dog1 name: " + dog1.getName() + ", weight: " + dog1.getWeight() + ", slave name: " + dog1.getNameMaster());
		System.out.println("Dog2 name: " + dog2.getName() + ", weight: " + dog2.getWeight() + ", slave name: " + dog2.getNameMaster());
		System.out.println("Crocodile1 name: " + ccd1.getName() + ", weight: " + ccd1.getWeight());
		System.out.println("Crocodile2 name: " + ccd2.getName() + ", weight: " + ccd2.getWeight());
		
		System.out.println("Mammal number: " + Mammal.numMammal);
		System.out.println("Reptile number: " + Reptile.numReptile);
		System.out.println(" ");
	}
	public static void main(String args[]) {
		Cat cat1 = new Cat("CatA", 3.3f, "SlaveA");
		Cat cat2 = new Cat("CatB", 3.7f, "SlaveB");
		Dog dog1 = new Dog("DogA", 5.2f, "MasterA");
		Dog dog2 = new Dog("DogB", 5.9f, "MasterB");
		Crocodile ccd1 = new Crocodile("CrocoA", 23.7f);
		Crocodile ccd2 = new Crocodile("CrocoB", 26.9f);
		
		printAnimal(cat1, cat2, dog1, dog2, ccd1, ccd2);
		
		cat1.meow();
		cat1.sleep();
		cat1.breed();
		cat2.meow();
		cat2.sleep();
		cat2.breed();
		
		cat1.setName("CatC");
		cat1.setWeight(4.1f);
		cat1.setNameSlave("SlaveC");
		System.out.println("(New setting to cat1) name: CatC, weight: 4.1, nameSlave: SlaveC");
		
		printAnimal(cat1, cat2, dog1, dog2, ccd1, ccd2);
		
		dog1.bark();
		dog1.breed();
		dog2.bark();
		dog2.breed();

		dog1.setName("DogC");
		dog1.setWeight(7.4f);
		dog1.setNameMaster("MasterC");
		System.out.println("(New setting to dog1) name: DogC, weight: 7.4, nameMaster: MasterC");
		
		printAnimal(cat1, cat2, dog1, dog2, ccd1, ccd2);
		
		ccd1.spawn();
		ccd1.setName("CrocoC");
		ccd1.setWeight(29.2f);
		System.out.println("(New setting to croco1) name: CrocoC, weight: 29.2");
		
		printAnimal(cat1, cat2, dog1, dog2, ccd1, ccd2);
	}
}
