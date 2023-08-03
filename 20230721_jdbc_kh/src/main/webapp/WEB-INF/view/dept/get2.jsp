<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과 정보</title>
</head>
<body>
	<h2>학과 정보</h2>
<c:if test="${empty dvo }">
	<h2>찾는 학과 정보가 없습니다. </h2>
</c:if>

<c:if test="${not empty dvo }">
	<h4>${dvo.departmentNo } </h4>
	학과이름 : ${dvo.departmentName }<br>
	계열 : ${dvo.category }<br>
	개설여부 : ${dvo.openYn }<br>
	정원 : ${dvo.capacity }<br>
</c:if>

	<a href="${pageContext.request.contextPath }/dept/list">다시 찾기</a>
</body>
</html> --%>



































<%-- <%@page import="kh.test.jdbckh.department.model.dto.DepartmentDto"%>
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
</html>  --%>