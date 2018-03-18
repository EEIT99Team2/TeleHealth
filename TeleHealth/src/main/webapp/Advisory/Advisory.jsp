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
        .in {
            -webkit-filter: grayscale(0);
        }

        .out {
            -webkit-filter: grayscale(1);
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
				<button id="join" class="btn"><img class="phoneBtn" src='<c:url value="/images/joinbutton.png" />'/></button>
				<button id="hang-up" class="btn" disabled="disabled"><img class="phoneBtn" src='<c:url value="/images/hangup.jpg" />'/></button>
				<button id="fullscreen" class="btn"><img class="phoneBtn" src='<c:url value="/images/fullscreen.jpg" />'/></button>
			</div>
		</div>
	</div>
	<!-- 預約結果視窗 -->
<div class="modal fade" id="starUse" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reserveDoneTitle">預約結果</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <img id="imgstar1" class="in" src="<c:url value='img/star.jpg'/>">
        <img id="imgstar2" class="in" src="<c:url value='img/star.jpg'/>">
        <img id="imgstar3" class="in" src="<c:url value='img/star.jpg'/>">
        <img id="imgstar4" class="in" src="<c:url value='img/star.jpg'/>">
        <img id="imgstar5" class="in" src="<c:url value='img/star.jpg'/>">
        <div id="words" class="clickchange"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="starCheck">確認</button>
      </div>
    </div>
  </div>
</div>
	<jsp:include page="/fragment/footer.jsp"/>
	<script src="<c:url value='/js/client.js' />"></script>
</body>
<script>
document.addEventListener("DOMContentLoaded", function () {
    var starimg = document.getElementsByTagName("img");
    var starimgLen = starimg.length;
    for (var i = 0; i < starimgLen; i++) {
        starimg[i].addEventListener("mouseover", mouse0ver);
        starimg[i].addEventListener("mouseout", mouse0ut);
        starimg[i].addEventListener("click", GoClick);
    }
})

$("#hang-up").click(function(){
	$("#starUse").modal("show");
})
$("#starCheck").click(function(){
	var score=$("#words").text().substring(3,4);
	var videoCode=$("#roomName").value();
	$.post("<c:url value='/Advisory/setsatisfy.controller'/>",{"videoCode":videoCode,"satisfy":score},function(result){
			if(result=="success"){
				alert("感謝您的支持，歡迎多加使用");
		})
	$("#starUse").modal("hide");
})


var a = 0;
function mouse0ver() {
    if (a % 2 == 0 || a == 0) {
        var num = this.id.substr(7);
        for (var i = 1; i <= num; i++) {
            document.getElementById("imgstar" + i).className = "in";
            document.getElementById("words").innerHTML = "評價為" + num + "顆星";
            document.getElementById("words").className = "clickstyle";
        }
    }
}
function mouse0ut() {
    if (a % 2 == 0 || a == 0) {
        for (var i = 1; i <= 5; i++) {
            document.getElementById("imgstar" + i).className = "out";
            document.getElementById("words").innerHTML="";
        }
    }
}
function GoClick() {
    var num = this.id.substr(7);
    for (var i = 1; i <= num; i++) {
        document.getElementById("imgstar" + i).className = "in";
    }
    document.getElementById("words").className = "clickchange";
    a++;
}

</script>
</html>