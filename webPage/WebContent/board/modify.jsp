<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 수정</title>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<jsp:include page="/hf/header.jsp" />
	<form action="modifyChk.jsp" method="post">
		<input type="hidden" name="num" value="${param.num}">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="panel-group" id="accordion">
						<div class="panel panel-primary" style="border: 0px;">
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body" style="border: 1px solid #b8b4b4;">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="category">카테고리 선택</label>
												<select  class="form-control" name="b_category" id="b_category">
													<option value="free" <c:if test="${param.b_category == '자유게시판'}">selected</c:if>>자유게시판</option>
													<option value="fun" <c:if test="${param.b_category == '유머게시판'}">selected</c:if>>유머게시판</option>
													<option value="ask" <c:if test="${param.b_category == '질문게시판'}">selected</c:if>>질문게시판</option>
													<option value="tip" <c:if test="${param.b_category == '정보게시판'}">selected</c:if>>정보게시판</option>
												</select>
											</div>
											<div class="form-group">
												<input type="text" name="b_title" id="b_title" maxlength="16"
													class="form-control" value="${param.b_title}">
											</div>
											<div class="form-group">
												<textarea name="b_content" id="b_content" maxlength="1300"
													class="form-control" rows="20">${param.b_content}</textarea>
											</div>
										<div align="center">
												<button type="submit" class="btn btn-default">작성</button>
											<button type="button" class="btn btn-default" onclick="history.back()">취소</button>
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