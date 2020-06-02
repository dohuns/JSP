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
		<h1 style="color:skyblue">초보 개발자 커뮤니티</h1>	 	
	 </div>
	<div style="text-align:center">
		<ul class="nav nav-tabs">
		<c:choose>
			<c:when test="${sessionScope.sessionId == null}">
		  		<li role="presentation"><a href="/jsp-project/Manage/login.jsp">로그인</a></li>
		 	 </c:when>
		 	 <c:otherwise>
			  	<li role="presentation"><a href="/jsp-project/Manage/logout.jsp">로그아웃</a></li>
		 	 </c:otherwise>
		  </c:choose>
		  	<li role="presentation"><a href="/jsp-project/board/boardList.jsp?b_category=전체">전체 게시판</a></li>
		  	<li role="presentation"><a href="/jsp-project/board/boardList.jsp?b_category=자유">자유 게시판</a></li>
		  	<li role="presentation"><a href="/jsp-project/board/boardList.jsp?b_category=유머">유머 게시판</a></li>
		  	<li role="presentation"><a href="/jsp-project/board/boardList.jsp?b_category=질문">질문 게시판</a></li>
		  	<li role="presentation"><a href="/jsp-project/board/boardList.jsp?b_category=팁">팁 게시판</a></li>
		</ul>
	</div>

</body>
</html>