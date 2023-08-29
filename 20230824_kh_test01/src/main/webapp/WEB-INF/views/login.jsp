<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<div>
	<h2>로그인</h2>
	
	<!-- Spring Security 적용시 post 방식에서 (form, ajax 적용해야함)
	 	csrf 공격을 막기위해서 hiddent 태그로 보내줌. token 값 전달해야 403 오류 발생안함  -->
	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }">
</div>
</body>
</html>