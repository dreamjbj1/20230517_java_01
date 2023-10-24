package com.ncs.test.member.model.vo;

import java.sql.Date;


public class Member {
	
	private String memberId;
	private String memberPwd;
	private String memberNm;
	private Date memberEmrollDt;
	
	public Member() {
	
	}
	
	public Member(String memberId, String memberPwd, String memberNm, Date memberEmrollDt) {
		
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberNm = memberNm;
		this.memberEmrollDt = memberEmrollDt;
	}
	
	@Override
	public String toString() {
		return "MemberVo [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberNm=" + memberNm
				+ ", memberEmrollDt=" + memberEmrollDt + "]";
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberNm() {
		return memberNm;
	}
	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}
	public Date getMemberEmrollDt() {
		return memberEmrollDt;
	}
	public void setMemberEmrollDt(Date memberEmrollDt) {
		this.memberEmrollDt = memberEmrollDt;
	}
	
	
	
	
	
	
}
