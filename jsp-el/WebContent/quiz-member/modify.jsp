<%@page import="members.MemberDAO"%>
<%@page import="members.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MemberDTO dto = new MemberDTO();
	MemberDAO dao = new MemberDAO();
	dto = dao.chkLogin(request.getParameter("id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../quiz-default/header.jsp"/>
	<div align="center">
		<form action="chkModify.jsp">
		<table>
			<tr>
				<th style="text-align:center">이  름</th>
				<td>
					<input type="text" name="name"  value="<%=dto.getName()%>">
				</td>
			</tr>
			<tr>
				<th style="text-align:center">주  소</th>
				<td>
					<input type="text" name="addr"  value="<%=dto.getAddr()%>">
				</td>
			</tr>
			<tr>
				<th style="text-align:center">전화번호</th>
				<td>
					<input type="text" name="tel"  value="<%=dto.getTel()%>">
				</td>
			</tr>
			<tr>
				<th><input type="hidden" name="id" value=<%=dto.getId()%> ></th>
				<td>
					<button type="submit">완료</button>
					<button type="button" onclick="history.back()">뒤로가기</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<jsp:include page="../quiz-default/footer.jsp"/>
	

</body>
</html>