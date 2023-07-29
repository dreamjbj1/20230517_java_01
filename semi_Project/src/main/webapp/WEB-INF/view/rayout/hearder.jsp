<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

ul {
    list-style: none;
}

header {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px 0;
    position: fixed; /* 헤더를 화면 위에 고정시킵니다. */
    top: 0; /* 헤더를 화면 상단에 붙입니다. */
    left: 0; /* 헤더를 화면 좌측에 붙입니다. */
    right: 0; /* 헤더를 화면 우측에 붙입니다. */
}

.header-content {
    padding-bottom: 10px; /* 헤더와 검색창 사이의 여백을 설정합니다. */
}

header h1 {
    margin: 0;
}

nav {
    display: flex;
    justify-content: center;
}

nav ul {
    list-style: none;
    padding: 0;
    display: flex; /* 네비게이션 바를 1줄로 만듭니다. */
}

nav li {
    margin: 0 10px;
}

nav a {
    text-decoration: none;
    color: #fff;
}
</style>

</head>
<body>

    
    
    <header>
        <h1>게시판</h1>
        <!-- 네비게이션 바를 1줄로 만듭니다. -->
        <nav>
            <ul>
            	<li><a href="<%=request.getContextPath() %>/Board">리스트 보기</a></li>
                <li><a href="<%=request.getContextPath() %>/Board/write">글쓰기</a></li>
                <li><a href="#">메뉴2</a></li>
                <li><a href="#">메뉴3</a></li>
            </ul>
        </nav>
    </header>
    
</body>
</html>