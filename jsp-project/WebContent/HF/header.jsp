<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		  <li role="presentation"><a href="/jsp-report/report-member/memberList.jsp">회원 정보</a></li>
		  <%if(session.getAttribute("sessionId") == null) { %>
		  	<li role="presentation"><a href="/jsp-report/report-member/index.jsp">로그인</a></li>
		  <%} else { %>
		  	<li role="presentation"><a href="/jsp-report/report-member/logout.jsp">로그아웃</a></li>
		  <%} %>
		</ul>
	</div>

</body>
</html>