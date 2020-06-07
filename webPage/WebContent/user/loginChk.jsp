<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginChk</title>
</head>
<body>
	<jsp:useBean id="userDao" class="user.UserDAO" />
	<jsp:useBean id="userDto" class="user.UserDTO" />
	<c:set var="userList" value="${userDao.uList(param.u_id)}" />
	<c:choose>
		<c:when test="${userList.size() != 0}">
			<c:forEach var="user" items="${userList}">
				<c:choose>
					<c:when test="${user.u_pw == param.u_pw}">
						<c:set var="s_id" value="${user.u_id}" scope="session" />
						<c:set var="s_nick" value="${user.u_nick}" scope="session" />
						<script>
							alert("로그인 성공!");
							location.href="/webPage/hf/main.jsp";
						</script>
					</c:when>
					<c:otherwise>
						<script>
							alert("비밀번호가 일치하지 않습니다.");
							history.back();
						</script>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:when>
		<c:when test="${userList.size() == 0}">
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