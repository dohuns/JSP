<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>

<script>
	
	function chkId() {
		if($("#id").val() == "" ) {
			$("#lb1").text("아이디를 입력해주세요!");
			$("#lb1").css({
				"color":"red"
			});
		} else {
			$("#lb1").text("");
		}
	}
	
	function chkPw() {
		if($("#pw").val() == "" ) {
			$("#lb2").text("비밀번호를 입력해주세요!");
			$("#lb2").css({
				"color":"red"
			});
		} else {
			$("#lb2").text("");
		}
	}
	
	function chkRe() {
		if($("#rePwd").val() == "" ) {
			$("#lb3").text("비밀번호 확인을 입력해주세요!");
			$("#lb3").css({
				"color":"red"
			});
		} else {
			if($("#pw").val() == $("#rePwd").val() ) {
				$("#lb3").text("일치~");
				$("#lb3").css({
					"color":"blue"
				});
			} else {
				$("#lb3").text("불일치~");
				$("#lb3").css({
					"color":"red"
				});
			} 
		}
	}
	
	function chkName() {
		if($("#name").val() == "" ) {
			$("#lb4").text("이름를 입력해주세요!");
			$("#lb4").css({
				"color":"red"
			});
		} else {
			$("#lb4").text("");
		}
	}
	
	function chkDep() {
		if($("#depart").val() == "" ) {
			$("#lb5").text("부서를 입력해주세요!");
			$("#lb5").css({
				"color":"red"
			});
		} else {
			$("#lb5").text("");
		}
	}
	
	function chkRank() {
		if($("#rank").val() == "" ) {
			$("#lb6").text("직급을 입력해주세요!");
			$("#lb6").css({
				"color":"red"
			});
		} else {
			$("#lb6").text("");
		}
	}
	
	function chkReg() {
		if($("#id").val() == "" || $("#pw").val() == "" || $("#rePwd").val() == "" 
				|| $("#name").val() == "" || $("#depart").val() == "" || $("#rank").val() == "") {
			alert("입력란을 전부 입력해주세요!!!");
		} else if($("#pw").val() != $("#rePwd").val()) {
			alert("비밀번호를 확인해주세요~");
		} else {
			$("#fo").submit();
		}
	}
	
	
	
	
</script>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<fmt:requestEncoding value="UTF-8"/>
	<jsp:include page="../report-default/header.jsp"/>
		
	<br>
	<div align="center" class="container" >
		<form action="chkRegister.jsp" id="fo" style="margin:0 auto;" class="form-signin">
			<table>
				<thead>
					<th> <h1> 회원가입 페이지 </h1> </th>
				</thead>
				<tbody>
				
				<tr>
					<td> <h3>아이디</h3> </td>
				</tr>
				<tr>
					<td style="width:500px;"> 
						<input type="text" name="id" id="id" placeholder="아이디" class="form-control" style="height:50px" onblur="chkId()">
					</td>  
				</tr>
				<tr>
					<td><label id="lb1"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>비밀번호</h3> </td>
				</tr>
				<tr>
					<td> 
						<input type="text" name="pwd" id="pw" placeholder="비밀번호" class="form-control" style="height:50px" onblur="chkPw()">
					</td>
				</tr>
				<tr>
					<td><label id="lb2"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>비밀번호 확인</h3> </td>
				</tr>
				<tr>
					<td>
						<input type="text" name="rePwd" id="rePwd" placeholder="비밀번호 확인" class="form-control" style="height:50px" onblur="chkRe()">
					</td>
				</tr>
				<tr>
					<td><label id="lb3"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>이름</h3> </td>
				</tr>
				<tr>
					<td> 
						<input type="text" name="name" id="name" placeholder="이름" class="form-control" style="height:50px" onblur="chkName()">
					</td>
				</tr>
				<tr>
					<td><label id="lb4"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>부서</h3> </td>
				</tr>
				<tr>
					<td>
						<input type="text" name="depart" id="depart" placeholder="부서" class="form-control" style="height:50px" onblur="chkDep()">
					</td>				
				</tr>
				<tr>
					<td><label id="lb5"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>직급</h3> </td>
				</tr>
				<tr>
					<td> 
						<input type="text" name="rank" id="rank" placeholder="직급" class="form-control" style="height:50px" onblur="chkRank()">
					</td>
				</tr>
				<tr>
					<td><label id="lb6"></label> </td>
				</tr>
				
				<tr>
					<td>
						<br> <button type="button" onclick="chkReg()" class="btn btn-info btn-lg" style="width:100%; height:50px">회원가입</button>
					</td>
				</tr>
				</tbody>
				
			</table>
		</form>		
	</div>

	

	<jsp:include page="../report-default/footer.jsp"/>
</body>
</html>