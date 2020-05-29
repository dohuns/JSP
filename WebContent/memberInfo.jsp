<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="dao" class="Mem.MemDAO" />
	<jsp:useBean id="dto" class="Mem.MemDTO" />
	<jsp:setProperty property="*" name="dto" />
	<c:set var="dto1" value="${dao.chkUser(param.id) }" />
	<c:choose>
		<c:when test="${dto1.id eq param.id }">
			<script type="text/javascript">
			alert("아이디가 중복되었습니다")
			location.href="javascript:history.back()"
 			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
			alert("회원가입을 축하합니다")
			location.href="Login.jsp"
 			</script>
			${dao.add(dto) }
		</c:otherwise>
	</c:choose>
</body>
</html>