<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<jsp:useBean id="userDao" class="user.UserDAO" />
	<jsp:useBean id="userDto" class="user.UserDTO" />
	<jsp:setProperty property="*" name="userDto"/>
	${userDao.update(userDto)}
	<c:redirect url="userPage.jsp?u_id=${param.u_id}" />
</body>
</html>