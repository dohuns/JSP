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
	${dto.setName(param.name) }
	${dto.setAddr(param.addr) }
	${dto.setTel(param.tel) }
	${dto.setId(param.id) }
	
	<c:set var="flag" value="${dao.modifyMember(dto) }"/>
	<c:choose>
		<c:when test="${flag }">
			<script>
				alert("수정 성공~");
				location.href="memberInfo.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("수정 실패!!");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>


</body>
</html>