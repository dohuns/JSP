<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content_modify</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="Board.BoardDAO"/>
	<c:set var="dto" value="${dao.content(param.b_num) }"/>
	<c:choose>
		<c:when test="${sessionScope.u_id ne dto.b_id }">
			<script type="text/javascript">
				alert("작성자가 아닙니다")
	// 			location.href="../login/login.jsp"
			location.href="javascript:history.back()"
			</script>
		</c:when>
		<c:otherwise>
			<jsp:include page="../default/header.jsp"/>
				<div align="center">
					<form action="modify.jsp" method="post">
					<table border="1">
					<input type="hidden" name="b_num" value="${dto.b_num }">
						<tr> <td>글번호</td><td>${dto.b_num }</td> </tr>
						<tr> <td>조회수</td><td>${dto.b_readNum }</td> </tr>
						<tr>
							<td>작성자</td>
							<td>${dto.b_nick }</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input value="${dto.b_title }" type="text" name="b_title" size="50"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="b_content" rows="10" cols="50">${dto.b_content }</textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="완료">
								<input type="button" onclick="history.back()" value="취소">
								<button type="button" onclick="location.href='boardMain.jsp'">목록보기</button>&nbsp;&nbsp;
								<button type="button" onclick="location.href='delete.jsp?b_num=${dto.b_num}'">삭제</button>&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</form>
			</div>
			<jsp:include page="../default/footer.jsp"/>
		</c:otherwise>
	</c:choose>
	${sessionScope.u_id}
	${dto.b_id }
	${sessionScope.u_id ne dto.b_id }
</body>
</html>