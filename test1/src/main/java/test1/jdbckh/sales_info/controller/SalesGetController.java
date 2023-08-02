package test1.jdbckh.sales_info.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test1.jdbckh.sales_info.model.dao.SalesInfoDao;
import test1.jdbckh.sales_info.model.vo.SalesInfoVo;

/**
 * Servlet implementation class SalesGetController
 */
@WebServlet("/sales/get")
public class SalesGetController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		1. 전달받은 parameter 읽어내기
		String SaleNolStr = request.getParameter("sno");
		System.out.println(SaleNolStr);
		int SaleNol = 0;
		try {
			SaleNol = Integer.parseInt(SaleNolStr);
		}catch (Exception e) {
		}
//		2. 전달받은 데이터를 활용해 DB학생 상세 정보 가져오기
		SalesInfoDao dao = new SalesInfoDao();
		SalesInfoVo vo = dao. selectOneSalesInfo(SaleNol);
//		3. DB으로부터 전달받은 데이터를 JSP에 전달함
		System.out.println(vo);
		request.setAttribute("SalesInfoList", vo);
//		2. jsp파일 forward로 열기
			request.getRequestDispatcher("/WEB-INF/view/sales/get.jsp").forward(request, response);
	} 
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
