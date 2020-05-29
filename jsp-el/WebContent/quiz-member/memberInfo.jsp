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
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	<c:set var="list" value="${dao.memberView() }"/>
	<jsp:include page="../quiz-default/header.jsp"/>
	
	<c:choose>
		<c:when test="${sessionScope.sessionId == null}">
			<script>
				alert("로그인 후 이용하세요~");
				location.href="login.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<div class="container" style="height:500px;">
			<table class="table-striped" style="margin:0 auto; width:60%; height:60%; text-align:center">
				<thead>
					<tr>
						<td colspan="3">
							<h1>회원 목록</h1>
						</td>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td> <h3>이름</h3> </td>
					<td> <h3>주소</h3> </td>
					<td> <h3>전화번호</h3> </td>
				</tr>
				<c:forEach var="tab" items="${list}">
					<tr>
						<td> <h4><a href="userInfo.jsp?id=${tab.getId()}">${tab.getName()} </a></h4></td>
						<td> <h4>${tab.getAddr()}</h4></td>
						<td> <h4>${tab.getTel()}</h4></td>
					</tr>
				</c:forEach>
				</tbody>			
			</table>
			</div>
		</c:otherwise>
	</c:choose>

	<jsp:include page="../quiz-default/footer.jsp"/>
</body>
</html>