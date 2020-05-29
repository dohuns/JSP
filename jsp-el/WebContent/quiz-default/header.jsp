<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>

	<div style="text-align:center">
		<h1 style="color:skyblue"> CARE LAB</h1>	 	
	 </div>
	<div style="text-align:center">
		<ul class="nav nav-tabs">
		  <li role="presentation"><a href="/jsp-el/quiz-member/index.jsp">HOME</a></li>
		  <li role="presentation"><a href="/jsp-el/quiz-member/memberInfo.jsp">회원 정보</a></li>
		  <c:choose>
			<c:when test="${sessionScope.sessionId == null }">		  	
		  	<li role="presentation"><a href="/jsp-el/quiz-member/login.jsp">로그인</a></li>
		  	</c:when>
		  	<c:otherwise>
		  	<li role="presentation"><a href="/jsp-el/quiz-member/logout.jsp">로그아웃</a></li>
		  </c:otherwise>
		  </c:choose>
		</ul>
	</div>

</body>
</html>