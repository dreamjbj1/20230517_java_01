package polymorphism;

 class Animal {
		public void move() {
			System.out.println("동물이 움직입니다.");
		}
	}
 


	class Human extends Animal{
		public void move() {
			System.out.println("사람이 두 발로 걷습니다.");
		}
	
	public void readBook() {
		System.out.println("사람이 책을 읽습니다.");
	}
}

	class Tiger extends Animal {
		public void move() {
			System.out.println("호랑이가 네 발로 뜁니다.");
		}
		public void hunting() {
			System.out.println("호랑이가 사냥을 합니다.");
		}
		
	}

	class Eagle extends	Animal {
		public Object flying;

		public void move() {
			System.out.println("독수리가 하늘로 납니다.");
		}
	
	public void flying() {
		System.out.println("독수리가 날개를 쭉 펴고 멀리 날아갑니다.");
	}
}


