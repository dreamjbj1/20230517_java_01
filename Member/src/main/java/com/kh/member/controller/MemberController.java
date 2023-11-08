package com.kh.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.service.MemberServiceImpl;
import com.kh.member.model.vo.MemberVo;

@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@ResponseBody
	@RequestMapping(value="/idChk", method= RequestMethod.POST)
	public String loginId(@RequestParam String loginId) {
		MemberVo vo= memberServiceImpl.loginId(loginId);
		String result = "";
		if(vo ==null) {
			result= "Yes";
		}else {
			result= "No";
		}
		return result;
		
	}
	
	
	
	
}
