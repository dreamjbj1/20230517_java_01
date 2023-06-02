package kh.lclass.oop.sample;

public class Person {
	private String name;
	private int age;
	private char gender; //'남' , '여'
	
	// 기본생성자
	public Person() {}

	// allArgumentsConstructor 만들어주세요. >>생성자를 하나 더 만들어달라
	// allArgumentsConstructor 란 모든 매개인자를 받아서 처리하는 생성자
	// overloading 오로 생성자
	public Person(String name, int age, char gender){
		this.name = name;
		this.age = age;
		this.gender = gender;
	
	}
	
	
	
	
	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", gender=" + gender + "]";
	}

	// getter / setter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		// 만나이계산법
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
}