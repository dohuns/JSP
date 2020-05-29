<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Privacy</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<c:if test="${sessionScope.id eq null}">
		<script type="text/javascript">
			alert("로그인을 해주세요")
			location.href = "Login.jsp"
		</script>
	</c:if>
	<jsp:useBean id="dao" class="Mem.MemDAO" />
	<c:set var="dto" value="${ dao.chkUser(sessionScope.id) }" />
	<c:choose>
		<c:when test="${sessionScope.id eq param.id }">
			아이디 : ${dto.id }<br>
			비밀번호 : ${dto.pw }<br>
			이름 : ${dto.name }<br>
			부서 : ${dto.dep }<br>
			직급 : ${dto.rank }<br>
			<button type="button" onclick="location.href='Profile.jsp'">회원 목록</button>
			<button type="button" onclick="location.href='logout.jsp'">로그아웃</button>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				location.href = "Profile.jsp"
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>