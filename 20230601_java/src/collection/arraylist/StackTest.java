package collection.arraylist;


public class StackTest{
		public static void main(String[] args) {
			Mystack stack = new Mystack();
	stack.push("A");
	stack.push("B");
	stack.push("C");
	
	System.out.println(stack.pop());
	System.out.println(stack.pop());
	System.out.println(stack.pop());
 }
}