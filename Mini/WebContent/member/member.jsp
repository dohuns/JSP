<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member</title>
<script type="text/javascript">
	function memchk() {
		if (document.getElementsByName("u_id")[0].value == "") {
			alert("아이디를 입력해주세요")
		} else if (document.getElementsByName("u_pw")[0].value == "") {
			alert("비밀번호를 입력해주세요")
		} else if (document.getElementsByName("u_pwch")[0].value == "") {
			alert("비밀번호 확인을 입력해주세요")
		} else if (document.getElementsByName("u_name")[0].value == "") {
			alert("이름을 입력해주세요")
		} else if (document.getElementsByName("u_nick")[0].value == "") {
			alert("닉네임을 입력해주세요")
		} else if (document.getElementsByName("u_tel")[0].value == "") {
			alert("전화번호를 입력해주세요")
		} else if (document.getElementsByName("u_addr")[0].value == "") {
			alert("주소를 입력해주세요")
		} else {
			next.submit();
		}
	}
	
	function pwchk() {
		pw1 = document.getElementsByName("u_pw")[0].value;
		pw2 = document.getElementsByName("u_pwch")[0].value;
		if (pw1 == pw2) {
			document.getElementsByName("ch")[0].innerHTML = "일치"
			document.getElementsByName("ch")[0].style.color = "blue"
		} else {
			document.getElementsByName("u_pw")[0].value = ""
			document.getElementsByName("u_pwch")[0].value = ""
			document.getElementsByName("u_pw")[0].focus()
			document.getElementsByName("ch")[0].innerHTML = "불일치"
			document.getElementsByName("ch")[0].style.color = "red"
		}
	}
</script>
<style type="text/css">
#txt{width: 200px; height: 30px; margin: 5px 5px;}
</style>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:include page="../default/header.jsp"/>
	<form action="memberInfo.jsp" method="post" name="next" id="form">
	<div style="margin-left: 40%">
		<h1>회원가입</h1>
		<table>
			<tr><td>아이디</td>
				<td><input type="text" id="txt" name="u_id" placeholder=" 아이디를 입력해주세요"></td>
			</tr>
			<tr>
			<tr><td>비밀번호</td>
				<td><input type="password" id="txt" name="u_pw" placeholder=" 비밀번호를 입력해주세요"></td>
			</tr>
			<tr>
			<tr><td>비밀번호 확인</td>
				<td><input type="password" id="txt" name="u_pwch" onchange="pwchk()" placeholder=" 비밀번호 확인을 입력해주세요"><label name="ch"></label></td>
			</tr>
			<tr>
			<tr><td>이름</td>
				<td><input type="text" id="txt" name="u_name" placeholder=" 이름을 입력해주세요"></td>
			</tr>
			<tr>
			<tr><td>닉네임</td>
				<td><input type="text" id="txt" name="u_nick" placeholder=" 닉네임을 입력해주세요"></td>
			</tr>
			<tr>
			<tr><td>성별</td>
				<td><input type="radio" name="u_gender" value="남자" checked="checked">남자<input type="radio" name="u_gender" value="여자">여자</td>
			</tr>
			<tr>
			<tr><td>전화번호</td>
				<td><input type="text" id="txt" name="u_tel" placeholder=" 전화번호를 입력해주세요"></td>
			</tr>
			<tr>
			<tr><td>주소</td>
				<td><input type="text" id="txt" name="u_addr" placeholder=" 주소를 입력해주세요"></td>
			</tr>
			<tr>
			<tr>
				<td align="center" colspan="2"><button type="button" onclick="memchk()">회원가입</button>&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='../login/login.jsp'">취소</button></td>
			</tr>
			<tr style="height: 100px;">
			<td></td>
			</tr>
		</table>
	</div>
	</form>
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>