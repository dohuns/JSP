<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write_view</title>
<style>
table {
	width: 700px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 8px;
}

.t {
	text-align: center;
}
</style>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:include page="../default/header.jsp"/>
	<c:if test="${sessionScope.u_id == null }">
		<script type="text/javascript">
			alert("로그인을 해주세요")
			location.href="../login/login.jsp"
		</script>
	</c:if>
	<div align="center">
		<form action="write_save.jsp" method="post">
		<input type="hidden" name="b_id" value="${sessionScope.u_id }">
		<input type="hidden" name="b_nick" value="${sessionScope.u_nick }">
			<table>
			<p>
			<caption>
				<font size="6">게시글 작성</font>
			</caption>
				<tr>
					<td class="t" width="100px;">카테고리</td>
					<td><select name="b_category">
							<option value="자유" <c:if test="${param.category == '자유'}">selected</c:if>>자유 게시판</option>
							<option value="유머" <c:if test="${param.category == '유머'}">selected</c:if>>유머 게시판</option>
							<option value="질문" <c:if test="${param.category == '질문'}">selected</c:if>>질문 게시판</option>
							<option value="팁" <c:if test="${param.category == '팁'}">selected</c:if>>팁 게시판</option>
					</select></td>
				</tr>
				<tr>
					<td class="t">제목</td>
					<td><input type="text" name="b_title" size="50"></td>
				</tr>
				<tr>
					<td class="t">내용</td>
					<td><textarea name="b_content" rows="10" cols="52" style="resize: none;"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="작성">&nbsp;&nbsp;
						<button type="button" onclick="location.href='boardMain.jsp'">목록보기</button>
					</td>
				</tr>
			</p>
			</table>
		</form>
	</div>
	<jsp:include page="../default/footer.jsp"/>
</body>
</html>