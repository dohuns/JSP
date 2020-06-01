<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerChk</title>
</head>
<body>
	<fmt:requestEncoding value="UTF-8" />
	<jsp:useBean id="userDao" class="user.UserDAO" />
	<jsp:useBean id="userDto" class="user.UserDTO" />
	<jsp:setProperty property="*" name="userDto"/>
	<c:set var="chk" value="${userDao.chkId(param.u_id)}" />
	<c:choose>
		<c:when test="${chk == 0}">
			<c:set var="result" value="${userDao.registerChk(userDto)}" />
			<c:choose>
				<c:when test="${result > 0}">
					<script>
						alert("회원가입이 완료되었습니다.");
						location.href="login.jsp";
					</script>
				</c:when>
				<c:otherwise>
					<script>
						alert("오류가 발생했습니다.\n관리자에게 문의바랍니다.");
						history.back();
					</script>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${chk == 1}">
			<script>
				alert("이미 존재하는 아이디입니다.");
				history.back();
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("오류가 발생했습니다.\n관리자에게 문의바랍니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>