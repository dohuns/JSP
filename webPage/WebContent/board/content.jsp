<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글</title>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<jsp:include page="/hf/header.jsp" />
	<jsp:useBean id="boardDao" class="board.BoardDAO" />
	<jsp:useBean id="boardDto" class="board.BoardDTO" />
	<c:set var="dto" value="${boardDao.view(param.b_num)}" />
	
	<form action="modify.jsp" method="post">
		<input type="hidden" name="num" value="${param.b_num}">
		<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
			<div class="row">
				<div class="col-md-12">
					<div class="panel-group" id="accordion">
						<div class="panel panel-primary" style="border: 0px;">
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body" style="border: 1px solid #b8b4b4;">
									<div class="row">
										<div class="col-md-12">
											<div class="row">
												<div class="col-xs-12 col-sm-6 col-md-6">
													<div class="form-group">
														<label for="id">닉네임</label>
														<input type="text" name="b_nick" id="b_nick"
															class="form-control" tabindex="1" value="${dto.b_nick}" readOnly>
													</div>
												</div>
												<div class="col-xs-12 col-sm-6 col-md-6">
													<div class="form-group">
														<label for="readNum">조회 수</label>
														<input type="text" name="b_id" id="b_id"
															class="form-control" tabindex="1" value=" ${dto.b_readNum}" readOnly>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="category">카테고리</label>
												<input type="text" name="b_category" id="b_category" class="form-control"
													value=
														<c:choose>
															<c:when test="${dto.b_category == 'free'}">"자유게시판" </c:when>
															<c:when test="${dto.b_category == 'fun'}">"유머게시판"</c:when>
															<c:when test="${dto.b_category == 'ask'}">"질문게시판"</c:when>
															<c:when test="${dto.b_category == 'tip'}">"정보게시판"</c:when>
														</c:choose>  readOnly>
											</div>
											<div class="form-group">
												<label for="title">제목</label>
												<input type="text" name="b_title" id="b_title" maxlength="16"
													class="form-control" value="${dto.b_title}" readOnly>
											</div>
											<div class="form-group">
												<textarea name="b_content" id="b_content" maxlength="1300"
													class="form-control" rows="20" readOnly>${dto.b_content}</textarea>
											</div>
										<div align="center">
											<c:if test="${dto.b_id == sessionScope.s_id}">
												<button type="submit" class="btn btn-default">수정</button>
											</c:if>
											<c:if test="${dto.b_id == sessionScope.s_id}">
												<button type="button" class="btn btn-default"
													onclick="#">삭제</button>
											</c:if>
											<button type="button" class="btn btn-default"
												onclick="location.href='list.jsp'">목록</button>
										</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="/hf/footer.jsp" />
</body>
</html>