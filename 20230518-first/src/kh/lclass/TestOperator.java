package kh.lclass;

public class TestOperator {
	public static void main(String[] arge) {
		int num1 = 100;
		int num2 = 3;
		double num3 = 3.0;
		System.out.println(num1%num2);
		System.out.println(num1%num3);
		System.out.println(-num1);
		System.out.println(-(-num1-10));
	
	//
	int a = 1;
	int b = 0; //처리완료자수
	a = a + 1; // 대기번호표, 대기자수아님
	a += 1;
	System.out.println(a); // 3
	a = a * 2; // 대기번호표, 대기자수아님
	System.out.println(a); // 
	a *= 2;
	System.out.println(a); // 
	a = a / 4; // 대기번호표, 대기자수아님
 	System.out.println(a); // 3
	a %= 4;
	System.out.println(a); // 3
//	a = a + 1;
//	a += 1; 
//	a = a - 1;
//	a -= 1;
	a++;
	++a;
	--a;
	a--;
	System.out.println("전위증감");
	a = 10;
	System.out.println(++a); //11
	System.out.println(a); // 11
	System.out.println(--a); // 10
	System.out.println(a); //10
	System.out.println("후위증감");
	a = 10;
	System.out.println(a++); //a +=1; // 여기서 ++ 후위증감 동작
	System.out.println(a); //11
	
	System.out.println(a--); //11
	System.out.println(a); // 10
	
	System.out.println("비교연산자결과는 true/false");
	System.out.println(3<7);
	boolean c = !(3 < 5);
//	boolean d = !3 < 5; 안된다
//	boolean e = !3 안된다 정수값,실수값,문자값 등은 true,false로 형변환되지 않음
	
	// int num5 = 10;
	

	}	
}