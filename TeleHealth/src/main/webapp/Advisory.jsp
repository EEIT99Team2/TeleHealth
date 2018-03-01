<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>視訊健康諮詢</title>

<style>
body {
	background-color: #3D6DF2;
	margin-top: 15px;
	font-family: sans-serif;
	color: white
}

video {
	background: black;
	border: 1px solid gray;
}

.page {
	position: relative;
	display: block;
	margin: 0 auto;
	width: 900px;
	height: 900px;
}

#yours {
	width: 150px;
	height: 150px;
	position: absolute;
	top: 0px;
	right: 0px;
}

#theirs {
	width: 900px;
	height: 650px;
}

</style>
</head>

<body>
	<div id='login-page' class="page">
		<h2>Login As</h2>
		<input type="text" id="username" />
		<input type="button" id="login" value="Login" />
	</div>
	<div id='call-page' class="page">
		<video id="yours" autoplay muted playsinline></video>
		<video id="theirs" autoplay playsinline></video>
		<br>
		<input type="text" id="their-username" />
		<input type="button" value="call" id="callHere" />
		<input type="button" value="Hang Up" id="hang-up" />
	</div>
	
	<script src="<c:url value='javascript/client.js' />"></script>
</body>

</html>