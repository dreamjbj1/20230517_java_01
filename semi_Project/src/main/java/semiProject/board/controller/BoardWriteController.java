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

@WebServlet("/Board/write")
public class BoardWriteController extends HttpServlet{

	
	private Service service;
	
	public BoardWriteController() {
		service = new Service();
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		String path = "/WEB-INF/view/boardWrite.jsp";
		RequestDispatcher dis = req.getRequestDispatcher(path);
		dis.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String user_id = req.getParameter("user_id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		BoardDTO dto = new BoardDTO();
		
		dto.setContent(content);
		dto.setTitle(title);
		dto.setUser_id(user_id);
		
		System.out.println(dto);
		
		int check = service.MainListWrite(dto);
		
		PrintWriter out = resp.getWriter();
		
		if(check>0) {
			out.print("<script>alert('글쓰기를 성공하셨습니다.'); location.href='/Pro_Project/Board'</script>");
			out.flush();
		}
		else 
		{
			out.print("<script>alert('글쓰기를 실패하셨습니다.');</script>");
		}
			
		
		
	}
	
}
