package semiProject.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semiProject.board.dto.BoardDTO;
import semiProject.board.dto.BoardPageDTO;
import semiProject.board.service.Service;


@WebServlet("/Board")
public class BoardController extends HttpServlet{

	private Service service;
	
	public BoardController() {
		service = new Service();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		int currentPage = 1; //현재 페이지
		
		String searchWord = req.getParameter("searchWord");
		
		
		if(req.getParameter("currentPage")!=null)currentPage = Integer.parseInt(req.getParameter("currentPage"));
		
		 if(currentPage ==0)currentPage = 1;
		 
		 
		
		 int totalPage= service.BoardListMainTotalCount(searchWord);
		
		 BoardPageDTO pageDTO = new BoardPageDTO(currentPage, totalPage, searchWord);
		 
		
		 
		 req.setAttribute("pv", pageDTO);
		 req.setAttribute("BoardMainList", service.BoardListMain(pageDTO));
		
		String path = "/WEB-INF/view/board.jsp";
		RequestDispatcher dis = req.getRequestDispatcher(path);
		dis.forward(req, resp);
		
		
	}
	

}
