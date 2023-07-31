<%@page import="test1.jdbckh.customer_info.model.vo.Cust"
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
</head>
<body>
	<h1>회원 상세 정보</h1>
	
	<%
	CustomerInfoVo vo = (CustomerInfoVo)request.getAttribute("CustomerInfoList");
	%>
	
	<table border="1">
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>회원전화</td>
		<td>주소</td>
		<td>가입일자</td>
		</tr>
		
		
		
		<tr>
		<td><%=vo.getCustoNo() %></td>
		<td><%=vo.getCustName() %></td>
		<td><%=vo.getPhone() %></td>
		<td><%=vo.getAddress() %></td>
		<td><%=vo.getJoinDate() %></td>
		</tr>
		
	</table>
</body>
</html>