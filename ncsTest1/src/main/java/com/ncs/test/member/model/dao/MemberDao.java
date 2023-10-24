package com.ncs.test.member.model.dao;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ncs.test.member.model.vo.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession SqlSessionTemplate;
	

	public List<Member> selectList() throws Exception {
		return sqlSession.selectList("member", selectList());
	}
	public Member selectOne(Member vo) throws Exception {
		return SqlSessionTemplate.selectOne("member", vo);
	}
	public int insert(String memberId) throws Exception {
		return sqlSession.insert(memberId);
	}
} 
