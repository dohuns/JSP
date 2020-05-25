<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function chkpw() {
		if($("#pwd").val() != $("#rePwd").val() ) {
			$("label").text("불일치!!")
			$("label").css({
				"color":"red"
			});
			$("#pwd").val("");
			$("#rePwd").val("");
			$("#pwd").focus();
		} else {
			$("label").text("일치~")
			$("label").css({
				"color":"blue"
			});
		}
	}
	function complRegist() {
		if($("#id").val() == "") {
			alert("아이디를 입력하세요~");
		} else if($("#pwd").val() == "" || $("#rePwd").val() == "") {
			alert("비밀번호를 입력하세요~");
		} else {
			$("#fo").submit();
		}
		
		
	}
</script>
</head>
<body>
	<jsp:include page="../quiz-default/header.jsp"/>
	
	<div class="container">
	<form action="chkRegister.jsp" id="fo" method="POST" style="max-width:500px; margin:0 auto">
		<table class="table table-border">
			<thead>
				<tr>
					<td colspan="2"> <h1>회원가입 페이지 </h1></td> 
				</tr>
			</thead>
			<tbody>
			<tr>
				<th style="text-align:center; padding: 15px;">아  이  디 </th>
				<td>
					<input type="text" name="id" id="id" placeholder="아이디" class="form-control">
				</td>
				<td>
					<strong> (*필수 사항)</strong>
				</td>
			</tr>
			<tr>
				<th style="text-align:center; padding: 15px;">비밀번호</th>
				<td >
					<input type="text" name="pwd" id="pwd" placeholder="비밀번호" class="form-control">
				</td>
				<td></td>
			</tr>
			<tr>
				<th style="text-align:center; padding: 15px;">비밀번호 확인</th>
				<td>
					<input type="text" name="rePwd" id="rePwd" placeholder="비밀번호 확인" onchange="chkpw()" class="form-control">
				</td>
				<th>
					<label></label>
				</th>
			</tr>
			<tr>
				<th style="text-align:center; padding: 15px;">이    름</th>
				<td>
					<input type="text" name="name" placeholder="이름" class="form-control">
				</td>
				<td></td>
			</tr>
			<tr>
				<th style="text-align:center; padding: 15px;">주    소</th>
				<td>
					<input type="text" name="addr" placeholder="주소" class="form-control">
				</td>
				<td></td>
			</tr>
			<tr>
				<th style="text-align:center; padding: 15px;">전화번호</th>
				<td>
					<input type="text" name="tel" placeholder="전화번호" class="form-control">
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3">
			</tr>
			</tbody>
		</table>
		<button type="button" class="btn btn-success"onclick="complRegist()">회원가입</button>
		<button type="reset" class="btn btn-success">취소</button>
		</form>	
	</div>
	 
	
	<jsp:include page="../quiz-default/footer.jsp"/>

</body>
</html>