package kh.lclass.spring2.board.controller;

import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.lclass.spring2.board.model.service.BoardService;
import kh.lclass.spring2.board.model.vo.BoardVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list")
	public ModelAndView list( 
			//			RedirectAttributes rttr,
			String msg2,
			String m3,
			String n1,
			
			
			// Controller --> JSP(view) 선택 + 데이터 전달
			ModelAndView mv
			) throws Exception {
		
		// 안보임, 의미없음. JSP에서 데이터 꺼내짐
//		System.out.println(rttr.getAttribute("mag2"));
//		Map<String, Object> map = (Map<String, Object>) rttr.getFlashAttributes();
//		System.out.println(map);
		System.out.println(msg2);
		System.out.println(m3);
		System.out.println(n1);
//		 model.addAttribute("boardList", boardService.selectList());
		// return "board/list";
			
			mv.addObject("boardList", boardService.selectList());
			mv.setViewName("board/list");
			return mv;
	}
	@GetMapping("/get")
	public String get(Model model
			// 방법 1 , HttpServletRequest request
			, int bno // 방법 2
			, String a
			) throws Exception {	
		// JSP --> Controller 데이터
		// 방법 1 		int bno = Integer.parseInt(request.getParameter("bno"));
		
		// Controller --> JSP(view) 데이터 전달
		model.addAttribute("boardvo", boardService.selectOne(bno));
		
	
		// Controller --> JSP(view) 선택 forward
		return "board/get";
	}
	@GetMapping("/insert")
	public String insert() {
		// FlashAttribute를 위해 작성할 거 없음. jsp에서
		String viewPage = "board/insert";
		return viewPage;
	}
	@PostMapping("/insert")
	public String insertDo (
			RedirectAttributes redirectAttr, // redirect:url 상황에서 url--> jsp 데이터를 전달하기 위해 추가된 자료형 
			
			// 방법 1 HttpServletRequest request
			BoardVo vo
			, String btitle
			, Principal principal
			, MultipartRequest multReq // file 여러개
			, MultipartFile multiFile // file 1개
			, @RequestParam(name = "updoadFile1") MultipartFile file1
			, @RequestParam(name = "updoadFile2") MultipartFile file2
			) { // 메소드 내부에서 처리함. ExceptionHandler로 가지 않도록 함
		// 
		String viewPage = "redirect:/";
		// 방법 1
//		String btitle = request.getParameter("btitle");
//		String bcontent = request.getParameter("bcontent");
//		BoardVo vo = new BoardVo();
//		vo.setBcontent(bcontent);
//		vo.setBtitle(btitle);
		System.out.println(vo);
		System.out.println(btitle);
		
		// TODO login한 mid
		vo.setMid("kh1");
		
		int result;
		try {
				result = boardService.insert(vo); 
				result = 1;
				// 1: 글등록 성공, 0: 글등록 실패
				if(result < 1) {
					redirectAttr.addAttribute("msg2", "msg2");
					redirectAttr.addFlashAttribute("msg", "글등록 실패했습니다. 다시 입력하고 등록해주세요.");
					viewPage = "redirect:/board/insert";
				} else {
					redirectAttr.addAttribute("msg2", "msg2");
					redirectAttr.addAttribute("m3", "m3");
					redirectAttr.addFlashAttribute("msg", "글 등록 되었습니다.");
					viewPage = "redirect:/board/list?n1=v1&n2=v2";
				}
			}catch (Exception e) {
				// 오류발생시
				redirectAttr.addFlashAttribute("msg", "예기치 못한 상황으로 글등록에 실패했습니다. 다시 시도해 주세요.");
				viewPage = "redirect:/board/list";
			}
				return viewPage;
		} 
		
	
		// 절대위치 작성하면 됨.
	
//	@ExceptionHandler
//	public void e() {
//	}	
}
