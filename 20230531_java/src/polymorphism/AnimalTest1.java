package polymorphism;

public class AnimalTest1 {
	public static void main (String[] args) {
				AnimalTest1 aTest = new AnimalTest1();
				aTest.moveAnimal(new Human());
				aTest.moveAnimal(new Tiger());
				aTest.moveAnimal(new Eagle());
			}
			
		public void moveAnimal(Animal animal) {
			animal.move();
				
			}
	}


