package kh.lclass.oop.sample;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TestPolymorphism {
	public static void main(String[] args) {
		
		ArrayList<Car> carArrList   = new ArrayList<Car>(); 
		List<Car> carList           = new ArrayList<Car>(); //가장 흔하게 선언하는 방식
		List<Car> carList2           = new ArrayList<Car>(); //가장 흔하게 선언하는 방식
		Collection<Car> carCollection = new ArrayList<Car>();
		
		
		TestInterface kh = new Kh();
		Kh kh2 = new Kh();
		
		((Kh)kh).khSpecial();
		
		TestInterface bit1;
		TestInterface bit2;
		kh2.khSpecial();
		kh2.method1();
		
		Driver ej = new Driver();
		ej.setMoney(10000);
		ej.buy(new Avante());
		ej.buy(new Sonata());
	}
}
