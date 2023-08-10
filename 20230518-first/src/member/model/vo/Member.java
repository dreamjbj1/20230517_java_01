package member.model.vo;

// jvm import java.lang.*;
import java.util.Date;
import java.lang.*;

public class Member {
	private String name;
	private int age;
	private Date enrollDate;
	public Member() {}
	public Member(String name, int age) {
		this.name = name;
		this.age = age;
		return;
	}
	public String getName() {
		return name;
	}
}
	