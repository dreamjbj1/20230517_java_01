<%@page import="kh.test.jdbckh.department.model.vo.DepartmentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 상세 정보</title>
</head>
<body>
	<h4>부서 상세 정보</h4>
	
	<%
	DepartmentVo vo = (DepartmentVo)request.getAttribute("departmentList");
	
	%>
	<table border="1">
	<tr>
		<td>부서번호</td>
		<td>부서이름</td>
	</tr>

		<tr>
		<td><%=vo.getDepartment_No() %></td>
		<td><%=vo.getDepartment_Name() %></td>
		</tr>
			
	</table>
	
</body>
</html>