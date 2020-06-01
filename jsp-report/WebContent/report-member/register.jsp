<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>

<script>
	
	function chkId() {
		if($("#id").val() == "" ) {
			$("#lb1").text("���̵� �Է����ּ���!");
			$("#lb1").css({
				"color":"red"
			});
		} else {
			$("#lb1").text("");
		}
	}
	
	function chkPw() {
		if($("#pw").val() == "" ) {
			$("#lb2").text("��й�ȣ�� �Է����ּ���!");
			$("#lb2").css({
				"color":"red"
			});
		} else {
			$("#lb2").text("");
		}
	}
	
	function chkRe() {
		if($("#rePwd").val() == "" ) {
			$("#lb3").text("��й�ȣ Ȯ���� �Է����ּ���!");
			$("#lb3").css({
				"color":"red"
			});
		} else {
			if($("#pw").val() == $("#rePwd").val() ) {
				$("#lb3").text("��ġ~");
				$("#lb3").css({
					"color":"blue"
				});
			} else {
				$("#lb3").text("����ġ~");
				$("#lb3").css({
					"color":"red"
				});
			} 
		}
	}
	
	function chkName() {
		if($("#name").val() == "" ) {
			$("#lb4").text("�̸��� �Է����ּ���!");
			$("#lb4").css({
				"color":"red"
			});
		} else {
			$("#lb4").text("");
		}
	}
	
	function chkDep() {
		if($("#depart").val() == "" ) {
			$("#lb5").text("�μ��� �Է����ּ���!");
			$("#lb5").css({
				"color":"red"
			});
		} else {
			$("#lb5").text("");
		}
	}
	
	function chkRank() {
		if($("#rank").val() == "" ) {
			$("#lb6").text("������ �Է����ּ���!");
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
			alert("�Է¶��� ���� �Է����ּ���!!!");
		} else if($("#pw").val() != $("#rePwd").val()) {
			alert("��й�ȣ�� Ȯ�����ּ���~");
		} else {
			$("#fo").submit();
		}
	}
	
	
	
	
</script>
</head>
<body>
	<jsp:include page="../report-default/header.jsp"/>
		
	<br>
	<div align="center" class="container" >
		<form action="chkRegister.jsp" id="fo" style="margin:0 auto;" class="form-signin">
			<table>
				<thead>
					<th> <h1> ȸ������ ������ </h1> </th>
				</thead>
				<tbody>
				
				<tr>
					<td> <h3>���̵�</h3> </td>
				</tr>
				<tr>
					<td style="width:500px;"> 
						<input type="text" name="id" id="id" placeholder="���̵�" class="form-control" style="height:50px" onblur="chkId()">
					</td>  
				</tr>
				<tr>
					<td><label id="lb1"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>��й�ȣ</h3> </td>
				</tr>
				<tr>
					<td> 
						<input type="text" name="pwd" id="pw" placeholder="��й�ȣ" class="form-control" style="height:50px" onblur="chkPw()">
					</td>
				</tr>
				<tr>
					<td><label id="lb2"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>��й�ȣ Ȯ��</h3> </td>
				</tr>
				<tr>
					<td>
						<input type="text" name="rePwd" id="rePwd" placeholder="��й�ȣ Ȯ��" class="form-control" style="height:50px" onblur="chkRe()">
					</td>
				</tr>
				<tr>
					<td><label id="lb3"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>�̸�</h3> </td>
				</tr>
				<tr>
					<td> 
						<input type="text" name="name" id="name" placeholder="�̸�" class="form-control" style="height:50px" onblur="chkName()">
					</td>
				</tr>
				<tr>
					<td><label id="lb4"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>�μ�</h3> </td>
				</tr>
				<tr>
					<td>
						<input type="text" name="depart" id="depart" placeholder="�μ�" class="form-control" style="height:50px" onblur="chkDep()">
					</td>				
				</tr>
				<tr>
					<td><label id="lb5"></label> </td>
				</tr>
				
				<tr>
					<td> <h3>����</h3> </td>
				</tr>
				<tr>
					<td> 
						<input type="text" name="rank" id="rank" placeholder="����" class="form-control" style="height:50px" onblur="chkRank()">
					</td>
				</tr>
				<tr>
					<td><label id="lb6"></label> </td>
				</tr>
				
				<tr>
					<td>
						<br> <button type="button" onclick="chkReg()" class="btn btn-info btn-lg" style="width:100%; height:50px">ȸ������</button>
					</td>
				</tr>
				</tbody>
				
			</table>
		</form>		
	</div>

	

	<jsp:include page="../report-default/footer.jsp"/>
</body>
</html>