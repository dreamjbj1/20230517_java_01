package collection.arraylist;

import java.util.ArrayList;

class MyQueue {
 private ArrayList<String> arrayQueue = new ArrayList<String>();
 
 public void enQueue(String date) {
	 arrayQueue.add(date);
 }
 
 public String deQueue() {
	 int len = arrayQueue.size();
	 if(len == 0) {
		 System.out.println("큐가 비었습니다");
		 return null;
	 }
	 
	return(arrayQueue.remove(0));
 }
 
 
 
}
