<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<fmt:requestEncoding value="UTF-8"/>
	
	<jsp:useBean id="vo" class="member.MemberVO"/>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<jsp:setProperty property="*" name="vo"/>
	<c:set var="flag" value="${dao.chkReg(vo)}"/>
	
	<c:choose>
		<c:when test="${flag}">
			<script>
				alert("회원가입 성공~");
				location.href="index.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("중복된 아이디 입니다!!!")
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
	

</body>
</html>