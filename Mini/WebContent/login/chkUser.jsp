<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chkUser</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="dao" class="User.UserDAO" />
	<c:set var="dto" value="${dao.chkUser(param.u_id)}" />
	<c:choose>
		<c:when test="${ param.u_id eq dto.u_id && param.u_pw eq dto.u_pw }">
			<c:set var="u_id" value="${dto.u_id }" scope="session"/>
			<c:set var="u_nick" value="${dto.u_nick }" scope="session"/>
			<script type="text/javascript">
				alert("${dto.u_nick}님 반갑습니다!!!");
				location.href = "../default/main.jsp"
			</script>
		</c:when>
		<c:when test="${ param.u_id ne dto.u_id }">
			<script type="text/javascript">
				alert("등록되지 않은 아이디 입니다");
				location.href = "login.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다");
				location.href = "login.jsp"
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>