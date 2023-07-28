package test1.jdbckh.customer_info.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test1.jdbckh.customer_info.model.dao.CustomerInfoDao;
import test1.jdbckh.customer_info.model.vo.CustomerInfoVo;

/**
 * Servlet implementation class CustomerInfoListController
 */
@WebServlet("/customer/list")
public class CustomerInfoListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerInfoListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/customer/list doGet() 진입");
		CustomerInfoDao dao = new CustomerInfoDao();
		List<CustomerInfoVo> result = dao.selectListCustomerInfo();
		request.setAttribute("CustomerInfoList", result);
//		request.setAttribute("aaa", "그냥속성값테스트해봄");
//		request.setAttribute("bbb", "그냥속성값테스트해봄2");
		 request.setAttribute("ccc", 333); 
		request.getRequestDispatcher("/WEB-INF/view/customer/list.jsp").forward(request, response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
