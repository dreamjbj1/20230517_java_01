<%@page import="test1.jdbckh.sales_info.model.vo.SalesInfoVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매정보</title>
</head>
<body>
	<h2>판매 정보</h2>
	<%
	List<SalesInfoVo> volist = (List<SalesInfoVo>)request.getAttribute("SalesInfoList");
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
		
		<%
		for(int i=0; i<volist.size(); i++) {
			SalesInfoVo vo = volist.get(i);
		%>
		<tr>
			<td><a href="<%=request.getContextPath()%>/sales/get?sno=<%=vo.getSaleNol() %>"><%=vo.getSaleNol() %></a></td>
			<td><%=vo.getCustNo() %></td>
			<td><%=vo.getPcost() %></td>
			<td><%=vo.getAmount() %></td>
			<td><%=vo.getPrice() %></td>
			<td><%=vo.getPcode() %></td>
			<td><%=vo.getSdate() %></td>	
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>