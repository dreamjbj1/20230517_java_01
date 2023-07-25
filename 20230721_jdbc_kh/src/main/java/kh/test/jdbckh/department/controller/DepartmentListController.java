package kh.test.jdbckh.department.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.test.jdbckh.department.department.model.vo.DepartmentDao;
import kh.test.jdbckh.department.model.vo.DepartmentVo;

/**
 * Servlet implementation class DepartmentController
 */
@WebServlet("/department/list")
public class DepartmentListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartmentListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/department/list doGet() 진입");
//		1. 전달받은 parameter 읽어내기
		String searchWord = request.getParameter("searchWord");
		String pageNoStr = request.getParameter("pageNo");
		int currentPage = 1;
		if(pageNoStr != null) {
			currentPage = Integer.parseInt(pageNoStr);
		}
		//		TODO DB
		DepartmentDao dao = new DepartmentDao();
		List<DepartmentVo> result = null;
		if(searchWord != null) {
			result = dao.selectListDepartment(searchWord);
		} else {
//			전체
//			result = dao.selectListDepartment();
//			페이징
			result = dao.selectListDepartment(currentPage, 10);
		}
		if(searchWord !=null) {
			request.setAttribute("searchWord", searchWord );
		}
		request.setAttribute("departmentList", result);
		request.getRequestDispatcher("/WEB-INF/view/department/list2.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
