<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>視訊健康諮詢</title>
<link rel="stylesheet" type="text/css"
	href="/TeleHealth/css/fonts/fontstyle.css" />
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

	<input type="hidden" id="roomName"
		value="${sessionScope.advisory.videoCode}" />
	<input type="hidden" id="memberId" value="${sessionScope.advisory.memberId}E231B9D2-0685-4C7F-A601-6A9E0A41D14B" />
	<input type="hidden" id="gender" value="M" />
	<input type="hidden" id="realage" value="1986-01-01" />
	<script src="<c:url value='/forCkeditor/ckeditor/ckeditor.js' />"></script>
	<script src="<c:url value='/forCkeditor/ckfinder/ckfinder.js' />"></script>
	<div class="container">
		<div id="call-page" class="row clearfix" style="margin-top: 50px">
			<input type="hidden" id="user" value="${empLoginOK.account}" />
			<div class="col-5 float-left">
				<video id="yours" autoplay muted playsinline></video>
				<video id="theirs" autoplay playsinline></video>
				<button id="join" class="btn">
					<img class="phoneBtn"
						src='<c:url value="/images/joinbutton.png" />' />
				</button>
				<button id="hang-up" class="btn" disabled="disabled">
					<img class="phoneBtn" src='<c:url value="/images/hangup.jpg" />' />
				</button>
				<button id="fullscreen" class="btn">
					<img class="phoneBtn"
						src='<c:url value="/images/fullscreen.jpg" />' />
				</button>
			</div>
			<div class="col-7 float-right">
				<ul class="nav nav-tabs w3-padding-large" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">諮詢摘要</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">BMI</a></li>
					<li class="nav-item"><a class="nav-link" id="contact-tab"
						data-toggle="tab" href="#contact" role="tab"
						aria-controls="contact" aria-selected="false">血壓</a></li>
					<li class="nav-item"><a class="nav-link" id="contact1-tab"
						data-toggle="tab" href="#contact1" role="tab"
						aria-controls="contact" aria-selected="false">血糖</a></li>
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
											<textarea class="form-control" id="contents" rows="10"
												cols="80"></textarea>
										</div>
									</form>
									<div>
										<button id="sendContent" class="btn btn-primary">確認送出</button>
										<span id="showResultMsg"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<div class="container">
							<div class="row">
								<div class="col-12 text-center">
									<div class="card card-body table-responsive">
										<div>
											<button type="button" id='bmiweek'
												class="btn btn-outline-primary">一星期</button>
											<button type="button" id='bmimonth'
												class="btn btn-outline-primary">一個月</button>
											<button type="button" id='bmithreemonth'
												class="btn btn-outline-primary">三個月</button>
										</div>
										<div id="mychart1div">
											<!-- 圖表 -->
											<canvas id="mychart1" height="200" width="400"></canvas>
										</div>
										<hr>
										<table id='bmiTable' width="100%"
											class="table table-bordered table-striped table-hover ">
											<thead class="table-dark">
												<tr>
													<th scope="col">身高</th>
													<th scope="col">體重</th>
													<th scope="col">BMI</th>
													<th scope="col">結果</th>
													<th scope="col">輸入時間</th>
												</tr>
											</thead>
											<tbody>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="contact" role="tabpanel"
						aria-labelledby="contact-tab">
						<div class="row">
							<div class="col-12 text-center">
								<div class="card card-body">
									<div>
										<button type="button" id='bpweek'
											class="btn btn-outline-primary">一星期</button>
										<button type="button" id='bpmonth'
											class="btn btn-outline-primary">一個月</button>
										<button type="button" id='bpthreemonth'
											class="btn btn-outline-primary">三個月</button>
									</div>
									<div id="mychart2div">
										<!-- 圖表 -->
										<canvas id="mychart2" height="200" width="400"></canvas>
									</div>
									<hr>
									<table id='bpTable' width="100%"
										class="table table-bordered table-striped table-hover ">
										<thead class="table-dark">
											<tr>
												<th scope="col">收縮壓</th>
												<th scope="col">舒張壓</th>
												<th scope="col">脈搏</th>
												<th scope="col">結果</th>
												<th scope="col">輸入時間</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="contact1" role="tabpanel"
						aria-labelledby="contact-tab">
						<div class="row">
							<div class="col-12 text-center">
								<div class="card card-body">
									<div>
										<button type="button" id='bsweek'
											class="btn btn-outline-primary">一星期</button>
										<button type="button" id='bsmonth'
											class="btn btn-outline-primary">一個月</button>
										<button type="button" id='bsthreemonth'
											class="btn btn-outline-primary">三個月</button>
									</div>
									<div id="mychart3div">
										<canvas id="mychart3" height="200" width="400"></canvas>
									</div>
									<hr>
									<table id='bsTable' width="100%"
										class="table table-bordered table-striped table-hover ">
										<thead class="table-dark">
											<tr>
												<th scope="col">血糖值</th>
												<th scope="col">結果</th>
												<th scope="col">輸入時間</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<script	src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script>	
<script src="<c:url value='/fullCalendar/moment.min.js'/>"></script>
<script src="<c:url value='/js/healthpassport.js' />"></script>
<script type="text/javascript">				
	   $(document).ready(function() {		   
		    CKEDITOR.replace('contents',{
		    		filebrowserBrowseUrl : '/TeleHealth/forCkeditor/ckfinder/ckfinder.html',
		    		filebrowserImageBrowseUrl : '/TeleHealth/forCkeditor/ckfinder/ckfinder.html?type=Images', 
		    		filebrowserFlashBrowseUrl : '/TeleHealth/forCkeditor/ckfinder/ckfinder.html?type=Flash',
		    		filebrowserUploadUrl : '/TeleHealth/forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files', 
		    		filebrowserImageUploadUrl : '/TeleHealth/forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images', 
		    		filebrowserFlashUploadUrl : '/TeleHealth/forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash' 	
		    });
		    console.log("ready!");
		   ///改 
// 		    var memberId=$('#memberId').val();
// 			$.getJSON("<c:url value='/Advisorymember.controller'/>",{memberId:memberId},function(data){
// 					$('#gender').val(data.gender);
// 					$('#realage').val(data.birth);
// 				});
		    });
	    
	   	$('#sendContent').click(insert);
		function insert() {
			var descripIn= CKEDITOR.instances.contents.getData();
			var videoCode= $('#roomName').val();
			console.log("descripIn="+ descripIn + ",videoCode=" + videoCode);
			$.getJSON('/TeleHealth/advisorycontent.controller', {"videoCode":videoCode, "descrip":descripIn}, function(datas) {
				console.log(datas);
				if(datas=="insert.success"){
					alert("諮詢概要新增成功，結束視訊!")
					$('#showResultMsg').text("新增成功!");
					window.location.href = "/TeleHefalth/AdvisoryMoment/AdvisoryRecordEmp.jsp";
				} else{
					$('#showResultMsg').text("新增失敗，請重新確認!");
				}
			});		
		}
  	</script>
	<script src="<c:url value='/js/client.js' />"></script>
</body>

</html>