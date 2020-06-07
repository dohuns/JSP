<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내 정보 조회</title>
	<link
		href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
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
	<jsp:useBean id="dao" class="user.UserDAO" />
	<jsp:useBean id="dto" class="user.UserDTO" />
	<c:set var="userList" value="${dao.uList(sessionScope.s_id)}" />

	<div class="container">
		<div class="row" style="margin-top: 10px; margin-bottom: 50px;">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form action="userUpd.jsp" method="post" role="form">
					<c:choose>
						<c:when test="${userList.size() != 0}">
							<c:forEach var="user" items="${userList}">
								<h3>
									<b>${user.u_nick}님 정보</b>
								</h3>
								<hr class="colorgraph">
								<div class="form-group">
									<label for="id">아이디</label>
									<input type="text" name="u_id" id="u_id"
										class="form-control input-lg" value="${user.u_id}" tabindex="3" readOnly>
								</div>
								<div class="form-group">
									<label for="name">이름</label>
									<input type="text" name="u_name" id="u_name"
										class="form-control input-lg" value="${user.u_name}" tabindex="3" readOnly>
								</div>
								<div class="form-group">
									<label for="nick">닉네임</label>
									<input type="text" name="u_nick" id="u_nick"
										class="form-control input-lg" value="${user.u_nick}" tabindex="4" readOnly>
								</div>
								<div class="form-group">
									<label for="gender">성별</label>
									<div class="form-inline required">
										<div class="form-group has-feedback">
											<label class="input-group">
												<span class="input-group-addon">
													<input type="radio" name="u_gender" value="남성"
														checked="<c:if test="${user.u_gender == '남성'}">checked</c:if>"
														onclick="return(false);" />
												</span>
												<div class="form-control form-control-static">남성</div>
												<span class="glyphicon form-control-feedback"></span>
											</label>
										</div>
										<div class="form-group has-feedback ">
											<label class="input-group">
												<span class="input-group-addon">
													<input type="radio" name="u_gender" value="여성"
														checked="<c:if test="${user.u_gender == '여성'}">checked</c:if>"
														onclick="return(false);" />
												</span>
												<div class="form-control form-control-static">여성</div>
												<span class="glyphicon form-control-feedback"></span>
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="tel">전화번호</label>
									<input type="text" name="u_tel" id="u_tel"
										class="form-control input-lg" value="${user.u_tel}" tabindex="4" readOnly>
								</div>
								<div class="form-group">
									<label for="addr">주소</label>
									<input type="text" name="u_addr" id="u_addr"
										class="form-control input-lg" value="${user.u_addr}" tabindex="4" readOnly>
								</div>
								<hr class="colorgraph">
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
										<input type="submit" class="btn btn-lg btn-success btn-block"
											style="background-color: #f14444; border-color: #f14444;"
											value="수정">
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6">
										<a href="/webPage/board/list.jsp"
											class="btn btn-lg btn-primary btn-block"
											style="background-color: #f14444; border-color: #f14444;">취소</a>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<script>
								alert("잘못된 접근 방식입니다. 재 로그인 바랍니다.");
								location.href = "/webPage/user/logout.jsp";
							</script>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/hf/footer.jsp" />
</body>
</html>