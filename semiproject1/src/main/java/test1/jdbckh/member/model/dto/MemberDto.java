package test1.jdbckh.member.model.dto;

import java.sql.Date;

public class MemberDto{
	
// 	vo -> 자료저장
//	CUSTNO   NOT NULL NUMBER(6)    
//	CUSTNAME          VARCHAR2(20) 
//	PHONE             VARCHAR2(13) 
//	ADDRESS           VARCHAR2(60) 
//	JOINDATE          DATE         
//	GRADE             CHAR(1)      
//	CITY              CHAR(2)
	
	private int custNo;
	private String custName;
	private String phone;
	private String address;
	private String joinDate;
	private String grade;
	private String city;
	
	public MemberDto() {
	}

	public MemberDto(int custNo, String custName, String phone, String address, String joinDate, String grade,
			String city) {
		super();
		this.custNo = custNo;
		this.custName = custName;
		this.phone = phone;
		this.address = address;
		this.joinDate = joinDate;
		this.grade = grade;
		this.city = city;
	}

	@Override
	public String toString() {
		return "MemberDto [custNo=" + custNo + ", custName=" + custName + ", phone=" + phone + ", address=" + address
				+ ", joinDate=" + joinDate + ", grade=" + grade + ", city=" + city + "]";
	}

	public int getCustNo() {
		return custNo;
	}

	public void setCustNo(int custNo) {
		this.custNo = custNo;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	
	
}
	