<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:include page="../default/header.jsp"/>
	<form action="chkUser.jsp" method="post">
		<div align="center">
			<h2>로그인 페이지</h2>
			<table>
				<tr>
					<td><input type="text" name="u_id" placeholder=" 아이디"></td>
					<td rowspan="2"><button type="submit" style="height: 50px;">로그인</button></td>
				</tr>
				<tr>
					<td><input type="password" name="u_pw" placeholder=" 비밀번호"></td>
				</tr>
				<tr>
					<td><button type="button"
							onclick="location.href='../member/member.jsp'">회원가입</button></td>
				</tr>
			<tr style="height: 100px;">
			<td></td>
			</tr>
			</table>
		</div>
	</form>
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>