package test1.jdbckh.sales_info.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test1.jdbckh.sales_info.dao.SalesInfoDao;
import test1.jdbckh.sales_info.dto.SalesInfoDto;



/**
 * Servlet implementation class SalesInfoListController
 */
@WebServlet("/sales/list")
public class SalesInfoListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/sales/list doGet() 진입");
		SalesInfoDao dao = new SalesInfoDao();
		List<SalesInfoDto> result = dao.selectListSalesInfo();
		request.setAttribute("SalesInfoList", result);
		request.getRequestDispatcher("/WEB-INF/view/sales/list.jsp").forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}