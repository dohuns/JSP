<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.num}</title>
</head>
<body>
	<jsp:useBean id="boardDao" class="board.BoardDAO" />
	<jsp:useBean id="boardDto" class="board.BoardDTO" />
	<jsp:setProperty property="*" name="boardDto"/>
	${boardDao.update(boardDto, param.num)}
	<c:redirect url="content.jsp?b_num=${param.num}" />
</body>
</html>