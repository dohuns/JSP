<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginChk</title>
</head>
<body>
	<fmt:requestEncoding value="UTF-8" />
	<jsp:useBean id="userDao" class="user.UserDAO" />
	<c:set var="chk" value="${userDao.loginChk(param.id, param.pw)}" />
	<c:choose>
		<c:when test="${chk == 2}">
			<c:set var="s_id" value="${param.u_id}" scope="session" />
			<c:redirect url="/webPage/default/index.jsp" />
		</c:when>
		<c:when test="${chk == 1}">
			<script>
				alert("비밀번호가 일치하지 않습니다.");
				history.back();
			</script>
		</c:when>
		<c:when test="${chk == 0}">
			<script>
				alert("아이디가 일치하지 않습니다.");
				history.back();
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("오류가 발생하였습니다.\n관리자에게 문의바랍니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>