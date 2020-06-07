<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 작성 페이지</title>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<fmt:requestEncoding value="UTF-8" />
	<jsp:include page="/hf/header.jsp" />
	<form action="writeChk.jsp?id=${param.id}" method="post" id="wForm">
		<input type="hidden" name="b_id" value="${s_id}">
		<input type="hidden" name="b_nick" value="${s_nick}">
		<input type="hidden" name="c_id" value="${param.id}">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="panel-group" id="accordion">
						<div class="panel panel-primary" style="border: 0px;">
							<div class="panel-heading" style="border: 1px solid #b8b4b4; border-bottom: 0px; background-color: white;">
								<h4 class="panel-title" style="color: black;">
									<span class="glyphicon glyphicon-file"></span> 게시글 작성
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body" style="border: 1px solid #b8b4b4;">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="category">카테고리 선택</label>
												<select  class="form-control" name="b_category" id="b_category">
													<option value="free" <c:if test="${param.id == 'free'}">selected</c:if>>자유게시판</option>
													<option value="fun" <c:if test="${param.id == 'fun'}">selected</c:if>>유머게시판</option>
													<option value="ask" <c:if test="${param.id == 'ask'}">selected</c:if>>질문게시판</option>
													<option value="tip" <c:if test="${param.id == 'tip'}">selected</c:if>>정보게시판</option>
												</select>
											</div>
											<div class="form-group">
												<label for="title">제목</label>
												<input type="text" name="b_title" id="b_title" maxlength="16"
													class="form-control" placeholder="제목" required>
											</div>
											<div class="form-group">
												<textarea name="b_content" id="b_content" maxlength="1300"
													class="form-control" placeholder="내용" rows="10" required></textarea>
											</div>
										<div align="center">
											<button type="submit" class="btn btn-default">글 작성</button>
											<button type="button" class="btn btn-default" onclick="location.href='list.jsp'">취소</button>
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