<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><a href="<%=request.getContextPath() %>/member/insert">회원등록</a>
	
	<a href="<%=request.getContextPath() %>/member/modify">회원목록조회/수정</a>
	
	<a href="<%=request.getContextPath() %>/member/money">회원매출조회</a>
	
	<a href="<%=request.getContextPath() %>/member/index">홈으로</a></div>
</body>
</html>