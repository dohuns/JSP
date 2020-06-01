<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지</title>
	<script>
		function txtChk() {
			if(document.getElementsByName("u_id")[0].value == ""){
				alert("아이디를 입력해주세요.");
			} else if(document.getElementsByName("u_pw")[0].value == ""){
				alert("비밀번호를 입력해주세요.");
			} else if(document.getElementsByName("u_name")[0].value == ""){
				alert("이름을 입력해주세요.");
			} else if(document.getElementsByName("u_nick")[0].value == ""){
				alert("닉네임을 입력해주세요.");
			} else if(document.getElementsByName("u_tel")[0].value == ""){
				alert("전화번호를 입력해주세요.");
			} else if(document.getElementsByName("u_addr")[0].value == ""){
				alert("주소를 입력해주세요.");
			} else {
				rForm.submit();
			}
		}
	</script>
</head>
<body>
	<jsp:useBean id="userDao" class="user.UserDAO" />
	<form action="registerChk.jsp" method="get" id="rForm">
		아이디	<input type="text" name="u_id"><br>
		비밀번호	<input type="text" name="u_pw"><br>
		이름	<input type="text" name="u_name"><br>
		닉네임	<input type="text" name="u_nick"><br>
		성별	&nbsp;
		남성 <input type="radio" name="u_gender" value="남성">
		여성 <input type="radio" name="u_gender" value="여성"><br>
		전화번호	<input type="text" name="u_tel"><br>
		주소	<input type="text" name="u_addr"><br>
		<button type="button" onclick="txtChk()">확인</button>
		<button type="button" onclick="history.back()">취소</button>
	</form>
</body>
</html>
