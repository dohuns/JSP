<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="members.MemberDTO"/>
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	${dto.setId(param.id) } 
	${dto.setPwd(param.pwd) }
	${dto.setName(param.name) }
	${dto.setAddr(param.addr) }
	${dto.setTel(param.tel) } 
	
	<c:set var="flag" value="${dao.addMember(dto) }"/>
	<c:choose>
		<c:when test="${flag == true }">
			<script>
				alert("회원가입 성공~");
				location.href="login.jsp";
			</script>
		</c:when>
		<c:otherwise>
			alert("아이디가 중복 되었습니다.");
			history.back();
		</c:otherwise>
	</c:choose>
	

</body>
</html>