<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    background-color: #f0f0f0;
}

.container {
    max-width: 600px;
    margin: 150px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   
}

h1 {
    text-align: center;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"],
textarea,
select {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 3px;
    margin-left: -8px;
}

textarea {
    resize: vertical;
}

button {
    background-color: #333;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.2s;
}

button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>


<!-- header.jsp를 포함합니다. -->
<c:import url="/WEB-INF/view/rayout/hearder.jsp" />

<main>
   <div class="container">
        <h1>게시글 수정</h1>
        <form action="<%=request.getContextPath() %>/Board/update" method="post">
        
        
       		 <div class="form-group">
                <label for="title">글쓴이 이름</label>
                <input type="text" id="title" name="user_id" value = "${OneBoard.user_id}" required readOnly>
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="title" value = "${OneBoard.title}" required>
            </div>
            <div class="form-group">
                <label for="content">본문</label>
                <textarea id="content" name="content" rows="6"  required>${OneBoard.content}</textarea>
            </div>
            <input type="hidden" name="board_id" value ="${OneBoard.board_id}">
            <button type="submit">글 수정</button>
        </form>
        </div>
        
</main>

<!-- footer.jsp를 포함합니다. -->
<c:import url="/WEB-INF/view/rayout/footer.jsp" />

</body>
</html>