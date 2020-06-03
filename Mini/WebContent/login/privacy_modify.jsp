<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="User.UserDAO"/>
	<jsp:useBean id="dto" class="User.UserDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	${dao.modify(dto) }
	<script type="text/javascript">
	alert("정보가 수정되었습니다.")
	history.back()
	</script>
</body>
</html>