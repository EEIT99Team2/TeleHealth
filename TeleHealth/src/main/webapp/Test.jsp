<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">    
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	  
	<style>
	  div[class|="col"] {background-color:#EBDEF0; border:0.5px solid purple}
	</style>
</head>
<body>
	<div class="jumbotron text-center">
	  <h1>我的第一个 Bootstrap 页面</h1>
	  <p>重置浏览器大小查看效果!</p> 
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<header>
					<h1>頁首</h1>
				</header>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-2">
				<nav>
					<h1>導覽列</h1>
				</nav>
			</div>
			<div class="col-xs-12 col-sm-8 col-md-6">
				<article>
					<h1>內容區</h1>
				</article>
			</div>
			<div class="col-xs-12 col-sm-4 col-md-4">
				<aside>
					<h1>側邊欄</h1>				
				</aside>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<footer>
					<h1>頁尾</h1>
				</footer>
			</div>
		</div>
	</div>
</body>
</html>