package com.ncs.test.member.service;

import java.util.List;

import com.ncs.test.member.model.vo.Member;

public interface MemberService {
	public List<Member> selectList() throws Exception;
	public Member selectOne(String memberId) throws Exception;
	public int insert(String memberId) throws Exception;
	
	
}
