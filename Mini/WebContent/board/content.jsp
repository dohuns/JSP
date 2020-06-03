<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<style>
table {
	width: 900px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 8px;
	padding-left: 20px;
}

.t {
	text-align: center;
}
</style>
</head>
<body>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:include page="../default/header.jsp"/>
	<jsp:useBean id="dao" class="Board.BoardDAO"/>
	${dao.upRN(param.b_num) }
	<c:set var="dto" value="${dao.content(param.b_num) }"/>
	<div align="center">
			<table>
			<p>
			<caption>
				<font size="6">게시글</font>
			</caption>
				<tr>
					<td style="font-size: 30px;">${dto.b_title }</td>
				</tr>
				<tr> <td>작성일 : ${dto.b_date }&nbsp;&nbsp;&nbsp;작성자 : ${dto.b_nick }&nbsp;&nbsp;&nbsp;조회수 : ${dto.b_readNum }</td> </tr>
				<tr>
					<td height="300px;">${dto.b_content }</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onclick="location.href='content_modify.jsp?b_num=${dto.b_num}'">수정</button>&nbsp;&nbsp;
						<button type="button" onclick="location.href='boardMain.jsp'">목록보기</button>&nbsp;&nbsp;
						<button type="button" onclick="location.href='delete.jsp?b_num=${dto.b_num}'">삭제</button>&nbsp;&nbsp;
					</td>
				</tr>
			</p>
			</table>
	</div>
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>