<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<style>
		.aDeco {
			color: black;
		}
	</style>
</head>
<body>
	<jsp:useBean id="boardDao" class="board.BoardDAO" />
	<jsp:useBean id="boardDto" class="board.BoardDTO" />
	<c:set var="sBoard" value="${boardDao.selectBoard(param.id)}" />

	<jsp:include page="/hf/header.jsp" />
	<input type="hidden" name="c_id" value="${param.id}">
	<div class="container" style="margin-bottom: 50px;">
		<a href="write.jsp?id=${param.id}" class="btn btn-default">글 작성</a>
		<p>
		<table class="table table-hover">
			<thead style="background-color: #f29494;">
				<tr>
					<th style="width: 5%"></th>
					<th style="width: 10%">번호</th>
					<th style="width: 35%">제목</th>
					<th style="width: 10%">작성자</th>
					<th style="width: 10%">작성일</th>
					<th style="width: 10%">조회수</th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${sBoard.size() != 0}">
					<c:forEach var="sList" items="${sBoard}">
						<tbody>
							<tr>
								<td>&nbsp;</td>
								<td>${sList.b_num}</td>
								<td><a class="aDeco" href="content.jsp?b_num=${sList.b_num}">${sList.b_title}</a></td>
								<td>${sList.b_nick}</td>
								<td>${sList.b_date}</td>
								<td>${sList.b_readNum}</td>
							</tr>
						</tbody>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tbody>
						<tr>
							<th colspan="6" style="text-align: center;">등록된 게시글이 없습니다.</th>
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
			<!-- PAGING -->
			<tfoot>
				<tr>
					<th colspan="6" style="text-align: center;">
						<div class="text-center">
							<ul class="pagination pagination-large">
								<c:choose>
									<c:when test="${start > 1}">
										<li><a href="list.jsp?start=${start - 1}"><</a></li>
									</c:when>
									<c:otherwise>
										<li class="disabled"><span><</span></li>
									</c:otherwise>
								</c:choose>
								<c:forEach begin="1" end="${totalPage}" step="1" var="cnt">
									<li><a href="list.jsp?start=${cnt}">${cnt}</a></li>
								</c:forEach>
								<c:choose>
									<c:when test="${start < totalPage}">
										<li><a href="list.jsp?start=${start + 1}">></a></li>
									</c:when>
									<c:otherwise>
										<li class="disabled"><span>></span></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</th>
				</tr>
			</tfoot>
			<!-- --- -->
		</table>
	</div>
	<jsp:include page="/hf/footer.jsp" />
</body>
</html>