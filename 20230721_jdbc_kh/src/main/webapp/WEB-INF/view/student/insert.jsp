<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 등록</title>
</head>
<body>
	<h2>학생 등록</h2>
	<div class="container">
	<form action="<%=request.getContextPath() %>/student/insert.do" method="post">
		<table>
			<tr>
				<th>학생번호</th>
				<td><input type="text" name="studentNo"></td>
			</tr>
				<tr>
				<th>학과명(학과번호)</th>
				<td><input type="text" name="departmentNo"></td>
			</tr>
				<tr>
				<th>studentName</th>
				<td><input type="text" name="studentName"></td>
			</tr>
				<tr>
				<th>studentSsn</th>
				<td><input type="text" name="studentSsn"></td>
			</tr>
			</tr>
				<tr>
				<th>studentAddress</th>
				<td><input type="text" name="studentAddress"></td>
			</tr>
			<tr>
					<th>entranceDate yyyy-mm-dd</th>
					<td><input type="text" name="entranceDate"></td>
				</tr>
			</tr>
				<tr>
				<td>absenceYn</td>
				<td><input type="text" name="absenceYn"></td>
			</tr>
			</tr>
				<tr>
				<td>coachProfessorNo</td>
				<td><input type="text" name="coachProfessorNo"></td>
			</tr>
		</table>
		
		<button type="submit">학생등록</button>
	</form>
	</div>

</body>
<script>
	function inputCheck(){
		if(document.frm.custname.value.length == 0){
			alert("회원성명이 입력되지 않았습니다.");
			document.frm.custname.focus();
			return false;
		}
		if(document.frm.phone.value.length == 0){
			alert("회원전화가 입력되지 않았습니다.");
			document.frm.phone.focus();
			return false;
		}
		if(document.frm.address.value.length == 0){
			alert("회원주소가 입력되지 않았습니다.");
			document.frm.address.focus();
			return false;
		}
		if(document.frm.joindate.value.length == 0){
			alert("가입일자가 입력되지 않았습니다.");
			document.frm.joindate.focus();
			return false;
		}
		if(document.frm.grade.value.length == 0){
			alert("고객등급이 입력되지 않았습니다.");
			document.frm.grade.focus();
			return false;
		}
		if(document.frm.city.value.length == 0){
			alert("도시코드가 입력되지 않았습니다.");
			document.frm.city.focus();
			return false;
		}
		alert("회원등록이 완료되었습니다!!");
		return true;
	}
	
	function moveList(){
		location.href = "memberList.jsp";
	}
</script>	
</html>