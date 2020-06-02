<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
	<fmt:requestEncoding value="UTF-8"/>
	<jsp:include page="../HF/header.jsp"/>
	
	<jsp:useBean id="dao" class="board.boardDAO"/>
	
	<c:choose>
		<c:when test="${param.b_category == '전체'}">
			<c:set var="list" value="${dao.totalList()}"/>
		</c:when>
		<c:otherwise>
			<c:set var="list" value="${dao.selectList(param.b_category)}"/>
		</c:otherwise>
	</c:choose>
	
	<div class="container" >
		<div style="text-align:center">
			<h1>${param.b_category}게시판</h1>
		</div>
		<div>
		<br>
		</div>
		<div align="center">
			<table class="table-striped" style="width:80%">
				<tr>
					<th style="text-align:center; height:50px; width:10%">글 번호</th>
					<th style="text-align:center; width:55%;">제목</th>
					<th style="text-align:center; width:10%;">작성자</th>
					<th style="text-align:center; width:15%;">작성일</th>
					<th style="text-align:center; width:10%;">조회수</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr>
						<th style="text-align:center; height:35px;">${vo.b_num}</th>
						<th style="text-align:center"><a href="boardContent.jsp?b_num=${vo.b_num}">${vo.b_title}</a></th>
						<th style="text-align:center">${vo.b_nick}</th>
						<th style="text-align:center">${vo.b_date}</th>
						<th style="text-align:center">${vo.b_readNum}</th>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" style="text-align:right;">
						<button type="button" onclick="location.href='boardWrite.jsp'" class="btn btn-info">글 쓰기</button>
					</td>
				</tr>
			</table>			
		</div>
	</div>
		
	<jsp:include page="../HF/footer.jsp"/>
</body>
</html>