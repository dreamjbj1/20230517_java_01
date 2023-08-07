package test1.jdbckh.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test1.jdbckh.member.model.dto.MemberDto;
import test1.jdbckh.member.service.MemberService;

/**
 * Servlet implementation class MemberInsertServletDo
 */
@WebServlet("/member/insert.do")
public class MemberInsertServletDo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();
	
//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String custNoStr = request.getParameter("custNo");
		int custNo = 0;
		try {
			custNo = Integer.parseInt(custNoStr);
		} catch (NumberFormatException e) {
		}
		String custName = request.getParameter("custName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		String joinDateStr = request.getParameter("joinDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			  Date date = (Date) sdf.parse(joinDateStr);
		} catch (java.text.ParseException e) {
		}
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		
		MemberDto dto = new MemberDto();
		dto.setCustoNo(custNo);
		dto.setCustName(custName);
		dto.setPhone(phone);
		dto.setAddress(address);
		dto.setJoinDate(joinDateStr);
		dto.setGrade(grade);
		dto.setCity(city);
		
		int result = service.insertMember(dto);
		response.sendRedirect(request.getContextPath()+"/member/list");
}

}
