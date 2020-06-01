<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script src="http.code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib	uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<fmt:requestEncoding value="UTF-8"/>
	
	<jsp:include page="../report-default/header.jsp"/>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
		
	<div class="container" align="center">
		<table class="table-striped" style="marging:0 auto; width:80%;" >
			<thead>
				<th colspan="3"><h1 style="font-size:50px" align="center"> Member List </h1></th>
			</thead>
			<tbody>
				<tr style="font-size:20px">
					<th style="height:35px; text-align:center"> 이름 </th>
					<th style="text-align:center"> 부서 </th>
					<th style="text-align:center"> 직급 </th>
				</tr>
				<c:forEach var="list" items="${dao.list()}">
					<tr style="font-size:15px">
						<td style="height:35px; text-align:center">
							<a href="memberInfo.jsp?id=${list.getId()}">${list.getName()}</a>
						</td>
						<td style="text-align:center"> ${list.getDepart()} </td>
						<td style="text-align:center"> ${list.getRank()} </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
	</div>
	
	
	<jsp:include page="../report-default/footer.jsp"/>

</body>
</html>