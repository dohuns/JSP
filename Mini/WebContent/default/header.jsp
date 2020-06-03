<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
	body{margin: 0;}
	.a:link { color: white; text-decoration: none;}
	.a:visited { color: white; text-decoration: none;}
	.a:hover { text-decoration: none; background-color: white; color: black;}
	.class:link { color: white; text-decoration: none;}
	.class:visited { color: white; text-decoration: none;}
	.class:hover { text-decoration: none; background-color: white; color: black;}
	#header1{color:white; background-color: black; width: 100%; height: 30px; line-height: 30px; }
	#header2{color:white; background-color: black; width: 100%; height: 40px; display: flex; line-height: 40px; }
	.class{width: 100px;}
	.b:link { color: black; text-decoration: none;}
	.b:visited { color: black; text-decoration: none;}
</style>
</head>
<body>
<c:choose>
	<c:when test="${sessionScope.u_nick ne null}">
		<div align="center" id="header1" style="padding-right: 20px; " >
			<a href="../login/privacy.jsp" class="a"><div class="class" style="float: right;"><b>나의 정보</b></div></a>
			<a href="../login/logout.jsp" class="a"><div class="class" style="float: right;"><b>로그아웃</b></div></a>
		</div>
	</c:when>
	<c:otherwise>
		<div align="center" id="header1" style="padding-right: 20px; " >
			<a href="../login/login.jsp" class="a"><div class="class" style="float: right;"><b>로그인</b></div></a>
			<a href="../member/member.jsp" class="a"><div class="class" style="float: right;"><b>회원가입</b></div></a>
		</div>
	</c:otherwise>	
</c:choose>
	<div align="center">
		<div align="center" style="width: 600px;">
			<br>
			<a class="b" href="../default/main.jsp">
			<font size="15px;"><b>공부하는 사람들의 모임</b></font>
			</a>
			<p/>
		</div>
	</div>
	<div align="center" id="header2">
	&nbsp;&nbsp;
		<a href="../board/boardMain.jsp" class="a"><div class="class"><b>전체 게시판</b></div></a>
		<a href="../board/boardSub.jsp?b_category=자유" class="a"><div class="class"><b>자유 게시판</b></div></a>
		<a href="../board/boardSub.jsp?b_category=유머" class="a"><div class="class"><b>유머 게시판</b></div></a>
		<a href="../board/boardSub.jsp?b_category=질문" class="a"><div class="class"><b>질문 게시판</b></div></a>
		<a href="../board/boardSub.jsp?b_category=팁" class="a"><div class="class"><b>팁 게시판</b></div></a>
	</div>
</body>
</html>