<%@page import="kh.test.jdbckh.student.model.vo.StudentVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 상세 정보</title>
</head>
<body>
 	<h1>학생 상세 정보</h1>
 	
	<%
	StudentVo vo = (StudentVo)request.getAttribute("student");

	%>
	
	<table border="1">
	<tr>
		<td>학번</td>
		<td>이름</td>
	</tr>

		<tr>
		<td><%=vo.getStudentNo() %></td>
		<td><%=vo.getStudentName() %></td>
		</tr>
		

		
	</table>
</body>
</html>