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
	<jsp:useBean id="dao" class="Mem.MemDAO" />
	<c:set var="dto" value="${dao.chkUser(param.id)}" />
	<c:choose>
		<c:when test="${ param.id eq dto.id && param.pw eq dto.pw }">
			<c:set var="id" value="${param.id }" scope="session"/>
			<script type="text/javascript">
				alert("${param.id}님 반갑습니다!!!");
				location.href = "main.jsp"
			</script>
		</c:when>
		<c:when test="${ param.id ne dto.id }">
			<script type="text/javascript">
				alert("등록되지 않은 아이디 입니다");
				location.href = "Login.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다");
				location.href = "Login.jsp"
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>