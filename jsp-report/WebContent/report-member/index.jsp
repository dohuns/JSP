<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.j"></script>
</head>
<body>
	<jsp:include page="../report-default/header.jsp"/>

	<div align="center">
		<h1>�α��� ������</h1>
	</div>
	<br>
	<div align="center">
		<form action="chkLogin.jsp"  style="margin:0 auto;max-width:500px">
		<table>
			<tr>
				<td> ���̵� </td>
				<td>
					<input type="text" name="id" placeholder="���̵�" class="form-control">
				</td>
			</tr>
			<tr>
				<td> <br>��й�ȣ &nbsp;</td>
				<td>
					 <br><input type="password" name="pwd" placeholder="��й�ȣ" class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<br>
					<input type="submit" value="�α���" class="btn btn-info">
					<a href="register.jsp" class="btn btn-info">ȸ������</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<jsp:include page="../report-default/footer.jsp"/>

</body>
</html>