<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	

<jsp:useBean id="dao" class="members.MemberDAO"/>
<c:set var="dto" value="${dao.chkLogin(param.id) }"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function chkDel() {
		var result = confirm("정말로 삭제 하시겠습니까?");
		if(result) {
			location.href="delete.jsp?id=${dto.getId()}"
		} 
	}
</script>
</head>
<body>
	<jsp:include page="../quiz-default/header.jsp"/>
		<div align="center">
			<h1> 개인 정보 </h1>
		</div>
		<div align="center">
			<table>
				<tr>
					<th style="width:100px; text-align:center">아  이  디 </th>
					<td style="width:100px">${dto.getId()}</td>
				</tr>
				<tr>
					<th style="text-align:center">비밀번호</th>
					<td>${dto.getPwd()}</td>
				</tr>
				<tr>
					<th style="text-align:center">이  름</th>
					<td>${dto.getName()}</td>
				</tr>
				<tr>
					<th style="text-align:center">주  소</th>
					<td>${dto.getAddr()}</td>
				</tr>
				<tr>
					<th style="text-align:center">전화번호</th>
					<td>${dto.getTel()}</td>
				</tr>
				<tr>
					<td style="text-align:center"> 
						<button type="button" onclick="location.href='modify.jsp?id=${dto.getId()}'">수  정</button>
					</td>
					<td> 
						<button type="button" onclick="chkDel()">삭  제</button>
					</td>
				</tr>
			</table>
		</div>
	<jsp:include page="../quiz-default/footer.jsp"/>
</body>
</html>