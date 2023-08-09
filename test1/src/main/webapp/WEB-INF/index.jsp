<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>


<<header style= " position: fixed ; top: 0px ; width: 100% ; height: 40px " ;
background-color: blue ; color : white; text-align: center ; line-height: 40px
font-size: 30px "> 쇼핑몰 회원관리 version 1.0 ver</header>

<nav>
	<div><a href="<%=request.getContextPath() %>/member/insert">회원등록</a>
	
	<a href="<%=request.getContextPath() %>/member/modify">회원목록조회/수정</a>
	
	<a href="<%=request.getContextPath() %>/member/money">회원매출조회</a>
	
	<a href="<%=request.getContextPath() %>/member/index">홈으로</a></div>
</nav>
		<section>
		<ol>
			<p>쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>
			프로그램 작성 순서</p>
			<li>회원정보 테이블을 생성한다.</li>
			<li> 매출정보 테이블을 생성한다.</li>
			<li> 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
			<li> 회원정보 입력 화면프로그램을 작성한다.</li>
			<li> 회원정보 조회 프로그램을 작성한다.</li>
			<li> 회원매출정보 조회 프로그램을 작성한다.</li>
		</ol>	
		</section>
	
	<footer>
		<center>Mollang 20.08.29 ver1.0</center>	
	</footer> 
</body>
</html>