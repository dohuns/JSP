<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>
<meta charset="UTF-8">

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
	
	function chkNick() {
		if($("#nick").val() == "" ) {
			$("#lb5").text("닉네임을 입력해주세요!");
			$("#lb5").css({
				"color":"red"
			});
		} else {
			$("#lb5").text("");
		}
	}
	
	function chkTel() {
		if($("#tel").val() == "" ) {
			$("#lb6").text("전화번호를 입력해주세요!");
			$("#lb6").css({
				"color":"red"
			});
		} else {
			$("#lb6").text("");
		}
	}
	
	function chkAddr() {
		if($("#addr").val() == "" ) {
			$("#lb7").text("주소를 입력해주세요!");
			$("#lb7").css({
				"color":"red"
			});
		} else {
			$("#lb7").text("");
		}
	}
	
	function chkReg() {
		if($("#id").val() == "" || $("#pw").val() == "" || $("#rePwd").val() == "" 
				|| $("#name").val() == "" || $("#nick").val() == "" || $("#tel").val() == ""
				|| $("#addr").val() == "") {
			alert("입력란을 전부 입력해주세요!!!");
		} else if($("#pw").val() != $("#rePwd").val()) {
			alert("비밀번호를 확인해주세요~");
		} else {
			$("#fo").submit();
		}
	}	
	
	function idOverlap() {
		$.ajax({
			type:"POST",
			url:"chkId.jsp",
			data:"u_id="+$("#id").val(),
			success:function(args) {
				console.log("success..."+args);
				$("#label1").html("");
				$("#label1").html(args);
			},
			error:function(e) {
				console.log("errors...");
				alert("에러");
			}
		});
		
		
	}
	
	function telOverlap() {
		$.ajax({
			type:"POST",
			url:"chkTel.jsp",
			data:"u_tel="+$("#tel").val(),
			success:function(args) {
				$("#label2").html(args);
			},
			error:function(e) {
				alert("에러")
			}
		});
	}
</script>


<title>회원가입 페이지</title>
</head>
<body>

<%@ taglib	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<fmt:requestEncoding value="UTF-8"/>
	<jsp:include page="../HF/header.jsp"/>
	<% response.setCharacterEncoding("UTF-8"); %>
	<br>
	<div align="center" class="container" >
		<form action="chkRegister.jsp" method="get" id="fo" style="margin:0 auto;" class="form-signin">
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
						<input type="text" name="u_id" id="id" placeholder="아이디" class="form-control" style="height:50px" onblur="chkId()">
					</td>
					<td>
						<button type="button" onclick="idOverlap()" class="btn btn-success" style="height:50px">중복체크</button>
						<label id="label1">중복 검사를 해주세요</label>
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
						<input type="text" name="u_pw" id="pw" placeholder="비밀번호" class="form-control" style="height:50px" onblur="chkPw()">
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
						<input type="text" id="rePwd" placeholder="비밀번호 확인" class="form-control" style="height:50px" onblur="chkRe()">
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
						<input type="text" name="u_name" id="name" placeholder="이름" class="form-control" style="height:50px" onblur="chkName()">
					</td>
				</tr>
				<tr>
					<td><label id="lb4"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>닉네임</h3> </td>
				</tr>
				<tr>
					<td>
						<input type="text" name="u_nick" id="nick" placeholder="닉네임" class="form-control" style="height:50px" onblur="chkNick()">
					</td>				
				</tr>
				<tr>
					<td><label id="lb5"></label> </td>
				</tr>
				<tr>
					<td> <h3>전화번호('-'없이 작성해주세요)</h3> </td>
				</tr>
				<tr>
					<td> 
						<input type="text" name="u_tel" id="tel" placeholder="전화번호" class="form-control" style="height:50px" onblur="chkTel()">
					</td>
					<td>
						<button type="button" onclick="telOverlap()" class="btn btn-success" style="height:50px">중복체크</button>
						<label id="label2">중복 검사를 해주세요</label>
					</td>
				</tr>
				<tr>
					<td><label id="lb6"></label> </td>
				</tr>
				<tr>
					<td> <h3>성별</h3> </td>
				</tr>
				<tr>
					<td>
						<strong style="font-size:20px">남</strong> &nbsp; <input type="radio" name="u_gender" value="남" checked="checked"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<strong style="font-size:20px">여</strong> &nbsp; <input type="radio" name="u_gender" value="여"> 
					<td>
				</tr>
				<tr>
					<td><label></label></td>
				</tr>
				<tr>
					<td> <h3>주소</h3> </td>
				</tr>
				<tr>
					<td> 
						<input type="text" name="u_addr" id="addr" placeholder="주소" class="form-control" style="height:50px" onblur="chkAddr()">
					</td>
				</tr>
				<tr>
					<td><label id="lb7"></label> </td>
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
<jsp:include page="../HF/footer.jsp"></jsp:include>

</body>
</html>