package kh.lclass.oop.collection;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import java.util.function.UnaryOperator;

import kh.lclass.oop.sample.Car;

public class TestCollection {
	
	public <E extends Number , J> String testGeneric(E a, J b) {
		System.out.println(a.getClass().getName());
		System.out.println(b.getClass().getName());
		return a.toString() + "결과값" + b.toString();
	}
	
	public void testStack() {
		Stack<String> strStack = new Stack<String>();
		strStack.push("안녕");
		strStack.add("하");
		strStack.push("세요");
		System.out.println(strStack.get(1));
		System.out.println(strStack);
		System.out.println(strStack.peek());
		System.out.println(strStack);
		System.out.println(strStack.pop());
		System.out.println(strStack);
	}
	public void testHashMap() {
		Map<String, Object> objMap = new HashMap<String, Object>();
		objMap.put("ej", 35.0);
		objMap.put("jy", "지영이네");
		objMap.put("hj", new Car(5000));
		System.out.println(objMap);
		System.out.println("jy" + ":" + objMap.get("jy"));
		Set<String> keyset = objMap.keySet();

		System.out.println(keyset);
		System.out.println("======= Map: enhanced for ==============");
		for (String item : keyset) {
			Object value = objMap.get(item);
			System.out.println(item + " : " + value);

		}
		System.out.println("=======  Map: Iterato for ====================");
		Iterator<String> itr = keyset.iterator();
		while (itr.hasNext()) {
			String item = itr.next();
			Object value = objMap.get(item);
			System.out.println(item + " : " + value);

		}
	}

	public void testHashset() {
		Set<Integer> integerSet = new HashSet<Integer>();
		integerSet.add(11);
		integerSet.add(22);
		integerSet.add(33);
		integerSet.add(11);
		System.out.println(integerSet);
		System.out.println("====== enhance for ======");
		for (Integer item : integerSet) {
			System.out.println(item);
		}
		System.out.println("=== Set : Iterator 사용 ====");
		Iterator<Integer> itr = integerSet.iterator();
		while (itr.hasNext()) {
			Integer item = itr.next();
			System.out.println(item);
		}
		System.out.println(itr);
	}

	public void testArrayList() {
		String[] strArr1 = new String[3];
		strArr1[0] = "바나나";
		strArr1[1] = "딸기";
//		strArr1[3] = "수박";
		strArr1.clone();
// 오류닌디		System.out.println(strArr1[3]);

		/*
		 * 
		 * public class ArrayList implements List{ public boolean add(Object e) { // }
		 * public boolean add(String e){ // } public boolean add(Integer e) { // }
		 * public boolean add(Double e) { // } public boolean add(Car e) { // } }
		 * 
		 */

		ArrayList<Integer> list2 = new ArrayList<Integer>();
		ArrayList<Car> list3 = new ArrayList<Car>();
		list3.add(new Car(3000));
		list2.add(25);
		list2.add(26);
		list2.add(27);
		list2.add(55);

		// list2.add(10,56); //끼워넣기 insert index 현재 크기 size() 보다 클 수 없음.
		System.out.println(list2.get(2));
		System.out.println(list2.get(3));

		// List - for
		for (int i = 0; i < list2.size(); i++) {
			Integer item = list2.get(i);
			System.out.println(item);
		}
		System.out.println("====== 배열 - for ========");
		// 배열 - for
		for (int i = 0; i < strArr1.length; i++) {
			String item = strArr1[i];
			System.out.println(item);
		}
		System.out.println("===== enhanced for ======");

		// enhanced-for
		for (Integer item : list2) {
			System.out.println(item);
		}
		for (String item : strArr1) {
			System.out.println(item);
		}

		ArrayList<String> list = new ArrayList<String>();
		if (list.add("7번")) {
			System.out.println("list에 추가 성공했습니다.");
		}

		list.add("1번");
		list.add("2번");
		list.add("3번");
		list.add(1, "2번대신끼워넣기");
//		list.remove("2번");
		Collection<String> collection1 = new ArrayList<String>();
		collection1.add("2번");
//		collection1.add("3번");
		list.removeAll(collection1);

		if (list instanceof ArrayList) {
			ArrayList<String> copyList = (ArrayList<String>) list.clone();
			System.out.println(copyList);
		}

//		list.remove(0);
//		list.clear();
		System.out.println(list);

	}

}
