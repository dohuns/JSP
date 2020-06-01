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
	<c:set var="flag" value="${dao.ckhLogin(param.u_id)}"/>
	
	<c:choose>
		<c:when test="${flag.u_pw != null}">
			<c:choose>
				<c:when test="${flag.u_pw == param.u_pw}">
					<c:set var="sessionId" value="${param.u_id}" scope="session"/>
					<c:set var="sessionNick" value="${flag.u_nick}" scope="session"/>
					<script>
						alert("로그인 성공~");
						location.href="../board/boardMain.jsp";
					</script>
				</c:when>
				<c:otherwise>
					<script>
						alert("비밀번호가 다릅니다!!!");
						history.back();
					</script>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<script>
				alert("아이디가 존재하지 않습니다!!!");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>