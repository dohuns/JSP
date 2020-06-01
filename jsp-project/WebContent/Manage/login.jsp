<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet"> -->
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src=../js/bootstrap.js/></script>

<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<jsp:include page="../HF/header.jsp"></jsp:include>
	<div class="container">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel">
				<div class="panel-heading">
					<h1> 로그인 페이지 </h1>
				</div>
				<div class="panel-body">
					<form action="chkLogin.jsp" method="POST">
						<div style="margin:15px 10px">
							<input type="text" name="u_id" class="form-control" placeholder="아이디 입력" autofocus>
						</div>
						<div style="margin:15px 10px; text-align:center">
							<input type="password" name="u_pw" class="form-control" placeholder="비밀번호 입력">
						</div>
						<div style="margin:5px 10px">
							<input type="submit" value="로그인" class="form-control btn btn-info">
						</div>
						<div style="margin:5px 10px">
							<button type="button" class="form-control btn btn-info" onclick="location.href='register.jsp'">회원가입</button>
						</div>
						<div style="margin:5px 10px">
							<label class="col-md-6" style="text-align:center">
								<a href="searchId.jsp">아이디 찾기</a>
							</label>
							<label class="col-md-6" style="text-align:center">
								<a href="searchPw.jsp">비밀번호 찾기</a>
							</label>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../HF/footer.jsp"></jsp:include>
</body>
</html>