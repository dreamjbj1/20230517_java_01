package kh.lclass.hello;

import kh.lclass.bank.BankAccount;

public class HelloWorld {
	
	public static void main(String[] args) {
		// JVM이 main 메소드를 호출해줌.
		
		BankAccount ejkim = new BankAccount();
 		ejkim.accountNo = 1111;
		ejkim.setName("이제이");
		ejkim.setBalance(5000);
		
		// 시간이 흘러서..
		String currentBalance = ejkim.deposit("역삼우리은행ATM3", 5000);
		System.out.println("잔액" + currentBalance + "입니다");
	}	
		
	
}


