package kh.lclass.bank;

//클래스선언 vs 클래스생성 = 인스턴스생성 = 객체생성 vs 인스턴스메소드호출 / 인스턴스필드값대입
public class BankAccount { // Kakao26
	// 필드 = 변수선언
	// static 클래스 변수
	private static int count; // 현재 통장을 개설한 사람 수 
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		BankAccount.count = count;
	}
	
	
	
	
	// setter가 있으면 안됨 아래3개는
	public int accountNo; // 계좌번호
	private String name; // 예금주
	private Integer sno = null; // 주민번호
	
	
	private String accountName; // 통장이름
	private Information info; // 유의상황
	private int balance = 2000; // 잔액
	private int password; // 비밀번호
	
	@Override
	public String toString() {
		return "BankAccount [accountNo=" + accountNo + ", name=" + name + ", sno=" + sno + ", accountName="
				+ accountName + ", info=" + info + ", balance=" + balance + ", password=" + password + "]";
	}

	{
		accountName = "내일배움-블럭초기화";
		balance = 5000000;
	}


	// 생성자 클래스명과 동일, 리턴타입없음
	public BankAccount() {
		accountName = "내일배움생성";
	}
	public BankAccount(Integer sno, String name) {
		this.sno = sno;
		this.name = name;
	}
	
	public BankAccount(Integer sno, String name, int phonenumber) {
		this.accountNo = phonenumber;
		this.sno = sno;
		this.name = name;
	}
	// overloading 오버로딩 조건 : 매개변수 개수, 자료형이 다르고 메소드 명이 같을 때
	public double sum(double a, double b) {
		return a+b;
	}
	public double sum(double a, int b) {
		return a+b;
	}
//	public double sum(int a, int b) {
//		return a+b;
//	}

	
	public int sum(int a, int b) {
		return a+b;
	}

	public int sum(int a, int b, int c) {
		return a+b+c;
	}

	public int sum(String a, int b) {
		return Integer.parseInt(a)+b;
	}

	public int sumArgs(int ... args) {
		int result = 0;
		for(int a : args) {
			System.out.println(a);
			result += a;
		}
		System.out.println("합은 " +result);
		// 가변인자 예
		System.out.printf("printf는 가변인자 사용 %d %.2f %d %c %s\n", 1, 3.5, 20000000000000L, 'c', "문자열도가능");
		System.out.println();
		return result;
	}

	// getter / setter
	

	// 메소드정의 = 기능정의
	// 입금 ---- 출처(source),금액(inputmoney) 준다면 - 최종 balance에 금액만큼 더하고 - 최종 balance를 화면
	// 표시함
	// 출금 ---- 목적지(destination), 금액(outputmoney) 준다면 - 최종 balance에 금액만큼 빼고 - 최종
	// balance를 화면 표시함
	// 비번확인 --- 입혁한패스워드(inputpassword)와 - password를 비교하여 같다면 true, 다른면 false플 표시함

	// 입금 ---- 출처(source),금액(inputmoney) 준다면 - 최종 balance에 금액만큼 더하고 - 최종 balance를 화면
	// 표시함
	public String deposit(String source, int inputMoney) {
		System.out.println(source + "으로 부터 " + inputMoney + "만큼 입금되었습니다");
		double interate = 0.05;
		balance = balance + inputMoney;
		interate = 5;
		return "입금 후 잔액은" + balance + "입니다";
	}

	
	
	public int getAccountNo() {
		return accountNo;
	}
	public String getName() {
		return name;
	}
	public Integer getSno() {
		return sno;
	}
	public String getAccountName() {
		return accountName;
	}
	public Information getInfo() {
		return info;
	}
	public int getBalance() {
		return balance;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public void setInfo(Information info) {
		this.info = info;
	}
	public void setPassword(int password) {
		this.password = password;
	}	
	public void setName(String string) {
		// TODO Auto-generated method stub

	}

	public void setBalance(int i) {
		// TODO Auto-generated method stub

	}

	// 생성자메소드
	// 그냥메소드
	// 비번확인
	// 잔액조회
	// 입출금내역조회
}