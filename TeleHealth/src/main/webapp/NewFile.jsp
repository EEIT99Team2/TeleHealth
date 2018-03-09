<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test Image</title>
</head>
<body>
<!-- 	<div class="container"> -->
<!-- 		<img alt="img error" src="/TeleHealth/getImage.controller" /> -->
<!-- 	</div> -->
	
	<div class="container">
		<img id="identity" alt="img error" src="/TeleHealth/verificationcode.controller" />
		<input type="button" id="btn" value="換張圖片" />
	</div>
	<iframe src="http://www.fda.gov.tw/MLMS/ShowFile.aspx?LicId=01031980&Seq=236&Type=10" 
	 style="width:600px; height:500px;" frameborder="0">
	</iframe>
	
	<script>
		var identityImage = document.getElementById("identity");
		var changeBtn = document.getElementById("btn")
		function reloadImage() {
			changeBtn.disabled = true;
			identityImage.src = "/TeleHealth/verificationcode.controller?ts=" + new Date().getTime();
		}
		identityImage.addEventListener("load", function() {
			changeBtn.disabled = false;
		});
		changeBtn.addEventListener("click", reloadImage);
	</script>
	
	<iframe src="http://docs.google.com/gview?url=http://www.fda.gov.tw/MLMS/ShowFile.aspx?LicId=02026075&Seq=001&Type=10" style="width:600px; height:500px;" frameborder="0"></iframe>
</body>
</html>