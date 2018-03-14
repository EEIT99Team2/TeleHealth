<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<c:if test="${not empty requestURI}">
	<meta http-equiv="refresh" content="0;url=${checkLoginRequestURI}">
</c:if>
<title>Title Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
			<!-- 上下左右都有padding -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle='collapse' data-target='.navbar-ex1-collapse'>
				<!-- 那個點很重要 -->
					<span class="sr-only">選單切換</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value="../index.jsp"/>">TeleHealth</a>
			</div>
			<!-- 刪除預設padding margin -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="Members04.jsp">會員專區</a></li>
					<li><a href="Members02.jsp">修改會員資料</a></li>
					<li><a href="Members03.jsp">修改會員密碼</a></li>
					<li><a href='<c:url value="/AdvisoryMoment/Advisory.jsp" />'>視訊健康諮詢</a></li>
					<li><a href=<c:url value="/healthcolumn/questionMempublish.jsp" />>會員</a></li>
				</ul>
						<!--上下margin左右padding  / 被float right推過去 -->
				<form class="navbar-form navbar-left" role="search">
								<!-- 使用inline-block -->
					<div class="form-group">
											<!-- 文字欄位 -->
						<input type="text" class="form-control" placeholder="請輸入關鍵字">
					</div>
													<!-- 顏色白色 -->
					<button type="submit" class="btn btn-default">搜尋</button>
				</form>
							<!-- 被float right推過去 -->
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">${LoginOK.memName}  會員 您好</a></li>
					<c:if test="${ ! empty LoginOK }">
					<li><a href="<c:url value='/Members/Logout.jsp' />">登出</a></li>
				</c:if>
					<li><a href="Members05.jsp">個人設定</a></li>
					<!-- li裡面還有ul !!! -->
					<!-- 按下後，增加class open -->
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">繁體中文 <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">繁體中文</a></li>
							<li><a href="#">English</a></li>
							<li><a href="#">日本語</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
			會原04	會原04	會原04	會原04	會原04

</body>
</html>