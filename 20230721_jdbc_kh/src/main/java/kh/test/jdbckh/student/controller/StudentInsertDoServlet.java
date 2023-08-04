package kh.test.jdbckh.student.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.jdbckh.student.model.service.StudentService;
import kh.test.jdbckh.student.model.vo.StudentVo;

/**
 * Servlet implementation class StudentInsertDoServlet
 */
@WebServlet("/student/insert.do")
public class StudentInsertDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 StudentService service = new StudentService();   
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}  doGet()메소드 삭제
	 
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		TODO 한글 깨짐 방지  -- filter 
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
//		response.setCharacterEncoding("UTF-8");
		 String studentNo = request.getParameter("studentNo");
		 String departmentNo = request.getParameter("departmentNo");
		 String studentName = request.getParameter("studentName");
		 String studentSsn =  request.getParameter("studentSsn");
		 String studentAddress =  request.getParameter("studentAddress");
//	 오류	 Date entranceDate =  request.getParameter("entranceDate");
		 String entranceDate =  request.getParameter("entranceDate");
		 String absenceYn =  request.getParameter("absenceYn");
		 String coachProfessorNo= request.getParameter("coachProfessorNo");
		 
		 StudentVo vo = new StudentVo();
		 vo.setAbsenceYn(absenceYn);
		 vo.setCoachProfessorNo(coachProfessorNo);
		 vo.setDepartmentNo(departmentNo);
		 vo.setEntranceDate(entranceDate);
		 vo.setStudentAddress(studentAddress);
		 vo.setStudentName(studentName);
		 vo.setStudentNo(studentNo);
		 vo.setStudentSsn(studentSsn);
		 
		 System.out.println(vo);
		 int result = service.insertStudent(vo);
		 response.sendRedirect(request.getContextPath()+"/student/list");	
	}

}
