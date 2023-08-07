<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
	<h2>회원등록</h2>
		<div class="container">
	<form action="<%=request.getContextPath() %>/member/insert.do" method="post">
		<table border="1">
			<tr>
				<th>회원번호(자동생성)</th>
				<td><input type="text" name="CustNo"></td>
			</tr>
				<tr>
				<th>회원성명</th>
				<td><input type="text" name="CustName"></td>
			</tr>
				<tr>
				<th>회원전화</th>
				<td><input type="text" name="Phone"></td>
			</tr>
				<tr>
				<th>회원주소</th>
				<td><input type="text" name="Address"></td>
			</tr>
			</tr>
				<tr>
				<th>가입일자</th>
				<td><input type="text" name="JoinDate"></td>
			</tr>
			<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="Grade"></td>
				</tr>
			</tr>
				<tr>
				<td>도시코드</td>
				<td><input type="text" name="City"></td>
			</tr>
		</table>
		<button type="submit">등록</button>
		<button type="search">조회</button>
	</form>
	</div>
	
	
</body>
</html>