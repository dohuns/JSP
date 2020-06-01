<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<option value="free" selected="selected"> 자유게시판 </option>
							<option value="fun"> 유머게시판 </option>	
							<option value="ask"> 질문게시판 </option>	
							<option value="tip"> 팁게시판 </option>	
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
						<textarea rows="20" cols="100" class="form-control" name="b_content" placeholder="내용 입력"></textarea>
					</div>
					<div style="float:right">
						<br>
						<input type="submit" value="글 작성" class="btn btn-info btn-lg"/>  
					</div>
				</div>
				</form>
			</div>
		</div>
	
	<jsp:include page="../HF/footer.jsp"/>
</body>
</html>