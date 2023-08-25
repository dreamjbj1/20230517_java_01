package kh.lclass.spring2.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kh.lclass.spring2.member.model.service.MemberService;
import kh.lclass.spring2.member.model.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/member/list")
	public String list(Model model
			//, HttpServletRequest request, HttpServletResponse response
			) {
		List<MemberVo> volist = memberService.selectList();
		//request.setAttribute("memberList", volist);   
		model.addAttribute("memberList", volist);   
		return "member/list";
	}
	
	@GetMapping("/member/get")
	public String get(Model model
//방법1			HttpServletRequest request
			, String mid
			) {
		model.addAttribute("membervo", memberService.selectOne(mid));
		return "member/get";
	}
	@GetMapping("/member/insert")
	public String insert() {
		return "member/insert";
	}
	@PostMapping("/member/insert") 
	public String insertDo(
			MemberVo vo
			, String mpwd
			) {
		System.out.println(vo);
		System.out.println(mpwd);
		return "redirect:/member/list";
	}
}