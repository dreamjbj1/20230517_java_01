package com.kh.practice2.func;

import java.util.Scanner;

public class VariablePractice1 {

	
	//이름, 성별, 나이, 키를 사용자에게 입력 받아 각각의 값을 변수에 담고 출력하세요.
		//ex.
		//이름을 입력하세요 : 아무개
		//성별을 입력하세요(남/여) : 남
		//나이를 입력하세요 : 20
		//키를 입력하세요(cm) : 180.5
		//키 180.5cm인 20살 남자 아무개님 반갑습니다^
	
		public void method1() {
		System.out.println("여기 실행됨 여기코딩함");
		Scanner sc = new Scanner(System.in);
		System.out.print("이름을 입력하세요 :");
		String name = sc.nextLine();
		System.out.print("성별을 입력하세요(남/여) : " ) ;
		char gender = sc.nextLine().charAt(0);
		System.out.print("나이를 입력하세요 :" );
		int age = sc.nextInt();
		System.out.print("키를 입력하세요(cm) : ");
		double height = sc.nextDouble();
		System.out.println("키" + height + "cm " +age+"살" +gender+" "+name+"님 반갑습니다^");
		}
		public void method2() {
			System.out.println("2번");
		Scanner sc = new Scanner(System.in);
		System.out.println("첫 번째 정수 :");
		int firstInt = sc.nextInt();
		System.out.println("두 번째 정수 :");
		int secondInt = sc.nextInt();
		
		System.out.println("더하기 결과 : " + (firstInt + secondInt));
		System.out.println("빼기 결과 : " + (firstInt - secondInt));
		System.out.println("곱하기 결과 : " + (firstInt * secondInt));
		System.out.println("나누기 몫 결과 : " + (firstInt / secondInt));
		
		
		
		
	}
		public void method3() {
			System.out.println("3번");
		Scanner sc = new Scanner(System.in);
		System.out.println("가로:");
		float width = sc.nextFloat();
		System.out.println("세로");
		float height = sc.nextFloat();
		
		System.out.println("면적 :" + (width * height));
		System.out.println("둘레 :" + (width + height) * 2);
		}
		
		public void method4() {
			System.out.println("4번");
		Scanner sc = new Scanner(System.in);
		System.out.println("문자열을 입력하세요 : ");
		String word = sc.nextLine();
		System.out.println("첫번째 문자" + word.charAt(0));
		System.out.println("두번째 문자" + word.charAt(1));
		System.out.println("세번째 문자" + word.charAt(2));
		
		
		}
		
	
			
	}
		
		
		



