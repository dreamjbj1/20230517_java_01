package kh.lclass.bank;

import java.util.Scanner;

public class Member {
	
	public static void main(String[] args) {
		// 스캐너 마련
		Scanner sc = new Scanner(System.in);
		
		System.out.println("통장계설을 원하십니다?");
		String answer = sc.nextLine();
		if(answer.equals("네")) {  //(answer=="네") 문자 == 비교할 수 없음.
			System.out.println("주민번호 확인:");
//			int strNo = sc.nextInt(); sc.nextLine();
			String strNo = sc.nextLine();
			int sno = Integer.parseInt(strNo);
			
			System.out.println("이름 확인:");
			String strName = sc.nextLine();
			BankAccount ej = new BankAccount(sno, strName);
			BankAccount hj = new BankAccount(123123, "종호", 101231212);
			
			BankAccount jh = new BankAccount();
			System.out.println(jh.getSno()); // 0
			System.out.println(jh.getName()); // null
			System.out.println(jh.getBalance()); // 0 --> 5000000
			System.out.println(jh.getAccountName()); // 내일배움
			jh.sumArgs(2,5,3);
			
			
			jh.sum(1, 3);
			jh.sum("11", 22);
			jh.sum(1, 3,3);
			
			
		
			
			// String 
			String str1 = "문자";
			String str2 = "문자";
			String str3 = new String();
			String str4 = new String("문자");
			System.out.println(str1);
			System.out.println(str2);
			System.out.println(str3); // null // 주소값 // ""
			System.out.println(str4);
			boolean b = str1.equals(str4);
			if(str1.equals(str4)) System.out.println("같다");
			else  			 System.out.println("다르다.");
			
			System.out.println(hj);
			System.out.println(hj.toString());
			System.out.println(hj.hashCode());
			
			System.out.println(hj.getSno().MAX_VALUE);
			System.out.println(hj.getSno().toHexString(sno));
			System.out.println("끝");
			
			char c = '\'';
			System.out.println("한줄\n한탭\t탭한슬래쉬\\\\따옴표는 어떻게\"'?%");
			System.out.printf("한줄\n한탭\t탭한슬래쉬\\\\따옴표는 어떻게\"'?%%%%");
			
			System.out.println("안" +2+4);  // 안24
			System.out.println(2+4+ "안");  // 6안
			
			String str = "Hello Java";
			System.out.println(str.indexOf(' '));
			
			System.out.println(str.charAt(0));
			System.out.println(str.charAt(1));
			System.out.println(str.charAt(2));
			System.out.println(str.length());
			System.out.println(str.toLowerCase());
			System.out.println(str.toUpperCase());
			String strReplace = str.replace('J', 'L');
			System.out.println(strReplace);
			int idx = str.indexOf(' ');
			String strSubString = str.substring(str.indexOf(' ')+1, str.indexOf(' ')+2);
			System.out.println(strSubString);
			
			for(int i = 0 ; i < str.length(); i++) {
				
			}
			if(str.length() < 3) {
				
			}
			
			}else {
				System.out.println("다른 창구를 이용해주세요.");
			}
		}
	
	}

