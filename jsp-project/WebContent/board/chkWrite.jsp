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
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<fmt:requestEncoding value="UTF-8"/>
	<jsp:useBean id="dao" class="board.boardDAO"/>
	<jsp:useBean id="vo" class="board.boardVO"/>
	
	<jsp:setProperty property="*" name="vo"/>
		
	
	<c:set var="flag" value="${dao.boardWrite(vo)}"/>
	<script>
		location.href="boardList.jsp?b_category=${param.b_category}"
	</script>
		

</body>
</html>