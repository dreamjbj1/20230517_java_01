package practice3;

import java.util.Scanner;

public class VariablePractice {
	public void method1() {
		Scanner sc = new Scanner(System.in);
		System.out.print("wj  : ");
		int num = sc.nextInt();
		if(num > 0) {
			System.out.println("양수다");
		} else {
			System.out.println("양수가 아니다");
		}
	
	}
	
	public void method2() {
		Scanner sc = new Scanner(System.in);
		System.out.println("kkk:  ");
		int num2 = sc.nextInt();
		if(num2 > 0) {
			System.out.println("양수다");
		} 
		else if(num2 < 0) {
			System.out.println("음수다");
		}
		else {
			System.out.println("0이다");
		}
		
		
	}
	
	public void method3() {
		Scanner sc = new Scanner(System.in);
		System.out.println("정수: ");
		int num3 = sc.nextInt();
		if(num3 / 2 == 0) {
			System.out.println("짝수다");
		}
		else {
			System.out.println("홀수다");
		}
		
		
	}
		public void method4() {
	
			
			Scanner sc = new Scanner(System.in);
			System.out.println("이름");
			String name = sc.nextLine();
			System.out.println("학년(숫자만) : ");
			int grade = sc.nextInt();
			System.out.println("반(숫자만) : ");
			int classgrade = sc.nextInt();
			System.out.println("번호(숫자만) : ");
			int classnum = sc.nextInt(); 
			sc.nextLine();// flush()
			System.out.println("성별(M/F) : ");
			char gender = sc.nextLine().charAt(0);
			System.out.println("성적(소수점 아래 둘째 자리까지) : ");
			double score = sc.nextDouble();
		
		
			String student = (gender == 'M') ? ("남학생") : ("여학생");
		
			System.out.println(grade + "학년" + classgrade + "반" + classnum + "번" + name + gender +"의 성적은"+ score +"이다" );
		
		
	}
	
		public void method5() {
			Scanner sc = new Scanner(System.in);
			System.out.println("국어 :");
			int korea = sc.nextInt();
			System.out.println("영어 :");
			int english = sc.nextInt();
			System.out.println("수학 :");
			int math = sc.nextInt();
			
			int total = (korea + english + math);
			double avg = ((total) / 3.0);
			
			System.out.println(total);
			System.out.println(avg);
			
			if(total >= 40 && avg >= 60) {
				System.out.println("합격"); 
			}
			else {
				System.out.println("불합격");
			}
				
	}
		public void method6() {
			Scanner sc = new Scanner(System.in);
			System.out.println("나이 :");
			int age = sc.nextInt();
			if(age <= 13) {
				System.out.println("어린이");
			}
			else if(age >13 && age <=19) {
				System.out.println("청소년");
			}
			else {
				System.out.println("성인");
			}
			
		}
	
	
}
