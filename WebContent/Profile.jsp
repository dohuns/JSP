<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>
<fmt:requestEncoding value="utf-8" />
	<c:if test="${sessionScope.id eq null}">
		<script type="text/javascript">
			alert("로그인을 해주세요")
			location.href = "Login.jsp"
		</script>
	</c:if>
	<jsp:useBean id="dao" class="Mem.MemDAO"/>
	<h3>회원 목록</h3>
	<table border="1">
		<tr> <th>이름</th> <th>부서</th> <th>직급</th> </tr>
		<c:forEach var="dto" items="${dao.list() }">
			<tr>
				<td><a href="Privacy.jsp?id=${dto.id }">${dto.name }</a>
				</td>
				<td>${dto.dep }</td>
				<td>${dto.rank }</td>
			</tr>
		</c:forEach>
	</table>
	<button type="button" onclick="location.href='main.jsp'">메인으로</button>
	<button type="button" onclick="location.href='logout.jsp'">로그아웃</button>
</body>
</html>