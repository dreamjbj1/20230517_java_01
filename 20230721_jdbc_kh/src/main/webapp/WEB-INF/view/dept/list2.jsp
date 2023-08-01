 <%@page import="java.util.List"%>
<%@page import="kh.test.jdbckh.department.model.dto.DepartmentDto"%>
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
	<div>
	<form action="<%=request.getContextPath()%>/dept/list" method="get">
	<input type="search" name="searchWord">
	<input type="submit" value="찾기">
	</form>
	</div>
	<%
	List<DepartmentDto> volist= (List<DepartmentDto>)request.getAttribute("deptList");	
		String searchWord =(String)request.getAttribute("searchWord");
		if(searchWord !=null) {
	%>
	<h3><%=searchWord%> 검색결과</h3>
	<h3><a href="<%=request.getContextPath()%>/dept/list">전체보기</a></h3>
	<%
	}
		
		if(volist.size() == 0) {
	%>
		<h2>결과물이 없습니다</h2>
		<%
		}else {
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
				DepartmentDto vo = volist.get(i);
			%>
	
		<tr>
		<td><a href="<%=request.getContextPath() %>/dept/get?departmentNo=<%=vo.getDepartmentNo() %>"><%= vo.getDepartmentNo() %></a></td>
		<td><%=vo.getDepartmentName() %></td>
		<td><%=vo.getCategory() %></td>
		<td><%=vo.getOpenYn() %></td>
		<td><%=vo.getCapacity() %></td>
		</tr>
		
		<%
		}  //for
		%>
		
	</table>
	<div>
	<%
	for(int i=1;i<=10;i++){
		
	%>
		<a href="<%=request.getContextPath()%>/dept/list?pageNo=<%=i%>"><span><%=i%></span></a>
	<%
	}  // for
	%>
	</div>
	<%
	}  //else
	%>
</body>
</html> 