<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.j"></script>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<fmt:requestEncoding value="UTF-8"/>
	
	<jsp:include page="../report-default/header.jsp"/>
	
	<c:choose>
	<c:when test="${sessionScope.sessionId  == null}">
	<div align="center">
		<h1>로그인 페이지</h1>
	</div>
	<br>
	<div align="center">
		<form action="chkLogin.jsp"  style="margin:0 auto;max-width:500px">
		<table>
			<tr>
				<td> 아이디 </td>
				<td>
					<input type="text" name="id" placeholder="아이디" class="form-control">
				</td>
			</tr>
			<tr>
				<td> <br>비밀번호 &nbsp;</td>
				<td>
					 <br><input type="password" name="pwd" placeholder="비밀번호" class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<br>
					<input type="submit" value="로그인" class="btn btn-info">
					<a href="register.jsp" class="btn btn-info">회원가입</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
	</c:when>
	<c:otherwise>
		<h1> ${sessionId}계정으로 로그인 중 입니다.</h1>
	</c:otherwise>
	
	</c:choose>
	<jsp:include page="../report-default/footer.jsp"/>

</body>
</html>