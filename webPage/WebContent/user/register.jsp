<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 화면</title>
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

		/* .help-block 을 일단 보이지 않게 설정 */
		#myForm .help-block {
			display: none;
		}
	</style>
</head>
<body>
	<jsp:include page="/hf/header.jsp" />
	<jsp:useBean id="userDao" class="user.UserDAO" />

	<div class="container">
		<div class="row" style="margin-top: 50px">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form action="registerChk.jsp" method="get" role="form" id="myForm">
					<h2><b>회원가입</b></h2>
					<hr class="colorgraph">
					<div class="form-group">
						<input type="text" name="u_id" id="u_id"
							class="form-control input-lg" placeholder="아이디"
							tabindex="1" maxlength="15" required>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<input type="password" name="u_pw" id="u_pw"
									class="form-control input-lg" placeholder="비밀번호"
									tabindex="2" required>
							</div>
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div class="form-group">
								<input type="password" name="u_pwChk" id="u_pwChk"
									class="form-control input-lg" placeholder="비밀번호 확인"
									tabindex="3" required>
								<span id="rePwdErr" class="help-block">비밀번호 불일치</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<input type="text" name="u_name" id="u_name"
							class="form-control input-lg" placeholder="이름"
							tabindex="4" required>
					</div>
					<div class="form-group">
						<input type="text" name="u_nick" id="u_nick"
							class="form-control input-lg" placeholder="닉네임"
							tabindex="5" maxlength="10" required>
					</div>
					<div class="form-group">
						<div class="form-inline required">
		                    <div class="form-group has-feedback">
		                        <label class="input-group">
		                            <span class="input-group-addon">
		                                <input type="radio" name="u_gender" value="남성"
		                                	checked="checked" tabindex="6" />
		                            </span>
		                            <div class="form-control form-control-static">남성</div>
		                            <span class="glyphicon form-control-feedback"></span>
		                        </label>
		                    </div>
		                    <div class="form-group has-feedback ">
		                        <label class="input-group">
		                            <span class="input-group-addon">
		                                <input type="radio" name="u_gender" value="여성" />
		                            </span>
		                            <div class="form-control form-control-static">여성</div>
		                            <span class="glyphicon form-control-feedback"></span>
		                        </label>
		                    </div>
		                </div>
	                </div>
					<div class="form-group">
						<input type="text" name="u_tel" id="u_tel"
							class="form-control input-lg" placeholder="전화번호"
							tabindex="7" required>
					</div>
					<div class="form-group">
						<input type="text" name="u_addr" id="u_addr"
							class="form-control input-lg" placeholder="주소"
							tabindex="8" required>
					</div>
					<hr class="colorgraph">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<button type="submit" class="btn btn-lg btn-success btn-block"
								style="background-color: #f14444; border-color: #f14444;"
								tabindex="9">회원가입</button>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<a href="/webPage/user/login.jsp"
								class="btn btn-lg btn-primary btn-block"
								style="background-color: #f14444; border-color: #f14444;"
								tabindex="10">취소</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		/* 비밀번호 비교 */
		$("#u_pwChk").keyup(function() {
			var repwd = $(this).val();
			var pwd = $("#u_pw").val();
			/* 입력한 두 값 비교 */
			if (repwd == pwd) {
				$("#rePwdErr").hide();
				successState("#u_pwChk");
			} else {
				$("#rePwdErr").show();
				errorState("#u_pwChk");
			}
		});

		/* 성공 상태로 변환 */
		function successState(sel) {
			$(sel).parent().removeClass("has-error").addClass("has-success")

			$("#myForm button[type=submit]").removeAttr("disabled");
		};

		/* 에러 상태로 변환 */
		function errorState(sel) {
			$(sel).parent().removeClass("has-success").addClass("has-error")

			/* 비밀번호 불일치 시 버튼 비활성화 */
			$("#myForm button[type=submit]").attr("disabled", "disabled");
		};
	</script>
	<jsp:include page="/hf/footer.jsp" />
</body>
</html>