
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
	<jsp:include page="../quiz-default/header.jsp"/>
	
	<div class="container">
		<form class="form-signin" action="chkLogin.jsp" style="max-width:300px; margin:0 auto">
			<h1> 로그인 페이지 </h1>
			<input type="text" class="form-control" name="id" placeholder="아이디"><br> 
			<input type="password" class="form-control" name="pwd" placeholder="비밀번호"><br>
			<button type="submit" class="btn btn-info ">로그인</button>
			<button type="button" class="btn btn-info " onclick="location.href='register.jsp'">회원가입</button>
		</form>
	</div>
	
	<jsp:include page="../quiz-default/footer.jsp"/>

</body>
</html>