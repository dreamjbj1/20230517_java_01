package com.ncs.test.member.controller;

import java.lang.annotation.Target;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ncs.test.member.model.vo.Member;
import com.ncs.test.member.service.MemberService;

@Controller
public class MemberController {
	 
	@Autowired
	private MemberService memberService;
	
	
	// 로인인 요청 URL을 매핑하여 서비스 호출 및 뷰 연결처리를 하는 메소드
	@GetMapping("/")
	public String index ()  {
		// 2)로그인 실패시 "로그인 실패" 문구 예시
		return "index";
	}
	
	@PostMapping("/login")
	public String memberLogin(Member vo) {
		Member result = memberServiceImpl.loginMember(vo);
		if(result == null) {
			
			return "redirect:/error"
		}
		model.att
		return "redirect:/"
	}
}
