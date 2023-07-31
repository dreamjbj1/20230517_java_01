<%@page import="test1.jdbckh.sales_info.model.vo.SalesInfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 상세 정보</title>
</head>
<body>
	<h2>판매 상세 정보</h2>
	
	<%
	SalesInfoVo vo = (SalesInfoVo)request.getAttribute("SalesInfoList");
	%>
	
	<table border="1">
		<tr>
		<td>판매번호</td>
		<td>회원번호</td>
		<td>단가</td>
		<td>수량</td>
		<td>가격</td>
		<td>상품코드</td>
		<td>판매일자</td>
		</tr>
		
		<tr>
			<td><%=vo.getSaleNol() %></td>
			<td><%=vo.getCustNo() %></td>
			<td><%=vo.getPcost() %></td>
			<td><%=vo.getAmount() %></td>
			<td><%=vo.getPrice() %></td>
			<td><%=vo.getPcode() %></td>
			<td><%=vo.getSdate() %></td>	
		</tr>
	
	</table>
</body>
</html>