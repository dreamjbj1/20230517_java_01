<%@page import="test1.jdbckh.money.dto.MoneyDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>
	<h2>회원매출조회</h2>
	<%
	List<MoneyDto> volist = (List<MoneyDto>)request.getAttribute("MoneyList");
	%>
	
	<table border="1">
	<tr>
		<td>회원번호</td>
		<td>회원이름</td>
		<td>등급</td>
		<td>총합</td>
		</tr>
		
		<%
				for(int i=0; i<volist.size(); i++) {
					MoneyDto vo = volist.get(i);
				%>
		<tr>
			<td><%=vo.getCustNo() %></td>
			<td><%=vo.getCustName() %></td>
			<td><%=vo.getGrade() %></td>
			<td><%=vo.getTotal() %></td>	
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>