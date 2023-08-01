<%@page import="kh.test.jdbckh.department.model.dto.DepartmentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과 정보</title>
</head>
<body>
	<h4>학과 정보</h4>
	
 	<%
	DepartmentDto vo = (DepartmentDto)request.getAttribute("deptList");
	 %> 
	<table border="1">
	<tr>
		<td>부서번호</td>
		<td>부서이름</td>
		<td>부서계열</td>
		<td>부서개설</td>
		<td>부서정원</td>
	</tr>

		<tr>
		<td><%=vo.getDepartmentNo() %></td>
		<td><%=vo.getDepartmentName() %></td>
		<td><%=vo.getCategory() %></td>
		<td><%=vo.getOpenYn() %>
		<td><%=vo.getCapacity() %>
		</tr>
			
	</table>
	
</body>
</html> 