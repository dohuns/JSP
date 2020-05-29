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
		if (document.getElementsByName("id")[0].value == "") {
			alert("아이디를 입력해주세요")
		} else if (document.getElementsByName("pw")[0].value == "") {
			alert("비밀번호를 입력해주세요")
		} else if (document.getElementsByName("pwch")[0].value == "") {
			alert("비밀번호 확인을 입력해주세요")
		} else if (document.getElementsByName("name")[0].value == "") {
			alert("이름을 입력해주세요")
		} else {
			next.submit();
		}
	}
	
	function pwchk() {
		pw1 = document.getElementsByName("pw")[0].value;
		pw2 = document.getElementsByName("pwch")[0].value;
		if (pw1 == pw2) {
			document.getElementsByName("ch")[0].innerHTML = "일치"
		} else {
			document.getElementsByName("pw")[0].value = "";
			document.getElementsByName("pwch")[0].value = "";
			document.getElementsByName("pw")[0].focus();
			document.getElementsByName("ch")[0].innerHTML = "불일치"
		}
	}
</script>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<form action="memberInfo.jsp" method="post" name="next">
		<h2>회원가입</h2>
		<table>
			<tr>
				<td><input type="text" name="id" placeholder=" 아이디">(* 필수항목)</td>
			</tr>
			<tr>
				<td><input type="password" name="pw" placeholder=" 비밀번호"></td>
			</tr>
			<tr>
				<td><input type="password" name="pwch" onchange="pwchk()" placeholder=" 비밀번호"><label name="ch">(* 필수항목)</label></td>
			</tr>
			<tr>
				<td><input type="text" name="name" placeholder=" 이름">(* 필수항목)</td>
			</tr>
			<tr>
				<td><input type="text" name="dep" placeholder=" 부서"></td>
			</tr>
			<tr>
				<td><input type="text" name="rank" placeholder=" 직급"></td>
			</tr>
			<tr>
				<td align="center"><button type="button" onclick="memchk()">회원가입</button>
					<button type="button" onclick="location.href='Login.jsp'">취소</button></td>
			</tr>
		</table>
	</form>
</body>
</html>