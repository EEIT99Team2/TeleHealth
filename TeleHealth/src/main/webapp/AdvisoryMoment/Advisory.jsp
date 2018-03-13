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
	<script src="<c:url value='/forCkeditor/ckeditor/ckeditor.js' />"></script>
	<script src="<c:url value='/forCkeditor/ckfinder/ckfinder.js' />"></script>
	<div class="container">
<!-- 		<div id='login-page' class="row" > -->
<!-- 			<div class="col-12 text-center" style="height:500px"> -->
<!-- 				<h2>Login As</h2> -->
<!-- 				<input type="text" id="username" /> -->
<!-- 				<input type="button" id="login"	value="Login" /> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div id="call-page" class="row clearfix" style="margin-top: 50px">
			<input type="hidden" id="user" value="${LoginOK.account}" />
			<div class="col-5 float-left">
				<video id="yours" autoplay muted playsinline></video>
				<video id="theirs" autoplay playsinline></video>
				<input type="text" id="roomName" />
				<button id="join" class="btn"><img class="phoneBtn" src='<c:url value="/images/joinbutton.png" />'/></button>
				<button id="hang-up" class="btn" disabled="disabled"><img class="phoneBtn" src='<c:url value="/images/hangup.jpg" />'/></button>
				<button id="fullscreen" class="btn"><img class="phoneBtn" src='<c:url value="/images/fullscreen.jpg" />'/></button>
			</div>
			<div class="col-7 float-right">
				<ul class="nav nav-tabs w3-padding-large" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">Home</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">Profile</a></li>
					<li class="nav-item"><a class="nav-link" id="contact-tab"
						data-toggle="tab" href="#contact" role="tab"
						aria-controls="contact" aria-selected="false">Contact</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<!-- Main Content -->
						<div class="container">
							<div class="row">
								<div class="col-12 mx-auto">
									<form>
										<div class="form-group">
											<label for="comment">視訊概要記錄:</label>
											<textarea class="form-control" name="content" id="content" rows="10" cols="80"></textarea>
										</div>
										<div>
											<button id="commit" class="btn btn-primary">確認送出</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">...</div>
					<div class="tab-pane fade" id="contact" role="tabpanel"
						aria-labelledby="contact-tab">...</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/fragment/footer.jsp"/>
	<script type="text/javascript">
	   $(document).ready(function() {
		    CKEDITOR.replace('content',{
		    		filebrowserBrowseUrl : 'forCkeditor/ckfinder/ckfinder.html',
		    		filebrowserImageBrowseUrl : 'forCkeditor/ckfinder/ckfinder.html?type=Images', 
		    		filebrowserFlashBrowseUrl : 'forCkeditor/ckfinder/ckfinder.html?type=Flash',
		    		filebrowserUploadUrl : 'forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files', 
		    		filebrowserImageUploadUrl : 'forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images', 
		    		filebrowserFlashUploadUrl : 'forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash' 	
		    });
		    console.log("ready!");
	    	$('#commit').click(insert);
		    
	    });
		function insert() {
			var descrip=$("#content").text;
			var memId=xxx;
			var empId=xxx;
			var videoCode=xxx;
			$.getJSON("/TeleHealth/Advisory/doctorinsert.controller", {memberId:memId,empId:empId,descrip:descrip,videoCode:videoCode}, function(datas) {
					console.log(datas);
					if(datas=="success"){
						console.log("xx");
					} else{
						alert("新增失敗，請重新輸入!");
					}
			});		
		}
  	</script>
	<script src="<c:url value='/js/client.js' />"></script>
</body>

</html>