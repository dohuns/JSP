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
	width:1000px;
	border-radius : 20px;
	margin : 29px;
}
.lb1 {
	font-size: 14px;
	margin-top:10px;
	margin-bottom:0px;
	
}
.middleBox{
	border: 1px solid #eee;
	width:1000px;
}
</style>
</head>
<body>
	<jsp:include page="../HF/header.jsp"/>
	<jsp:useBean id="dao" class="board.boardDAO"/>
	<c:set var="content" value="${dao.showContent(param.b_num)}"/>
	<div align="center">
	<div class="contentBox">
		<div class="container" >
			<!-- 카테고리 -->
			<div align="left">
				<a href='boardList.jsp?b_category=${content.b_category}'>
					<label class="lb1">${content.b_category}게시판</label>
				</a>
			</div>
			<!-- 제목 -->
			<div align="left" >
				<h2 style="margin-top:5px">${content.b_title}</h2>
			</div>
			<!-- 닉네임 -->
			<div align="left">
				<h5>${content.b_nick}</h5>
			</div>
			<!-- 작성시간 & 조회수 -->
			<div align="left">
				<h5>${content.b_date}
					조회수 : ${content.b_readNum}
				</h5>
			</div>
			<div align="left">
				<hr style="width:950px; margin-left: 5px;">
				<!-- 게시글 내용 -->
				<div align="left">
					${content.b_content}
				</div>
				<!-- 댓글 수  -->
				<div align="left" style="margin-top:50px">
					<span>그림</span> 댓글 + 댓글수(컬럼추가)
				</div>
				<hr style="width:950px; margin-left: 5px;">
			</div>
			<div align="left">
				<h3>댓글</h3><!-- 시간남으면 댓글 -->
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="../HF/footer.jsp"/>
	
</body>
</html>