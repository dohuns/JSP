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
	<c:set var="check" value="${dao.chkId(param.u_id)}"/>
	
	<c:choose>
		<c:when test="${check}">
			사용 가능~
			<script>
				alert("사용가능!");
			</script>
		</c:when>
		<c:otherwise>
			중복 검사를 해주세요
			<script>
				alert("중복!!")
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>