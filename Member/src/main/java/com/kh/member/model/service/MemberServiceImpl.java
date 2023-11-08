package com.kh.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.MemberVo;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements  MemberService{

	@Autowired
	private MemberDao memberdao;
	@Override
	public MemberVo loginId(String loginId) {
		return memberdao.loginId(loginId);
	}
}
