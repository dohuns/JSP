<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script type="text/javascript">
	function memchk() {
		if (document.getElementsByName("u_pw")[0].value == "") {
			alert("비밀번호를 입력해주세요")
		} else if (document.getElementsByName("u_pwch")[0].value == "") {
			alert("비밀번호 확인을 입력해주세요")
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
		<jsp:useBean id="dao" class="User.UserDAO"/>
	<c:set var="dto" value="${dao.chkUser(sessionScope.u_id) }"/>
	
	<form action="privacy_modify.jsp" method="post" name="next" id="form">
	<div style="margin-left: 40%">
		<h1>나의 정보</h1>
		<table>
			<tr><td>아이디</td>
				<td><input type="text" id="txt" name="u_id" value="${dto.u_id }" readonly></td>
			</tr>
			<tr>
			<tr><td>비밀번호</td>
				<td><input type="password" id="txt" name="u_pw" value="${dto.u_pw }"></td>
			</tr>
			<tr>
			<tr><td>비밀번호 확인</td>
				<td><input type="password" id="txt" name="u_pwch" onchange="pwchk()" value="${dto.u_pw }"><label name="ch"></label></td>
			</tr>
			<tr>
			<tr><td>이름</td>
				<td><input type="text" id="txt" name="u_name" value="${dto.u_name }" readonly></td>
			</tr>
			<tr>
			<tr><td>닉네임</td>
				<td><input type="text" id="txt" name="u_nick" value="${dto.u_nick }"></td>
			</tr>
			<tr>
			<tr><td>성별</td>
				<td>${dto.u_gender }</td>
			</tr>
			<tr>
			<tr><td>전화번호</td>
				<td><input type="text" id="txt" name="u_tel" value="${dto.u_tel }"></td>
			</tr>
			<tr>
			<tr><td>주소</td>
				<td><input type="text" id="txt" name="u_addr" value="${dto.u_addr }"></td>
			</tr>
			<tr>
			<tr>
				<td align="center" colspan="2"><button type="button" onclick="memchk()">정보 수정</button>&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='javascript:history.back()'">이전</button></td>
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