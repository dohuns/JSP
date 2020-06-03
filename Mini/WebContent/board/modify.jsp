<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="Board.BoardDAO"/>
	<jsp:useBean id="dto" class="Board.BoardDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	${dao.modify(dto) }
	<c:redirect url="boardMain.jsp"/>
</body>
</html>