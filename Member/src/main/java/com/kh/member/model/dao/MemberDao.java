package com.kh.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.member.model.vo.MemberVo;

@Repository
public class MemberDao {

	@Autowired
		private SqlSession sqlSession;
	
	public MemberVo loginId(String loginId) {
		return sqlSession.selectOne("member.idChk",loginId);
	}
	
	
	
}
