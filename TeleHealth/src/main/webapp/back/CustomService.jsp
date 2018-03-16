<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin - Start Bootstrap Template</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<style>
.div_right_bottom {
	background: navajowhite;
	width:300px;
	height:300px;
	padding:10px;
	right:0px;
	bottom:0px;
	border:2px solid #69c;
 	display:inline-block;
}
.sendTextArea {
	border: 1px red solid; 
	width: 75%; 
	margin-left: 5px
}
.sendBtn {
	width: 20%; 
	margin-left: 3px;
	float:right;
}

/* Scrollbar styles */
.myBox {
border: none;
padding: 0px;
font: 12px/20px;
width: 100%;
height: 100%;
overflow: scroll;
}

::-webkit-scrollbar {
width: 12px;
height: 12px;
}

::-webkit-scrollbar-track {
box-shadow: inset 0 0 10px olivedrab;
border-radius: 10px;
}

::-webkit-scrollbar-thumb {
border-radius: 10px;
background: yellowgreen; 
box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
}

::-webkit-scrollbar-thumb:hover {
background: #7bac10;
}
</style>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<%-- 	<input id="empId" type="hidden" value="${sessionScope.empLoginOK.empId}" /> --%>
	<input id="empId" type="hidden" value="930F2472-337E-4800-B774-EB0AAE703D2A" />
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="index.jsp"><img alt="Logo"
			src="<c:url value="/images/logo.png" />" />牽伴健康諮詢平台</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link" href="index.jsp"> <i
						class="fa fa-fw fa-dashboard"></i> <span class="nav-link-text">Dashboard</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts"><a class="nav-link" href="charts.jsp"> <i
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Charts</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Tables"><a class="nav-link" href="tables.jsp"> <i
						class="fa fa-fw fa-table"></i> <span class="nav-link-text">Tables</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Components"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseComponents" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-wrench"></i> <span class="nav-link-text">Components</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseComponents">
						<li><a href="navbar.jsp">Navbar</a></li>
						<li><a href="cards.jsp">Cards</a></li>
					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Example Pages"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseExamplePages" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-file"></i> <span class="nav-link-text">Example
							Pages</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseExamplePages">
						<li><a href="login.jsp">Login Page</a></li>
						<li><a href="register.jps">Registration Page</a></li>
						<li><a href="forgot-password.jsp">Forgot Password Page</a></li>
						<li><a href="blank.jsp">Blank Page</a></li>
					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Menu Levels"><a
					class="nav-link nav-link-collapse collapsed" data-toggle="collapse"
					href="#collapseMulti" data-parent="#exampleAccordion"> <i
						class="fa fa-fw fa-sitemap"></i> <span class="nav-link-text">Menu
							Levels</span>
				</a>
					<ul class="sidenav-second-level collapse" id="collapseMulti">
						<li><a href="#">Second Level Item</a></li>
						<li><a href="#">Second Level Item</a></li>
						<li><a href="#">Second Level Item</a></li>
						<li><a class="nav-link-collapse collapsed"
							data-toggle="collapse" href="#collapseMulti2">Third Level</a>
							<ul class="sidenav-third-level collapse" id="collapseMulti2">
								<li><a href="#">Third Level Item</a></li>
								<li><a href="#">Third Level Item</a></li>
								<li><a href="#">Third Level Item</a></li>
							</ul></li>
					</ul></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Link"><a class="nav-link" href="#"> <i
						class="fa fa-fw fa-link"></i> <span class="nav-link-text">Link</span>
				</a></li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-envelope"></i> <span
						class="d-lg-none">Messages <span
							class="badge badge-pill badge-primary">12 New</span>
					</span> <span class="indicator text-primary d-none d-lg-block"> <i
							class="fa fa-fw fa-circle"></i>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="messagesDropdown">
						<h6 class="dropdown-header">New Messages:</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>David
								Miller</strong> <span class="small float-right text-muted">11:21
								AM</span>
							<div class="dropdown-message small">Hey there! This new
								version of SB Admin is pretty awesome! These messages clip off
								when they reach the end of the box so they don't overflow over
								to the sides!</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>Jane Smith</strong>
							<span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">I was wondering if you
								could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <strong>John Doe</strong> <span
							class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">I've sent the final
								files over to you for review. When you're able to sign off of
								them let me know and we can discuss distribution.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="#">View all messages</a>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown"
					href="#" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fa fa-fw fa-bell"></i> <span
						class="d-lg-none">Alerts <span
							class="badge badge-pill badge-warning">6 New</span>
					</span> <span class="indicator text-warning d-none d-lg-block"> <i
							class="fa fa-fw fa-circle"></i>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="alertsDropdown">
						<h6 class="dropdown-header">New Alerts:</h6>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-success">
								<strong> <i class="fa fa-long-arrow-up fa-fw"></i>Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-danger">
								<strong> <i class="fa fa-long-arrow-down fa-fw"></i>Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#"> <span class="text-success">
								<strong> <i class="fa fa-long-arrow-up fa-fw"></i>Status
									Update
							</strong>
						</span> <span class="small float-right text-muted">11:21 AM</span>
							<div class="dropdown-message small">This is an automated
								server response message. All systems are online.</div>
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item small" href="#">View all alerts</a>
					</div></li>
				<li class="nav-item">
					<form class="form-inline my-2 my-lg-0 mr-lg-2">
						<div class="input-group">
							<input class="form-control" type="text"
								placeholder="Search for..."> <span
								class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fa fa-search"></i>
								</button>
							</span>
						</div>
					</form>
				</li>
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fa fa-fw fa-sign-out"></i>登出
				</a></li>
			</ul>
		</div>
	</nav>
	<div id="content" class="content-wrapper">

		<footer class="sticky-footer">
			<div class="container">
				<div class="text-center">
					<small>Copyright © TeleHealth 2018</small>
				</div>
			</div>
		</footer>
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fa fa-angle-up"></i>
		</a>
		<!-- Logout Modal-->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current session.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.jsp">Logout</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript-->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Page level plugin JavaScript-->
		<script src="vendor/chart.js/Chart.min.js"></script>
		<script src="vendor/datatables/jquery.dataTables.js"></script>
		<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="js/sb-admin.min.js"></script>
	</div>
	
<script type="text/javascript">
	var customers = [];

	$(document).ready(function(){

	    $('#customerService2').toggle(1000);
		$('#setHide2').on("click",function() {
			$('#customerService').toggle(1000);
			$('#customerService2').toggle(1000);
		})
		$('#setHide').on("click",function() {
			$('#customerService').toggle(1000);
			$('#customerService2').toggle(1000);
		})
	});
	if($("#empId").val() != "" && $("#empId").val() != null) {
		$(function(){
		    var websocket;
		    var clientName = $("#empId").val();
		    var chater = "";
		    function connectServer() {
				if ("WebSocket" in window) {
					websocket = new WebSocket("wss://192.168.21.76:8443/websocket/echo?name=" + clientName);
				} else if ("MozWebSocket" in window) {
				    alert("MozWebSocket");
				    websocket = new MozWebSocket("ws://echo");
				} else {
				    alert("SockJS");
				    websocket = new SockJS("https://192.168.21.76:8443/websocket/sockjs/echo");
				}
		    }
		    //連線websocket
	    	connectServer();
	    	websocket.onopen = function (evnt) {
				console.log("websocket連接成功!")
	        };
	        websocket.onmessage = function (event) {
		        var customer = event.data.substring(event.data.indexOf(":")+1, event.data.indexOf("，"));
		        var outputMsg = event.data.substring(event.data.indexOf("$")+1);
				if(customer!="" && customer!=null) {
					if(customers.indexOf(customer) < 0) {
			        	customers.push(customer);
			        	var newChat = $('<div></div>').addClass("div_right_bottom").attr("id",customer);
			        	var chatTitle = $('<h4></h4>').text(customer);
			        	var getMsg = $('<div></div>').addClass("well myBox text-left").attr("id",customer+"msg").css("height","70%");
			        	var sendMsg = $('<div></div>').addClass("row").attr("id",customer+"sendMsg").css("margin-left","1px").css("width","100%");
			        	var sendText = $('<textarea></textarea>').attr("id",customer+"Text").addClass("sendTextArea");
			        	var sendBtn = $('<button></button>').attr("id",customer+"Btn").addClass("btn .btn-default sendBtn").text("送出");
			        	sendMsg.append(sendText).append(sendBtn);
			        	newChat.append(chatTitle).append(getMsg).append(sendMsg);
			        	$('#content').append(newChat);
					}
				}
				$("#"+customer+"msg").html($("#"+customer+"msg").html() + customer + ":" +outputMsg);
				$('#'+customer+"msg").css("border","3px solid red");
				$("#"+customer+"msg").animate({scrollTop: $("#"+customer+"msg").offset().top}, 2000);
				
	        };
	        websocket.onerror = function (event) {
	        };
	        websocket.onclose = function (event) {
	        	console.log("websocket連接中斷!");
	        };
		    
		    $("body").on("click", "#content button", function() {
		    	var toUser =  $(this).attr("id").substring(0, $(this).attr("id").indexOf("Btn"));
		    	var message = $(this).parent("div").find("textarea").val();
		    	var showMsg = $(this).parent("div").parent("div").children(".myBox");
		    	send(showMsg,toUser, message);
		        $(this).parent("div").find("textarea").val(" ");
		    });

		    $("body").on("focus", "#content textarea", function() {
		    	$(this).parent("div").find("textarea").css("border", "none");
		    });
		    
		    function send(showMsg, toUser, message){
		        if (websocket != null) {
			    	console.log("toUser=" + toUser);
			    	console.log("message=" + message);
		            var sendMsg = $('<div></div>').text(message);
		            sendMsg.addClass("text-right");
		            showMsg.append(sendMsg);
		            showMsg.animate({scrollTop: showMsg.offset().top}, 2000);
		            if ($.trim(toUser) != "") {
		            	message = toUser + "|" + message;
		            }
		            websocket.send(message);
		        } else {
		            alert("伺服器異常，請速聯繫相關人員排除!");
		        }
		    }
		});
	}

</script>

</body>



</html>
