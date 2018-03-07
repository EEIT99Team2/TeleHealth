<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>視訊健康諮詢</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="<c:url value='forCkeditor/ckeditor/ckeditor.js' />"></script>
<script src="<c:url value='forCkeditor/ckfinder/ckfinder.js' />"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="css/index.css" />
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
</style>
</head>

<body>
	<div class="container">
		<div id='login-page' class="row">
			<div class="col-12 text-center">
				<h2>Login As</h2>
				<input type="text" id="username" /> <input type="button" id="login"
					value="Login" />
			</div>
		</div>
		<div id="call-page" class="row clearfix">
			<div class="col-5 float-left">
				<video id="yours" autoplay muted playsinline></video>
				<video id="theirs" autoplay playsinline></video>
				<input type="text" id="their-username" />
				<input type="button" value="JOIN" id="join" />
				<input type="button" value="call" id="callHere" />
				<input type="button" value="Hang Up" id="hang-up" disabled="disabled" />
			</div>
			<div class="col-7 float-right">
				<h3>XXX，您好</h3>

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
											<label for="comment">Comment:</label>
											<textarea class="form-control" name="content" id="content" rows="10" cols="80"></textarea>
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
	<script type="text/javascript">
	   $(document).ready(function() {
	    CKEDITOR.replace('content',{
	    		filebrowserBrowseUrl : 'forCkeditor/ckfinder/ckfinder.html',
	    		filebrowserImageBrowseUrl : 'forCkeditor/ckfinder/ckfinder.html?type=Images', 
	    		filebrowserFlashBrowseUrl : 'forCkeditor/ckfinder/ckfinder.html?type=Flash',
	    		filebrowserUploadUrl : 'forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files', 
	    		filebrowserImageUploadUrl : 'forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images', 
	    		filebrowserFlashUploadUrl : 'forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash' 	
	    }	 );
	    console.log("ready!");
	   });
  	</script>
	<script src="<c:url value='javascript/client.js' />"></script>
</body>

</html>