<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<c:if test="${sessionScope.id eq null}">
		<script type="text/javascript">
			alert("로그인을 해주세요")
			location.href = "Login.jsp"
		</script>
	</c:if>
	<h3>메인 페이지</h3>
	<button type="button" onclick="location.href='Profile.jsp'">회원 목록</button>
	<button type="button" onclick="location.href='logout.jsp'">로그아웃</button>
</body>
</html>