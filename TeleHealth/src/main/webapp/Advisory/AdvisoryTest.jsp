<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>視訊健康諮詢</title>
<link rel="stylesheet" type="text/css" href="/TeleHealth/css/fonts/fontstyle.css" />
<style>
body {
	margin-top: 50px;
}

.phoneBtn {
	width: 40px;
	height: 25px;
}
</style>
</head>

<body>
	<input type="hidden" id="roomName" value="${sessionScope.advisory.videoCode}" />
	<div class="container">
		<div id="call-page" class="row clearfix" style="margin-top: 50px">
			<input type="hidden" id="user" value="${LoginOK.account}" />
			<div class="col-12">
<!-- 				<textarea rows="20" cols="50" disabled="disabled"></textarea> -->
				<div id="received"></div>
			</div>
			<div>
				<textarea id="messageInput" rows="5" cols="50"></textarea>
			</div>
			<div>
				<button id="send" class="btn"><img class="phoneBtn" src='<c:url value="/images/joinbutton.png" />'/></button>
<%-- 				<button id="send" class="btn"><img class="phoneBtn" src='<c:url value="/images/joinbutton.png" />'/></button> --%>
			</div>
		</div>
	</div>
	<script src="<c:url value='/js/client_test.js' />"></script>
</body>

</html>