package kh.lclass.oop.sample;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Kh implements TestInterface, Serializable {
	static final long serialVersionUID = 1L;

	// The serializable class Kh does not declare a static final serialVersionUID
	// field of type long
	/**
	 *	
	 */
	public void khSpecial() {
		String str = "1111111222222";
//		int c = Integer.parseInt(str);
		try {
			Car[] carArr = new Car[3];
			// carArr[0] = new Car();
			carArr[4].setPrice(5000); // NullPointerException
			carArr[0].setPrice(5000); // NullPointerException

			int a = Integer.parseInt(str); // NumberFormatException

			int c = 10 / 0; // ArithemeticException
			c = 0 / 10;
		} catch (NumberFormatException e) {
			System.out.println(Integer.MAX_VALUE + "까지의 정수만 입력해주세요");
			e.printStackTrace();
		} catch (ArithmeticException e) {
			System.out.println("0으로 나눈 수는 나타낼 수 없습니다.");
			e.printStackTrace();
		} catch (NullPointerException e) {
			System.out.println("예기치 못한 오류 발생하였습니다. 잠시 후 다시 시도해주세요.");
			e.printStackTrace();
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("데이터 범위를 벗어났습니다..");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("=== 여기가 마지막 ======");
	}

	@Override
	public void method1() {
		// TODO Auto-generated method stub

	}

	@Override
	public String method2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int method3(int a, int b) {
		// TODO Auto-generated method stub
		return 0;
	}

	// @Override
	// public int method3(int a, int b) {
	// TODO Auto-generated method stub
	// return 0;
}
