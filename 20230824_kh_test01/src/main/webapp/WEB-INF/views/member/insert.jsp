<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버등록</title>
</head>
<body>
	<form action="${pageContext.request.contextPath }/member/insert" method="post">
	이름: <input type="text" name="mname"><br>
	비밀번호: <input type="password" name="mpwd"><br>
	<input type="submit" value="등록">
	</form>
</body>
</html>