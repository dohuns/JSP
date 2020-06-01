<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
<!-- 		<meta name="viewport" content="width=device-width", initial-scale="1"> -->
<!-- 		<link rel="stylesheet" href="css/bootstrap.css"> -->
		<title>전체 글 목록 게시판</title>
	</head>
<body>
	<fmt:requestEncoding value="UTF-8" />
	<!-- boardDAO 객체 생성 후 list 메서드를 실행하여 거기서 받아온 값을 daoList에 저장합니다. -->
	<jsp:useBean id="boardDao" class="board.BoardDAO" />
	<c:set var="daoList" value="${boardDao.list()}" />
	<table border="1">
		<tr>
			<td colspan="5">
				<button type="button" onclick="location.href='write.jsp'">글 작성</button>
			</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<!-- 받아온 값이 존재하는 경우 그 값을 출력하며, 값이 존재하지 않는 경우 등록된 글이 없다는 메시지를 출력합니다. -->
		<c:choose>
			<c:when test="${daoList.size() != 0}">
				<c:forEach var="dao" items="${daoList}">
				<tr>
					<td>${dao.b_num}</td>
					<td>${dao.b_title}</td>
					<td>${dao.b_nick}</td>
					<td>${dao.b_date}</td>
					<td>${dao.b_readNum}</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>