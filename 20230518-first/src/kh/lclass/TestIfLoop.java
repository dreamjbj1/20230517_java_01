package kh.lclass;

import java.util.Scanner;

public class TestIfLoop {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("나이를 입력해주세요. 정수 0~200 :");
		int age = sc.nextInt();
		// 8살이면 학교에 입학하였습니다.
		// 9살부터 ~ 19살까지 학교에 다닙니다
		// 그외 학교에 다니지 않습니다
		if (age == 8) {
			System.out.println("학교에 입학하였습니다.");
		}
		else if (age >= 9 && age <= 19  ) {
			System.out.println("학교에 다닙니다.");
		}
		else {
			System.out.println("학교에 다니지 않습니다");
		}
		// 8살부터 - 19살까지 학교에 다닙니다
			// 8살이면 학교에 입학하였습니다.
			// 19살이면 곧 졸업합니다.
		// 그외 학교에 다니지 않습니다.
		System.out.println("==========");
		System.out.println("공원입장료");
		System.out.println("나이를 입력해주세요: ");
		// 교제 99 flow chart 보면서 작성해주세요.
		
		System.out.println("==========");
		
		int age1 = 9;
		int charge = 0;
		age1 = sc.nextInt();
		
		switch(age1/*수식사용가능*/) {
		case 1:    // case(수식사용 불가)
		case 2:
		case 3: 
			
		}
			if (age1 < 8) {
				charge = 1000;
				System.out.println("취학 전 아동입니다.");
			}
		else if(age1 < 14) {
			charge = 2000;
			System.out.println("초등학생입니다.");
		}
		else if(age1 < 20) {
			charge = 2500;
			System.out.println("중,고등학생입니다.");
		}
		else {
			charge = 3000;
			System.out.println("일반인입니다.");
		
		}
		
			System.out.println("입장료는" + charge + "원입니다.");
			System.out.println("================");
			
			System.out.println("===================");
			System.out.println("===== 학점 ========");
			System.out.println("평균점수를 입력하세요.:");
			int totalScore = sc.nextInt();
			int score = totalScore / 10; // 10으로 나눈 몫 (정수연산이므로)
			
			//switch - case 문은 비교문의 규칙성이 있을때 사용하면 좋음
			
			switch(totalScore / 10) {
			case 10: //if
			case 9:
				System.out.println("A학점입니다.");
				break;
			case 8:
				System.out.println("B학점");
				break;
			case 7:
				System.out.println("C학점");
				break;
			case 6:
				System.out.println("D학점");
				break;
			default: // else
				System.out.println("과락입니다.");
				break;
			}
			
			System.out.println("==============");
			
			// 1~100 정수의 합을 구하시오.
			int i; 
			int sum;
			// for(1.초기값설정 ; 2,5,8.조건식 ; 4,7. 증감식 ) {
			for (i=1, sum = 0; i<=100 ; i=i+1) {
				// 3,6,10. 여기
				sum += i;
			}
			
			System.out.println("1부터 10까지의 합은" + sum + "입니다.");
			// 20명의 영어 성적을 입력받아 합계와 평균값을 구해주세요.
			
			

			
		sc.close();
	
	}

}
