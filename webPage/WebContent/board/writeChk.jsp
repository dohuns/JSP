<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeChk</title>
</head>
<body>
	<fmt:requestEncoding value="UTF-8" />
	<jsp:useBean id="boardDao" class="board.BoardDAO" />
	<jsp:useBean id="boardDto" class="board.BoardDTO" />
	<jsp:setProperty property="*" name="boardDto"/>
	<c:set var="chk" value="${boardDao.writeChk(boardDto)}" />
	<c:choose>
		<c:when test="${chk > 0}">
			<c:redirect url="list.jsp" />
		</c:when>
		<c:otherwise>
			<script>
				alert("오류가 발생하였습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>