<%@page import="test1.jdbckh.member.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>
<body>
	<h2>회원목록조회/수정</h2>

	<div class="container">
	<form action="<%=request.getContextPath() %>/member/modify.do" method="post">
		<table border="1">
			<tr>
				<th>회원번호(자동생성)</th>
				<td><input type="text" name="custNo" value="${mvo.custNo}" readonly></td>
			</tr>
				<tr>
				<th>회원성명</th>
				<td><input type="text" name="custName" value="${mvo.custName}"></td>
			</tr>
				<tr>
				<th>회원전화</th>
				<td><input type="text" name="phone"  value="${mvo.phone}"></td>
			</tr>
				<tr>
				<th>회원주소</th>
				<td><input type="text" name="address" value="${mvo.address}"></td>
			</tr>
			</tr>
				<tr>
				<th>가입일자</th>
				<td><input type="text" name="joinDate" value="${mvo.joinDate}"></td>
			</tr>
			<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade" value="${mvo.grade}"></td>
				</tr>
			</tr>
				<tr>
				<td>도시코드</td>
				<td><input type="text" name="city" value="${mvo.city}"></td>
			</tr>
		</table>
		
		<button type="submit">수정</button>
		<button type="button">조회</button>
	</form>
	</div>
	
</body>
<script>
	function Check(){
		alert("회원정보수정이 완료되었습니다.");
		return true;
	}
	
	function moveList(){
		location.href="list.jsp";
	}
</script>
</html>