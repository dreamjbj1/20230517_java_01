<%@page import="java.util.List"%>
<%@page import="kh.test.jdbckh.department.model.vo.DepartmentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서리스트</title>
</head>
<body>
	<h3>부서리스트</h3>
	<%
	List<DepartmentVo> volist= (List<DepartmentVo>)request.getAttribute("departmentList");	
	%>
	
	<table border="1">
	<tr>
		<td>부서번호</td>
		<td>부서이름</td>
		<td>부서계열</td>
		<td>부서개설</td>
		<td>부서정원</td>
	</tr>
	
		<%
		for(int i=0; i<volist.size(); i++){
			DepartmentVo vo = volist.get(i);
		%>
	
		<tr>
		<td><a href="<%=request.getContextPath() %>/department/get?sno=<%=vo.getDepartment_No() %>"><%= vo.getDepartment_No() %></a></td>
		<td><%=vo.getDepartment_Name() %></td>
		<td><%=vo.getCategory() %></td>
		<td><%=vo.getOpen_Yn() %></td>
		<td><%=vo.getCapacity() %></td>
		</tr>
		
		<%
		}
		%>
		
	</table>
</body>
</html>