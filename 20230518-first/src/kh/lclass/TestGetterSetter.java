package kh.lclass;

public class TestGetterSetter {
	private int abc1;
	private long abc2;
	private String abc3;
	private float abc4;
	private double abc5;

	// getter / setter
	public int getAbc1(/*매개인자없어도됨*/) {
		return this.abc1;
	}
	public void setAbc1( int  b1/*대입할값을 담을 매개변수선언*/) {
		this.abc1 = b1;		
	}
	public long getAbc2() {
		return abc2;
	}
	public void setAbc2(long abc2) {
		this.abc2 = abc2;
	}
	public String getAbc3() {
		return abc3;
	}
	public void setAbc3(String abc3) {
		this.abc3 = abc3;
	}
	public float getAbc4() {
		return abc4;
	}
	public void setAbc4(float abc4) {
		this.abc4 = abc4;
	}
	public double getAbc5() {
		return abc5;
	}
	public void setAbc5(double abc5) {
		this.abc5 = abc5;
	}
}



