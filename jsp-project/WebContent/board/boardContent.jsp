<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" href="../css/bootstrap.css"/>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../js/bootstrap.js"></script>
<style>
.contentBox{
	border: 1px solid #eee;
	width:1000px;
	border-radius : 20px;
	margin : 29px;
}
.lb1 {
	font-size: 14px;
	margin-top:10px;
	margin-bottom:0px;
	
}
.middleBox{
	border: 1px solid #eee;
	width:1000px;
}
.date {
	color: #848484;
	font-family: tahoma;
	font-size: 8px;
}

.replyBox{
	border: 1px solid #eee;
	width:1000px;
	border-radius : 20px;
}	
.replyBox{
	border: 1px solid #eee;
	width:900px;
	border-radius : 20px;
}	
textarea{
	outline:none;
}





</style>
<script type="text/javascript">	
	function addReply(nick) {
		// 줄 개행을 인식해주는 코드///////////////
		var str = $('#comment').val();

		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

		$('#comment').val(str);
		//////////////////////////
		var datas = "r_num="+${param.b_num} +
					"&r_nick="+ nick +
					"&r_content="+$("#comment").val();
		console.log(datas);
		$.ajax({
			type:"POST",
			url:"writeReply.jsp",
			data:datas,
			success:function(args) {
				$("#comment").val("");
				$("#label1").html(args);
			},
			error:function(e) {
				alert("에러!!");
			}
		});
		
	}
	function replyDelete(masterId) {
		var flag = confirm("정말로 삭제 하시겠습니까?")
		if(flag) {
			var datas = "r_num="+${param.b_num} +
						"&r_masterId="+masterId;
			
			$.ajax({
				type:"POST",
				url:"deleteReply.jsp",
				data:datas,
				success:function(args) {
					$("#label1").html(args);
				},
				error:function(e) {
					alert("에러!!");
				}
			});
		}
	}
	
	function replyInputModify(masterId) {
		var datas = "r_num="+${param.b_num} +
			"&r_masterId="+masterId;
		
		$.ajax ({
			type:"POST",
			url:"replyInputModify.jsp",
			data:datas,
			success:function(args) {
				$("#label1").html(args);
			},
			error:function(e) {
				alert("에러!!");
			}
		});
	}
	
	function replySuccessModify(masterId) {
		// 줄 개행을 인식해주는 코드///////////////
		var str = $('#modifyComment').val();

		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');

		$('#modifyComment').val(str);
		//////////////////////////
		console.log("str : " + str);
		 
		var datas = "r_num="+${param.b_num} +
					"&r_masterId="+masterId +
					"&r_content="+$("#modifyComment").val();
		console.log("data" + datas);
		
		console.log(datas);
		$.ajax({
			type:"POST",
			url:"replySuccessModify.jsp",
			data:datas,
			success:function(args) {
				$("#label1").html(args);
			},
			error:function(e) {
				alert("에러!!");
			}
		});
	}
	
	function replyCancelModify() {
		var datas = "r_num="+${param.b_num};
		$.ajax ({
			type:"POST",
			url:"replyCancelModify.jsp",
			data:datas,
			success:function(args) {
				$("#label1").html(args);
			},
			error:function(e) {
				alert("에러!!");
			}
		});
	}
	
	
	$("textarea.autosize").on('keydown keyup', function () {
	  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	});
	
	
	
</script>

</head>
<body>
	<jsp:include page="../HF/header.jsp"/>
	<jsp:useBean id="dao" class="board.boardDAO"/>
	<c:set var="list" value="${dao.showContent(param.b_num)}"/>
	<c:set var="content" value="${list.getVo()}"/>
	<c:set var="arrReply" value="${list.getList()}"/>
	<div align="center">
		<div class="contentBox">
			<div class="container" style="margin-left:5px;" >
				<!-- 카테고리 -->
				<div align="left">
					<a href='boardList.jsp?b_category=${content.b_category}'>
						<label class="lb1">${content.b_category}게시판</label>
					</a>
				</div>
				<!-- 제목 -->
				<div align="left" >
					<h2 style="margin-top:5px">${content.b_title}</h2>
				</div>
				<!-- 닉네임 -->
				<div align="left">
					<h5>${content.b_nick}</h5>
				</div>
				<!-- 작성시간 & 조회수 -->
				<div align="left">
					<h5>${content.b_date}
						조회수 : ${content.b_readNum}
					</h5>
				</div>
				<div align="left">
					<hr style="width:950px; margin-left: 5px;">
					<!-- 게시글 내용 -->
					<div align="left">
						${content.b_content}
					</div>
				</div>
				<div align="left">
				<label id="label1">
						<!-- 댓글 수  -->
						<div align="left" style="margin-top:50px;">
							<img src="댓글.jpeg" style="width:40px; height:30px;"> 댓글 &nbsp;${arrReply.size()}
						</div>
						<hr style="width:900px; margin-left: 5px;">
						<div align="left">
							<h3>댓글</h3><!-- 시간남으면 댓글 -->
						</div>
						
						<c:forEach var="reply" items="${arrReply}">
							<div class="container" style="width:900px;">
								<div>
									<label style="font-size:14px;">${reply.r_nick}</label>
									<label class="date">${reply.r_date}</label>
								</div>
								<div>
									<label style="font-size:14px;">${reply.r_content}</label>
								</div>
								<c:if test="${sessionScope.sessionNick == reply.r_nick}">
									<div align="right">
										<a onclick="replyInputModify(${reply.r_masterId})"> 수정</a> <a onclick="replyDelete(${reply.r_masterId})">삭제</a>
									</div>
								</c:if>
							</div>
								<hr style="width:900px; margin-left: 5px;">
						</c:forEach>
				</label>
				</div>
				<div align="left">
					<div class="replyBox">
						<div>
							<label style="font-size: 14px; margin:10px 0 5px 10px;">${sessionScope.sessionNick}</label>
						</div>
						<div>
							<div style="width:800px;" >
								<textarea rows="1" id="comment" style="resize:none; margin:0 0 10px 8px; border:0px; width:890px;overflow-y:hidden;" placeholder="댓글을 입력하세요"></textarea>
							</div>
							<div style=" margin:0 10px 10px 0; text-align:right;" >
								<button type="button" onclick="addReply('${sessionScope.sessionNick}')" class="btn btn-default" style="border:0px;">댓글 작성</button>
							</div>
						</div>
					</div>
									
					<br>
				</div>
			</div>
			<div align="left" style="margin:0 0 20px 15px; display:flex" >
				<a href="boardWrite.jsp" class="btn btn-success" style="margin:5px;">글 쓰기</a>
				<a href="#" class="btn btn-success" style="margin:5px;">답글</a>
				<c:choose>
					<c:when test="${sessionScope.sessionNick == content.b_nick}">
						<form action="boardModify.jsp" method="POST" style="display:flex">
							<input type="hidden" name="title" value="${content.b_title}">
							<input type="hidden" name="content" value="${content.b_content}">
							<input type="hidden" name="nick" value="${content.b_nick}">
							<input type="hidden" name="b_num" value="${param.b_num}">
							<input type="submit" value="수정" class="btn btn-info" style="margin:5px;">
						</form>
						<a href="boardDelete.jsp?b_num=${param.b_num}" class="btn btn-info" style="margin:5px;">삭제</a>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<script>
	$("textarea").on('keydown keyup', function () {
	  $(this).height(1).height( $(this).prop('scrollHeight')+12 );	
	});
	</script>
	<jsp:include page="../HF/footer.jsp"/>
	
</body>
</html>