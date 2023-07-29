package test1.jdbckh.customer_info.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test1.jdbckh.customer_info.model.dao.CustomerInfoDao;
import test1.jdbckh.customer_info.model.vo.CustomerInfoVo;

/**
 * Servlet implementation class CustomerGetController
 */
@WebServlet("/customer/get")
public class CustomerGetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerGetController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		 1. 전달받은 parameter 읽어내기
		  String custNo= request.getParameter("sno");
		  System.out.println(custNo);
//		  2.  전달받은 데이터를 활용해 DB학생 상세 정보 가져오기
		  CustomerInfoDao dao = new CustomerInfoDao();
		  CustomerInfoVo vo = dao.selectListCustomerInfo(custNo);
//		  3. DB으로부터 전달받은 데이터를 JSP에 전달함
		  System.out.println(vo);
			request.setAttribute("CustomerInfoList", vo);
//		  4. JSP 파일 forward로 열기
			request.getRequestDispatcher("/WEB-INF/view/customer/get.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
