<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
	<!-- 타 게시판에서 마이페이지 버튼 클릭 됨 -->
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.0/jquery.min.js"></script>
	<style>
	nav.navbar-findcond {
		background: #fff;
		border-color: #ccc;
		box-shadow: 0 0 2px 0 #ccc;
	}
	
	nav.navbar-findcond a {
		color: #f14444;
	}
	
	nav.navbar-findcond ul.navbar-nav a {
		color: #f14444;
		border-style: solid;
		border-width: 0 0 2px 0;
		border-color: #fff;
	}
	
	nav.navbar-findcond ul.navbar-nav a:hover, nav.navbar-findcond ul.navbar-nav a:visited,
		nav.navbar-findcond ul.navbar-nav a:focus, nav.navbar-findcond ul.navbar-nav a:active
		{
		background: #fff;
	}
	
	nav.navbar-findcond ul.navbar-nav a:hover {
		border-color: #f14444;
	}
	
	nav.navbar-findcond li.divider {
		background: #ccc;
	}
	
	nav.navbar-findcond button.navbar-toggle {
		background: #f14444;
		border-radius: 2px;
	}
	
	nav.navbar-findcond button.navbar-toggle:hover {
		background: #999;
	}
	
	nav.navbar-findcond button.navbar-toggle>span.icon-bar {
		background: #fff;
	}
	
	nav.navbar-findcond ul.dropdown-menu {
		border: 0;
		background: #fff;
		border-radius: 4px;
		margin: 4px 0;
		box-shadow: 0 0 4px 0 #ccc;
	}
	
	nav.navbar-findcond ul.dropdown-menu>li>a {
		color: #444;
	}
	
	nav.navbar-findcond ul.dropdown-menu>li>a:hover {
		background: #f14444;
		color: #fff;
	}
	
	nav.navbar-findcond span.badge {
		background: #f14444;
		font-weight: normal;
		font-size: 11px;
		margin: 0 4px;
	}
	
	nav.navbar-findcond span.badge.new {
		background: rgba(255, 0, 0, 0.8);
		color: #fff;
	}
	</style>
</head>
<body>
	<nav class="navbar navbar-findcond">
		<div class="container">
			<!-- 모바일 사이즈 -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/webPage/hf/main.jsp">WEBPAGE</a>
			</div>

			<!-- 웹 사이즈 -->
			<div class="collapse navbar-collapse" id="navbar">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="/webPage/board/list.jsp">전체글보기<span class="sr-only"></span></a></li>
					<li class="active"><a href="/webPage/board/selectList.jsp?id=free">자유게시판<span class="sr-only"></span></a></li>
					<li class="active"><a href="/webPage/board/selectList.jsp?id=fun">유머게시판<span class="sr-only"></span></a></li>
					<li class="active"><a href="/webPage/board/selectList.jsp?id=ask">질문게시판<span class="sr-only"></span></a></li>
					<li class="active"><a href="/webPage/board/selectList.jsp?id=tip">정보게시판<span class="sr-only"></span></a></li>
					
					<c:choose>
						<c:when test="${sessionScope.s_id == null}">
							<li class="active"><a href="/webPage/user/login.jsp">로그인<span class="sr-only"></span></a></li>
						</c:when>
						<c:otherwise>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-expanded="false">마이페이지<span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/webPage/user/userPage.jsp">내 정보 보기</a></li>
									<li><a href="/webPage/user/logout.jsp">로그아웃</a></li>
								</ul>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>























