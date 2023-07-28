<%@page import="test1.jdbckh.customer_info.model.vo.CustomerInfoVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
	<h2>회원 정보</h2>
	<%
	/* int c = (int)request.getAttribute("ccc"); */
	List<CustomerInfoVo> volist = (List<CustomerInfoVo>)request.getAttribute("CustomerInfoList");
	%>
	
	<table border="1">
		<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>회원전화</td>
		<td>주소</td>
		<td>가입일자</td>
		<td>고객등급</td>
		<td>거주도시</td>
		</tr>
		
		<%
		for(int i=0; i<volist.size(); i++){
			CustomerInfoVo vo = volist.get(i);
		
		%>
		
		<tr>
			<td><%=vo.getCustoNo() %></td>
			<td><%=vo.getCustName() %></td>
			<td><%=vo.getPhone() %></td>
			<td><%=vo.getAddress() %></td>
			<td><%=vo.getJoinDate() %></td>
			<td><%=vo.getGrade() %></td>
			<td><%=vo.getCity() %></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>