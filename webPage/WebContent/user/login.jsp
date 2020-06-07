<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LoginPage</title>
	<link
		href="//netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<style>
		.colorgraph {
			height: 5px;
			border-top: 0;
			background: #f14444;
			border-radius: 5px;
		}

 		input::-webkit-input-placeholder {
 		  font-size: 13px;
 		}
	</style>
</head>
<body>
	<jsp:include page="/hf/header.jsp" />
	<c:choose>
		<c:when test="${sessionScope.s_id == null}">
			<div class="container">
				<div class="row" style="margin-top: 50px">
					<div
						class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
						<form role="form" action="loginChk.jsp" method="post">
							<fieldset>
								<h2><b>로그인</b></h2>
								<hr class="colorgraph">
								<div class="form-group">
									<input type="text" name="u_id" id="u_id"
										class="form-control input-lg" placeholder="아이디" required>
								</div>
								<div class="form-group">
									<input type="password" name="u_pw" id="u_pw"
										class="form-control input-lg" placeholder="비밀번호" required>
								</div>
								<span> <a href="" class="btn btn-link pull-right">
									아이디 / 비밀번호 찾기</a> <br>
								</span>
								<hr class="colorgraph">
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
										<input type="submit" class="btn btn-lg btn-success btn-block"
											style="background-color: #f14444; border-color: #f14444;"
											value="로그인">
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6">
										<a href="/webPage/user/register.jsp" class="btn btn-lg btn-primary btn-block"
											style="background-color: #f14444; border-color: #f14444;">회원가입</a>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<c:redirect url="/hf/main.jsp" />
		</c:otherwise>
	</c:choose>
	<jsp:include page="/hf/footer.jsp" />
</body>
</html>