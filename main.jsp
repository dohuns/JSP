<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>default_mainPage</title>
</head>
<body>
	<div style="margin: 0 10% 0 10%; width: 80%; height: 900px;" align="center">
		<%@ include file="/default/header.jsp" %>
		<div style="height: 50%;">
			<form action="loginChk.jsp" method="post" style="padding-top: 8%;">
				<img src="/jsp03/image/maru01.jpg" style="width: 300px;">
				<p><b>마루 페이지</b></p>
			</form>
		</div>
		<hr>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>