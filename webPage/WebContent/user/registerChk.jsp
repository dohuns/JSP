<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerChk</title>
</head>
<body>
	<jsp:useBean id="dao" class="user.UserDAO" />
	<jsp:useBean id="dto" class="user.UserDTO" />
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="idResult" value="${dao.idChk(dto.u_id)}"/>

	<c:choose>
		<c:when test="${idResult == -1}">
			<script>
				alert("오류가 발생하였습니다. 관리자에게 문의바랍니다.");
				history.back();
			</script>
		</c:when>
		<c:when test="${idResult == 1}">
			<script>
				alert("이미 존재하는 아이디입니다.");
				history.back();
			</script>
		</c:when>
		<c:when test="${idResult == 0}">
			<c:set var="joinResult" value="${dao.registerChk(dto)}" />
			<c:choose>
				<c:when test="${joinResult > 0}">
					<script>
						alert("회원가입이 완료되었습니다.");
						location.href="/webPage/user/login.jsp";
					</script>
				</c:when>
				<c:otherwise>
					<script>
						alert("오류가 발생하였습니다.");
						history.back();
					</script>
				</c:otherwise>
			</c:choose>
		</c:when>
	</c:choose>
</body>
</html>