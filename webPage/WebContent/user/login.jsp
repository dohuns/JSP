<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<form action="loginChk.jsp">
		아이디	<input type="text" name="id">
		비밀번호	<input type="password" name="pw">
		<button type="submit">로그인</button>
		<button type="button" onclick="location.href='register.jsp'">회원가입</button>
		<a href="#">아이디/비밀번호 찾기</a>
	</form>
</body>
</html>