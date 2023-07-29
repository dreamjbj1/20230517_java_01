<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>게시판 템플릿</title>
   <link rel="stylesheet" href="board.css">
    
   <style>
 body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

ul {
  list-style: none;
}

.search-container {
    display: flex;
    justify-content: center;
    margin: 50px 0px 50px;
}

.search-form {
    display: flex;
    border: 1px solid #ccc;
    border-radius: 20px; /* 검색창을 둥글게 꾸밉니다. */
}

.search-form input[type="text"] {
    padding: 5px 10px;
    border: none;
    outline: none;
    border-radius: 20px; /* 검색창 입력창을 둥글게 꾸밉니다. */
}

.search-form button {
    padding: 5px 10px;
    border: none;
    background-color: #333;
    color: #fff;
    border-radius: 20px; /* 검색 버튼을 둥글게 꾸밉니다. */
    cursor: pointer;
}

.board-table {
    width: 100%;
    border-collapse: collapse;
}

.board-table th, .board-table td {
    border: 1px solid #ccc;
    padding: 10px;
}

.board-table th {
    background-color: #f2f2f2;
}

.board-table img {
    max-width: 100px;
    max-height: 100px;
}

.pagination {
    display: flex; /* 페이징 처리 버튼을 가로로 나열합니다. */
    justify-content: center;
    margin-top: 10px;
}

.prev-btn, .next-btn, .page-numbers {
    padding: 5px 10px;
    margin: 0 2px;
    border: 1px solid #ccc;
    cursor: pointer;
}

.prev-btn:hover, .next-btn:hover, .page-numbers:hover {
    background-color: #f2f2f2;
}

button {
    background-color: #333;
    color: #fff;
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    transition: background-color 0.2s;
    margin: auto;
}

button:hover {
    background-color: #0056b3;
}


    </style>
   
</head>

<body>
   <c:import url="/WEB-INF/view/rayout/hearder.jsp" />

    <main style="
    width: 80%;
    margin: 150px auto 80px;">
    
         <div class="search-container">
         	
            <form class="search-form" action="<%=request.getContextPath() %>/Board" method="get">
                <input type="text" name="searchWord" placeholder="검색어를 입력하세요">
               <button type="submit">검색</button>
            </form>
        </div>

        <table class="board-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>본문</th>
                    <th>조회수</th>
                    <th>등록일</th>
                    <th>수정일</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
            
            <c:forEach items="${BoardMainList }" var = "dto">
                <tr>
                    <td style="text-align:center;">${dto.board_id}</td>
                    <td>${dto.title}</td>
                    <td>${dto.content}</td>
                    <td>${dto.readCount}</td>
                    <td>${dto.registerDate}</td>
                    <td>${dto.modifyDate}</td>
                   
                    <td style="text-align:center;"><a href = "<%=request.getContextPath() %>/Board/update?board_id=${dto.board_id}">수정</a></td>
                    <td style="text-align:center;">
                    <form action ="<%=request.getContextPath() %>/Board/delete" method = "post">
                    	<input type="hidden" value = "${dto.board_id}" name="board_id"/>
                     <button type="submit">삭제</button>
                    </form>
                    </td>
                    
                </tr>
                </c:forEach> 
               
            </tbody>
        </table>
        
        
   
        
        
    </main>
    
      <ul class="pagination">
          <!-- 이전 출력 시작 -->
      <c:if test="${pv.startPage>1}">
         <li class = "page-item">
            <a class = "prev-btn" href = "<%=request.getContextPath() %>/Board?currentPage=${pv.startPage-pv.blockPage}&searchWord=${pv.searchWord}">Prev</a>
         </li>
      </c:if>
      <!-- 이전 출력 끝 -->
   
      <!-- 페이지 출력 시작 -->
      <c:forEach var = "i" begin = "${pv.startPage}" end = "${pv.endPage}">
         <li>
            <c:choose>
               <c:when test="${i==pv.currentPage}">
                  <a class = "page-numbers" href = "<%=request.getContextPath() %>/Board?currentPage=${i}&searchWord=${pv.searchWord}">${i}</a>
               </c:when>
               <c:otherwise>
                  <a class = "page-numbers" href = "<%=request.getContextPath() %>/Board?currentPage=${i}&searchWord=${pv.searchWord}">${i}</a>
               </c:otherwise>
            </c:choose>
         </li>
      </c:forEach>
      <!-- 페이지 출력 끝 -->
      
      <!-- 다음 출력 시작 -->
      <c:if test = "${pv.endPage<pv.totalPage}">
         <li>
            <a class = "next-btn" href = "<%=request.getContextPath() %>/Board?currentPage=${pv.startPage+pv.blockPage}&searchWord=${pv.searchWord}">Next</a>
         </li>
      </c:if>
      <!-- 다음 출력 끝 -->
   </ul>


<c:import url="/WEB-INF/view/rayout/footer.jsp" />


</body>

</body>
</html>