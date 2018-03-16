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
	background-color: #3D6DF2;
	margin-top: 50px;
	color: white
}

video {
	background: black;
	border: 1px solid gray;
}

#yours {
	width: 35%;
	position: absolute;
	/*  	top: 0px;  */
	/*  	right: 0px;  */
	z-index: 1;
}

#theirs {
	/* 	position: absolute; */
	width: 100%;
	/* 	height: 500px; */
	z-index: 0;
}

.phoneBtn {
	width: 40px;
	height: 25px;
}
</style>
</head>

<body>
	<jsp:include page="/fragment/nav2.jsp" />
	<input type="hidden" id="roomName" value="${sessionScope.advisory.videoCode}" />
	<div class="container">
		<div id="call-page" class="row clearfix" style="margin-top: 50px">
			<input type="hidden" id="user" value="${LoginOK.account}" />
			<div class="col-12">
				<video id="yours" autoplay muted playsinline></video>
				<video id="theirs" autoplay playsinline></video>
<!-- 				<input type="text" id="roomName" /> -->
				<button id="join" class="btn"><img class="phoneBtn" src='<c:url value="/images/joinbutton.png" />'/></button>
				<button id="hang-up" class="btn" disabled="disabled"><img class="phoneBtn" src='<c:url value="/images/hangup.jpg" />'/></button>
				<button id="fullscreen" class="btn"><img class="phoneBtn" src='<c:url value="/images/fullscreen.jpg" />'/></button>
			</div>
		</div>
	</div>
	<jsp:include page="/fragment/footer.jsp"/>
	<script src="<c:url value='/js/client.js' />"></script>
</body>

</html>