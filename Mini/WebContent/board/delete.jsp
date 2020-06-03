<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="Board.BoardDAO"/>
	<c:set var="dto" value="${dao.content(param.b_num) }"/>
	<c:choose>
		<c:when test="${sessionScope.u_id eq dto.b_id }">
			${dao.delete(param.b_num) }
			<script type="text/javascript">
				alert("게시글이 삭제 되었습니다")	
				location.href="boardMain.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("작성자가 아닙니다")	
				location.href="javascript:history.back()"
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>