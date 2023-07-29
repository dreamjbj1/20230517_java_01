package semiProject.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.board.dto.BoardDTO;
import semiProject.board.service.Service;

@WebServlet("/Board/update")
public class BoardUpdateController extends HttpServlet{
	
	
	private Service service;
	
	public BoardUpdateController() {
		service = new Service();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		BoardDTO dto = service.GetByOneList(Integer.parseInt(req.getParameter("board_id")));
		
		req.setAttribute("OneBoard", dto);
		
		
		
		String path = "/WEB-INF/view/boardUpdate.jsp";
		RequestDispatcher dis = req.getRequestDispatcher(path);
		dis.forward(req, resp);
		
	}
	
	@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			
			req.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html; charset=UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
			
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String board_id = req.getParameter("board_id");
			
			BoardDTO dto = new BoardDTO();
			
			dto.setContent(content);
			dto.setTitle(title);
			dto.setBoard_id(Integer.parseInt(board_id));
			
			
			
			int check = service.MainListUpdate(dto);
			
			PrintWriter out = resp.getWriter();
			
			if(check>0) {
				out.print("<script>alert('글쓰기 수정을 성공하셨습니다.'); location.href='/Pro_Project/Board'</script>");
				out.flush();
			}
			else 
			{
				out.print("<script>alert('글쓰기 수정을 실패하셨습니다.');</script>");
			}
			
			 //service.MainListUpdate(null);
		
			}
	
	
}
