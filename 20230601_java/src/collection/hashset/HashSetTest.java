package collection.hashset;

import java.util.HashSet;

public class HashSetTest {

	public static void main(String[] args) {
	HashSet<String> hashSet = new HashSet<String>();
	hashSet.add(new String("오대성"));
	hashSet.add(new String("송용태"));
	hashSet.add(new String("박성수"));
	hashSet.add(new String("정영근"));
	hashSet.add(new String("정영근"));
	
	System.out.println(hashSet);
	

	}

}
