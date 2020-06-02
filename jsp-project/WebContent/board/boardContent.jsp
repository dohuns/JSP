<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>
<style>
.contentBox{
	border: 1px solid #eee;
	width:80%;
	border-radius : 20px;
	margin : 29px;
	
	
}
</style>
</head>
<body>
	<jsp:include page="../HF/header.jsp"/>
	<jsp:useBean id="dao" class="board.boardDAO"/>
	<c:set var="content" value="${dao.showContent(param.b_num)}"/>
	<div align="center">
	<div class="contentBox">
		<div class="container" style="color-border:black">
			<!-- 카테고리 -->
			<div>
				<h4>${content.b_category}게시판</h4>
			</div>
			<!-- 제목 -->
			<div style="text-align:center">
				<h1>${content.b_title}</h1>
			</div>
			<!-- 닉네임 -->
			<div>
				<h4>${content.b_nick}</h4>
			</div>
			<!-- 작성시간 & 조회수 -->
			<div>
				<h4>${content.b_date}
					조회수 : ${content.b_readNum}
				</h4>
			</div>
			<hr>
			<!-- 게시글 내용 -->
			<div>
				${content.b_content}
			</div>
			<!-- 댓글 수  -->
			<div>
				<span>그림</span> 댓글 + 댓글수(컬럼추가)
			</div>
			<hr>
			<div>
				<h2>댓글</h2><!-- 시간남으면 댓글 -->
				
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="../HF/footer.jsp"/>
	
</body>
</html>