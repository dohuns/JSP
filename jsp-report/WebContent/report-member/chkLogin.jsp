<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
	
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<c:set var="pwd" value="${dao.chkLogin(param.id)}"/>
	
	<c:choose>
		<c:when test="${pwd != null}">
			<c:choose>
				<c:when test="${pwd == param.pwd }">
					<c:set var="sessionId" value="${param.id}" scope="session"/>
					<script>
						alert("로그인 성공~");
						location.href="memberList.jsp";
					</script>
				</c:when>
				<c:otherwise>
					<script>
						alert("비밀번호가 일치하지 않습니다!!");
						history.back();
					</script>		
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<script>
				alert("아이디가 존재하지 않습니다!!")
				history.back();
			</script>
		</c:otherwise>			
	</c:choose>
</body>
</html>