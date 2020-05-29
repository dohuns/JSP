<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script src="http:www.code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<fmt:requestEncoding value="UTF-8"/>
	
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<c:set var="member" value="${dao.memberInfo(param.id) }"/>
	
	
	<c:choose>
	<c:when test="${sessionScope.sessionId == param.id}">
	
	<div class="container" align="center">
		<table>
			<thaed>
				<tr>
					<th colspan="3"> <h1>${member.getName()}님 정보</h1>
				<tr>
			</thaed>
			<tbody>
				<tr style="font-size:20px">
					<th style="height:35px;"align="center"> <br><br>이름 </th>
					<th align="center"> <br><br>${member.getName()} </th>
				</tr>
				<tr style="font-size:20px">
					<th style="height:35px;"align="center"> <br>부서 </th>
					<th align="center"> <br>${member.getDepart()} </th>
				</tr>
				<tr style="font-size:20px">
					<th style="height:35px;"align="center"> <br>직급 </th>
					<th align="center"> <br>${member.getRank()} </th>
				</tr>
			</tbody>
		</table>
	</div>
	</c:when>
	<c:otherwise>
		<h1> 
			회원님의 ID : ${sessionScope.sessionId}입니다. <br>
			본인 정보만 확인이 가능합니다.
		</h1>
		
	</c:otherwise>
	</c:choose>
</body>
</html>