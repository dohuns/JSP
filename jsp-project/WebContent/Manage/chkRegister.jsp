<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="user.userDAO"/>
	<jsp:useBean id="vo" class="user.userVO"/>
	
	<jsp:setProperty property="*" name="vo"/>
	
	<c:set var="flag" value="${dao.chkRegist(vo)}"/>
	
	<c:choose>
		<c:when test="${flag}">
			<script>
				alert("회원가입 성공~");
				location.href="login.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("회원가입 실패!!!");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
	
	
</body>
</html>