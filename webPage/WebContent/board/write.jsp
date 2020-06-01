<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>글 작성 페이지</title>
		<script type="text/javascript">
			/* 글이 제대로 입력됐는지 확인 */
			function txtChk() {
				if(document.getElementById("title").value == "") {
					alert("제목을 입력해주세요.");
				} else if(document.getElementById("content").value == "") {
					alert("내용을 입력해주세요.");
				} else {
					wForm.submit();
				}
			}
		</script>
	</head>
<body>
	<form action="writeChk.jsp" method="get" id="wForm">
		<input type="hidden" name="b_id">
		<input type="hidden" name="b_nick">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"></td>
				<td>
					<select name="b_category">
						<option value="free" selected="selected">자유 게시판</option>
						<option value="fun">유머 게시판</option>
						<option value="ask">질문 게시판</option>
						<option value="tip">팁 게시판</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" id="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="txtChk()">작성</button>
					<button type="button" onclick="location.href='list.jsp'">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>