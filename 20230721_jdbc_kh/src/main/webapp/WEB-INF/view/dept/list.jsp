<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과 리스트</title>
</head>
<body>
	<h2>학과 리스트</h2>
	<div>
		<form action="<%=request.getContextPath() %>/dept/get" method="get">
			학과 번호 : <input type="text" name="departmentNo"><br>
			<input type="submit" value="찾기">
		</form>
	</div>
<c:choose>
<c:when test="${empty deptList }">
	<h2>학과번호가 없습니다.</h2>
</c:when>
<c:otherwise>
	<table border="1">
		<tr>
			<td>학과번호</td>
			<td>학과이름</td>
			<td>계열</td>
			<td>개설여부</td>
			<td>정원</td>
		</tr>
	<c:forEach items="${deptList }" var="vo">
		<tr>
			<td>${vo.departmentNo }</td>
			<td>${vo.departmentName }</td>
			<td>${vo.category }</td>
			<td>${vo.openYn }</td>
			<td>${vo.capacity }</td>
		</tr>
	</c:forEach>
	</table>
</c:otherwise>
</c:choose>

</body>











































<%-- <%@page import="java.util.List"%>
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
	<form action="<%=request.getContextPath()%>/department/list" method="get">
	<input type="search" name="searchWord">
	<input type="submit" value="찾기">
	</form>
	</div>
	<%
	List<DepartmentDto> volist= (List<DepartmentDto>)request.getAttribute("departmentList");	
		String searchWord =(String)request.getAttribute("searchWord");
		if(searchWord !=null) {
	%>
	<h3><%=searchWord%> 검색결과</h3>
	<h3><a href="<%=request.getContextPath()%>/department/list">전체보기</a></h3>
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
		<td><a href="<%=request.getContextPath() %>/department/get?sno=<%=vo.getDepartment_No() %>"><%= vo.getDepartment_No() %></a></td>
		<td><%=vo.getDepartment_Name() %></td>
		<td><%=vo.getCategory() %></td>
		<td><%=vo.getOpen_Yn() %></td>
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
		<a href="<%=request.getContextPath()%>/department/list?pageNo=<%=i%>"><span><%=i%></span></a>
		,
	<%
	}  // for
	%>
	</div>
	<%
	}  //else
	%>
</body>
</html> --%>