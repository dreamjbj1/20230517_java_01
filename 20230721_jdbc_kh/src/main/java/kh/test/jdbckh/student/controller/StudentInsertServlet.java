package kh.test.jdbckh.student.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.jdbckh.department.model.service.DepartmentService;

/**
 * Servlet implementation class StudentInsertServlet
 */
@WebServlet("/student/insert")
public class StudentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DepartmentService service = new DepartmentService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 학과번호,지도교수번호
		//
		
		request.getRequestDispatcher("/WEB-INF/view/student/insert.jsp").forward(request, response);
	}
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response); 
//	}

}
