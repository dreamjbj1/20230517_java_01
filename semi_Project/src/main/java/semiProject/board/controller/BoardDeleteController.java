package semiProject.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.board.dto.BoardDTO;
import semiProject.board.service.Service;

@WebServlet("/Board/delete")
public class BoardDeleteController extends HttpServlet{

	
	private Service service;
	
	public BoardDeleteController() {
		service = new Service();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		
		
		String board_id = req.getParameter("board_id");
		
		BoardDTO dto = new BoardDTO();
		
		
		
		int check = service.MainListDelete(Integer.parseInt(board_id));
		
		PrintWriter out = resp.getWriter();
		
		if(check>0) {
			out.print("<script>alert('글쓰기 삭제을 성공하셨습니다.'); location.href='/Pro_Project/Board'</script>");
			out.flush();
		}
		else 
		{
			out.print("<script>alert('글쓰기 삭제을 실패하셨습니다.');</script>");
		}
		
		 //service.MainListUpdate(null);
	
		}
		
	
	
}
