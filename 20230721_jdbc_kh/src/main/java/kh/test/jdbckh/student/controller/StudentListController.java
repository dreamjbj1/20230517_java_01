package kh.test.jdbckh.student.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.jdbckh.student.model.dao.StudentDao;
import kh.test.jdbckh.student.model.vo.StudentVo;

/**
 * Servlet implementation class StudentListController
 */
@WebServlet("/student/list")
public class StudentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/student/list doGet() 진입");
//		1. 전달받은 parameter 읽어내기
		String searchWord = request.getParameter("searchWord");
		String pageNoStr = request.getParameter("pageNo");
		int currentPage = 1;
		if(pageNoStr != null) {
			currentPage = Integer.parseInt(pageNoStr);
		}
//		2. 전달받은 데이터를 활용해
//		2. DB학생 상세 정보 가져오기
//		TODO DB		
		StudentDao dao = new StudentDao();
		List<StudentVo> result = null;
		if(searchWord != null) {
//			검색
//			System.out.println(searchWord);
			result = dao.selectListStudent(searchWord);
		} else {
//			전체
//			result = dao.selectListStudent();
//			페이징
			result = dao.selectListStudent(currentPage, 10);
		}
//		3. DB로부터 전달받은 데이터를 JSP에 전달함
//		request.setAttribute("studentList", result);
		if(searchWord != null) {
			request.setAttribute("searchWord", searchWord);
		}
//		4. JSP파일 forward 열기
		request.setAttribute("studentList", result);
		request.getRequestDispatcher("/WEB-INF/view/student/list.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
