<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 정보 조회(회원 번호 검색)</h2>
	<form action="<%=request.getContextPath() %>/selectUser">
	<%-- <form action="${pageContext.request.contextPath}/selectUser" method="get"> --%>
	<input type="text" name="userNo" placeholder="회원번호입력1">
	<input type="submit" value="조회1">	
	</form>
</body>
</html>