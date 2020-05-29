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
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	<c:set var="dto" value="${dao.chkLogin(param.id)}"/>
		
	<c:choose>
		<c:when test="${dto == null}">
			<script>
				alert("등록되지 않은 아이디 입니다.")
				location.href="login.jsp"
			</script>
		</c:when>
		<c:when test="${dto.getPwd() != param.pwd }">
			<script>
				alert("비밀번호가 일치하지 않습니다.")
				location.href="login.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<c:set var="sessionId" value="${param.id }" scope="session"/>
			<script>
				alert("로그인 공성~")
				location.href="memberInfo.jsp"
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>