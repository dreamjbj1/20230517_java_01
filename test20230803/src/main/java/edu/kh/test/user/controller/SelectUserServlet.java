package edu.kh.test.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.kh.test.user.model.service.UserService;
import edu.kh.test.user.model.vo.UserDTO;

/**
 * Servlet implementation class SelectUserServlet
 */
@WebServlet("/selectUser")
public class SelectUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserService service = new UserService();
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userNoStr = request.getParameter("userNo");
			int userNo = 0;
			try {
				userNo = Integer.parseInt(userNoStr);
			} catch (NumberFormatException e) {
			}		
			
			UserDTO result = service.selectOne(userNo);
			if(result != null) {
				request.setAttribute("udto", result);
				request.getRequestDispatcher("/WEB-INF/view/successSearch.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/WEB-INF/view/searchFail.jsp").forward(request, response);
			}
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
