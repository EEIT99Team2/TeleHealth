<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
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
				<a class="navbar-brand" href="#">TeleHealth</a>
			</div>
			<!-- 刪除預設padding margin -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="Members03.jsp">會員專區</a></li>
					<li><a href="Members02.jsp">修改會員資料</a></li>
					<li><a href="Members03.jsp">修改會員密碼</a></li>
					<li><a href="Members04.jsp">會員</a></li>
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
					<li><a href="#">會員 您好</a></li>
					<li><a href="#">登出</a></li>
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

		<!-- end of left menu -->
	<div class="context">
		<div style="text-align:center;"><h3 class="title">修改密碼</h3></div>
		<div class="context">
			
			 <form method="post" enctype="multipart/form-data" 
						action="<c:url value="/ModifyPwd.controller"/>">			
				<input type="hidden" name="csrf_test_name" value="fcf6b1a0baf094f4f73b4e3246c3a5d7" />
				<div style="text-align:center;"><p style="margin:0 0 40px;">請輸入您的手機號碼、舊的會員密碼及希望更改的新密碼。</p></div>
				<table width="270" border="0" align="center" cellpadding="0" cellspacing="0" class="table_b">
				
					<tr>
						<td valign="top"><img src="https://s.zimedia.com.tw/s/TZ6BWG-41"></td>
						<td><font size=4><b>請輸入舊的會員密碼</b></font><br>
						<input type="password"
							name="oldpwd" value="${param.oldpwd}" class="fieldWidth"
							style="width: 320px;"> <font color="red" size="-1">${MsgMap.errorOldPwd}</font></td>
					</tr>
					<tr>
						<td valign="top"><img src="https://s.zimedia.com.tw/s/TZ6BWG-41"></td>
						<td><font size=4><b>請輸入新的會員密碼</b></font><br><font color=#808080>(8~16位英數字混合)</font><br>
						<input type="password"
							name="Newpwd" value="${param.Newpwd}" class="fieldWidth"
							style="width: 320px;"> <font color="red" size="-1">${MsgMap.errorNewpwd}</font></td></td>
					</tr>
					<tr>
						<td valign="top"><img src="https://s.zimedia.com.tw/s/TZ6BWG-41"></td>
						<td><font size=4><b>請再輸入一次新密碼</b></font><br>
						<input name="pwdCheck" type="password" value="${param.pwdCheck}" tabindex="5" class="fieldWidth"
							style="width: 320px;"/><font color="red" size="-1">${MsgMap.errorPwdCheck}</font>
					</tr>
					
					<tr>
						<td></td>
						<td>
							<button type="submit" class="btn04">確認</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
		
</body>
</html>