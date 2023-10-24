package com.ncs.test.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.test.member.model.dao.MemberDao;
import com.ncs.test.member.model.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDao;

	@Override
	public List<MemberVo> selectList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVo selectOne(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(String memberId) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member
}
