<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기 페이지</title>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
	<jsp:include page="../HF/header.jsp"/>
		<div class="container">
			<div class="panel">
				<c:choose>
				<c:when test="${sessionScope.sessionId != null}">
				<div class="panel-heading">
					<h1> 게시글 작성 페이지 </h1>
				</div>
				<form action="chkWrite.jsp">
				<input type="hidden" name="b_id" value="${sessionScope.sessionId}">
				<input type="hidden" name="b_nick" value="${sessionScope.sessionNick}">
				<div class="panel-body col-md-7">
					<div>
						<h3>게시판 선택</h3>
					</div>
					<div>
						<select name="b_category" class="form-control">
							<option value="자유" selected="selected"> 자유게시판 </option>
							<option value="유머"> 유머게시판 </option>	
							<option value="질문"> 질문게시판 </option>	
							<option value="팁"> 팁게시판 </option>	
						</select>
					</div>
					<div>
						<h3>제목</h3>
					</div>
					<div>
						<input type="text" name="b_title" id="b_title" class="form-control" placeholder="제목 입력">
					</div>
					<div>
						<h3>내용</h3>
					</div>
					<div>
						<textarea rows="20" cols="100" class="form-control" name="b_content" placeholder="내용 입력" style="resize:none;"></textarea>
					</div>
					<div style="float:right">
						<br>
						<input type="submit" value="글 작성" class="btn btn-info btn-lg"/>  
					</div>
				</div>
				</form>
				</c:when>
				<c:otherwise>
					<script>
						alert("로그인 후 이용해주세요!");
						location.href="../Manage/login.jsp";
					</script>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
	
	<jsp:include page="../HF/footer.jsp"/>
</body>
</html>