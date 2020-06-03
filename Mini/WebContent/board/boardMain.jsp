<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<style>
table {
	width: 900px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 8px;
}

.t {
	text-align: center;
}
</style>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:include page="../default/header.jsp" />
	<jsp:useBean id="dao" class="Board.BoardDAO" />

	<c:choose>
		<c:when test="${param.start == null }">
			<c:set var="start" value="1" />
		</c:when>
		<c:otherwise>
			<c:set var="start" value="${param.start }" />
		</c:otherwise>
	</c:choose>

	<div align="center">
		<p>
		<table>
			<caption>
				<font size="6">전체 게시판</font>
			</caption>
			<tr>
				<th width="20px;">no</th>
				<th width="80px;">카테고리</th>
				<th>제목</th>
				<th width="100px;">작성자</th>
				<th width="100px;">작성일</th>
				<th width="75px;">조회수</th>
			</tr>
			<c:choose>
			<c:when test="${not empty dao.mainList(start)}">
			<c:forEach items="${dao.mainList(start)}" var="dto">
				<tr>
					<td class="t">${dto.b_num }</td>
					<td class="t">${dto.b_category }</td>
					<td><a href="content.jsp?b_num=${dto.b_num }">${dto.b_title }</a></td>
					<td class="t">${dto.b_nick }</td>
					<td class="t">${dto.b_date }</td>
					<td class="t">${dto.b_readNum }</td>
				</tr>
			</c:forEach>
			<td colspan="5" align="center">
					<c:forEach begin="1" end="${dao.getTotalPageM() / 5 + 1 }" step="1" var="page">
					<a href="boardMain.jsp?start=${page}">[${page}]</a>
					</c:forEach>
				</td>
				<td align="right">
					<button type="button" onclick="location.href='write_view.jsp'">글작성</button>
				</td>
			</c:when>
			<c:otherwise>
			<tr>
				<th colspan="6" align="center">
					<h3>등록된 게시글이 없습니다.</h3>
				</th>
			</tr>
			<tr>
				<td colspan="6" align="right">
					<button type="button" onclick="location.href='write_view.jsp'">글작성</button>
				</td>
			</tr>
			</c:otherwise>
			</c:choose>
		</table>
		</p>
	</div>
	<jsp:include page="../default/footer.jsp" />
</body>
</html>