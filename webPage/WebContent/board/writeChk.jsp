<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeChk.jsp</title>
</head>
<body>
	<jsp:useBean id="boardDao" class="board.BoardDAO" />
	<jsp:useBean id="boardDto" class="board.BoardDTO" />
	<jsp:setProperty property="*" name="boardDto"/>
	<c:set var="result" value="${boardDao.write(boardDto)}" />
	<c:redirect url="list.jsp" />
</body>
</html>