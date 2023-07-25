<%@page import="kh.test.jdbckh.student.model.vo.StudentVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생리스트</title>
</head>
<body>
	<h2>학생 리스트</h2>
 	<div>	
	<form action="<%=request.getContextPath() %>/student/list" method="get">
	<input type="search" name="searchWord">
	<input type="submit" value="찾기">
	</form>
	</div>  
	<%
	// JSP Tag - java문법
	List<StudentVo> volist= (List<StudentVo>)request.getAttribute("studentList");	
	String searchWord= (String)request.getAttribute("searchWord");	
	if(searchWord != null){
		%>
		<h3><%=searchWord %> 검색결과</h3>
		<h3><a href="<%=request.getContextPath() %>/student/list">전체보기</a></h3>
		<% 
	}
/* 	if( volist.size() == 0 || volist == null) { *//*  >> 이거 안된다 nullpointerexception이 뜬다 or 연산자 때문에 */
/* 	if(volist == null || volist.size() == 0){  >> 이건된다 */
	/* if(volist == null){ */
 	if(volist.size() == 0){ 
		%>
		<h2>결과물이 없습니다.</h2>
		<%
	}else {
	%>

	<table  border="1">
		<tr>
		<td>학번</td>
		<td>이름</td>
		<td>부서번호</td>
		<td>주민번호</td>
		<td>주소</td>
		<td>입학일</td>
		</tr>
		<%
		for(int i=0; i<volist.size(); i++) {
			StudentVo vo = volist.get(i);
		%>
		
		<tr>
			<td><a href="<%=request.getContextPath() %>/student/get?sno=<%=vo.getStudentNo() %>"><%=vo.getStudentNo() %></a></td>
			<td><%=vo.getStudentName() %></td>
			<td><%=vo.getDepartmentNo() %></td>
			<td><%=vo.getStudentSsn() %></td>
			<td><%=vo.getStudentAddress() %></td>
			<td><%=vo.getEntranceDate() %></td>			
		</tr>
		<%
		}  //for
		%>
		
		
		
	</table>
	<div>
	<%
	for(int i=1;i<=10;i++){
	%>
		<a href="<%=request.getContextPath()%>/student/list?pageNo=<%=i%>"><span><%=i%></span></a>
		,
	<%
	}  // for
	%>
	</div>
	<%
	}  //else
	%>
	
</body>
</html>