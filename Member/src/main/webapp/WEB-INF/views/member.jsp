<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>
<body>
<h2 class="header">회원가입</h2>

<form action="${pageContext.request.contextPath }/join" method="post" class="joinup">
	<div class="flex">
	<div class="textfield">아이디</div>
	<input type="text" name="loginId">
	
	<button type="button" class="id_check" name="id_check">중복 체크</button>
	
	</div>



</form>

<script>

$('.id_check').click(function(){
	if($('input[name="loginId"]').val().length ==0){
		alert("아이디를 입력하세요.");
		return;
		
	}
	$.ajax({		
		url:"${pageContext.request.contextPath}/member/idChk",
		type:"POST",
		data:{
				loginId: $('input[name="loginId"]').val()
				
		},
		success: function(result){
			console.log("success");
			if(result ==='Yes'){
				//중복한 아이디가 없을시 처리
				$('#id_message').text('사용가능한 아이디입니다.');
				alert($('#id_message').text());
			}else{
				//중복된 아이디가 있을시 처리
				$('#id_message').text('이미 사용중인 아이디 입니다.');
				alert($('#id_message').text());
			}
		}
	});	
	
});
		





</script>



</body>
</html>