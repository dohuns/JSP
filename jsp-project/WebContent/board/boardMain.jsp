<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<fmt:requestEncoding value="UTF-8"/>
	<jsp:include page="../HF/header.jsp"/>
	
	<a href="boardList.jsp">글 목록 보러가기</a>
	<a href="boardWrite.jsp">글 쓰러가기</a>
	
	
	<jsp:include page="../HF/footer.jsp"/>

</body>
</html>