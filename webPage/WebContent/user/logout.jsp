<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout</title>
</head>
<body>
	<c:remove var="s_id" scope="session" />
	<c:redirect url="/hf/main.jsp" />
</body>
</html>