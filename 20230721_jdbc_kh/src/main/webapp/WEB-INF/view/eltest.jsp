<%@page import="kh.test.jdbckh.board.model.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL</title>
</head>
<body>

<h2>EL-ExpressionLanguage <br> -단점: java for/if/변수 사용 불가<br> 보완: jstl의 foreach/if/set변수 사용 </h2>
c:if는 true false 조건만 가능함 - else없음.
<c:if test="${not empty vo.studentSsn}">
<br>여기이렇게 보임. 1
</c:if>
<c:if test="${1==1}">
<br>여기이렇게보임. 2
</c:if>

<h4> else 쓰고 싶다면 choose - when/otherwise 사용해야함.</h4>
<c:choose>
	<c:when test="${1==1}">
	<br>여기이렇게 보임-when
	</c:when>
	<c:otherwise>
	<br>여기이렇게 보힘 - otherwise
	</c:otherwise>
</c:choose>
<br>

<c:forEach begin="3" end="9" step="2" var="i"> 
	${i},
</c:forEach>
<br>

<c:forEach items="${volist }" var="vo"> 
${vo}<hr>
</c:forEach>


<c:forEach items="${volist }" var="vo" varStatus="cnt">
 	${cnt.index}, ${cnt.count}, ${vo.bwriteDate}<br>
</c:forEach>






<hr>
<hr>
${a1 } : <%= request.getAttribute("a1") %> <br>
${a2 } : <%= request.getAttribute("a2") %> <br>
${volist } 
<hr> 
<%= request.getAttribute("volist") %> <br>
<% List<BoardDto> list = (List<BoardDto>)request.getAttribute("volist"); %>

${volist2 } 
<hr> 
<%= request.getAttribute("volist2") %> <br>
<% List<BoardDto> list2 = (List<BoardDto>)request.getAttribute("volist2"); %>
<%-- <%=list2.size() %> --%>
${volist2.size() }
<br>
${vo} 
<hr> 

	










</body>
</html>