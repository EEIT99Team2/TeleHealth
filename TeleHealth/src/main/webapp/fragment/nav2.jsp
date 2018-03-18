<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap core JavaScript -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"	rel="stylesheet">
<!-- w3 core CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- 提醒視訊諮詢的小圖示用 -->
<link href='/TeleHealth/css/advisory.css'  rel="stylesheet" type='text/css' >

<!-- 引入字型 -->
<link href='/TeleHealth/css/fonts/fontstyle.css'  rel="stylesheet" type='text/css' >

<!-- 線上客服用 -->
<link href='/TeleHealth/css/chat.css'  rel="stylesheet" type='text/css' >

<!-- Custom fonts for this template -->
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<!-- 	google 我不是機器人 -->
<script src='https://www.google.com/recaptcha/api.js'></script>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>
<!-- Custom styles for this template -->
<link href="<c:url value="/css/agency.css" />" rel="stylesheet">

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark" id="mainNavB">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="<c:url value="/home.jsp" />">
		<img id="logo" alt="Logo" src="<c:url value="/images/logo.png" />" /></a>
		<span class="navbar-brand">牽伴健康諮詢平台</span>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
		<c:choose>		
		<c:when test="${not empty LoginOK}">
			<ul class="navbar-nav text-uppercase ml-auto">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<c:url value="/healthcolumn/HealthColumn.jsp"/>">健康專欄</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<c:url value="/healthpassport/HealthPassport.jsp" />">健康護照</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<c:url value="/QueryDrugs/Drugs.jsp"/>">藥品查詢</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<c:url value="/AdvisoryMoment/AdvisoryMoment.jsp" />">諮詢預約</a></li>
				<li class="nav-item"><div class="row showIcon"><a class="nav-link" id="advisoryIcon"
					href="<c:url value='/AdvisoryMoment/AdvisoryRecord.jsp' />">健康諮詢</a><span class="text-center" id="advisoryNum"></span></div></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value='/pay/pay.jsp'/>">會員專區</a></li>
			</ul>
		<div class="text-center">
				<img style="width:40px;height:40px;" src="/TeleHealth/getImage.controller" >
				<input type="hidden" value="${LoginOK.memberId}" id="memberId" />
				<input type="hidden" value="${LoginOK.account}" id="account" />
				<form style="display: inline-block" action="<c:url value='/logout.controller' />" method="get">
					<input type="submit" class="btn btn-sm btn-outline-secondary" 
					id="myBtn1" value="登出" />
				</form>
		</div>
			</c:when>
			<c:when test="${not empty empLoginOK}">
			<ul class="navbar-nav text-uppercase ml-auto">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<c:url value="/healthcolumn/HealthColumn.jsp"/>">健康專欄</a></li>
				<li class="nav-item">
					<div class="dropdown nav-link">
						<button class="btn btn-Info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">維護專欄</button>
						<div class="dropdown-menu" aria-labelledby="dropdwonMenuButton">
							<a class="dropdown-item" href="<c:url value="/healthcolumn/createhelcontent.jsp" />">新增專欄文章</a>
							<a class="dropdown-item" href="<c:url value="/healthcolumn/Dpublish.jsp" />">已發佈文章</a>				
						</div>
					</div>
				</li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<c:url value="/QueryDrugs/Drugs.jsp"/>">藥品查詢</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<c:url value="/AdvisoryMoment/EmployeeMoment.jsp" />">查詢班表</a></li>
				<li class="nav-item"><div class="row showIcon"><a class="nav-link" id="advisoryIcon"
					href="<c:url value='/AdvisoryMoment/AdvisoryRecordEmp.jsp' />">健康諮詢</a><span class="text-center" id="advisoryNum"></span></div></li>				
			</ul>
		<div class="text-center">
				<span>
					<c:out value="${empLoginOK.empName},你好!!" />
				</span>
				<input type="hidden" value="${empLoginOK.empId}" id="empId" />
				<form style="display: inline-block" action="<c:url value='/logout.controller' />" method="get">
					<input type="submit" class="btn btn-sm btn-outline-secondary" 
					id="myBtn1" value="登出" />
				</form>
		</div>
			</c:when>
			<c:otherwise>			
			<ul class="navbar-nav text-uppercase ml-auto">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<c:url value="/healthcolumn/HealthColumn.jsp"/>">健康專欄</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#introduction">簡介</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="#team">醫師團隊</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="<c:url value="/QueryDrugs/Drugs.jsp"/>">藥品查詢</a></li>
			</ul>			
			<div class="text-center">
				<button type="button" class="btn btn-primary btn-rounded" 
					data-toggle="modal" id="myBtn">登入</button>
			</div>
			</c:otherwise>
			</c:choose>
		</div>		
	</div>
</nav>
<div class="container">
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<h4 class="modal-title">
						<span class="fa fa-lock"></span> 登入
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form method="post" action="<c:url value="/login.controller"/>">
                            <div class="form-group">
                                <label for="username"><span class="fa fa-user"></span> 帳號</label>
                                <input type="text" class="form-control" name="username" id="username" placeholder="Enter email" value="${sessionScope.user}">
                                <font color="red" size="-1">${MsgMap.errorUserName}</font>                              
                            </div>
                            <div class="form-group">
                                <label for="pwd">
                                    <span class="fa fa-eye"></span> 密碼</label>                  
                                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Enter password" value="${sessionScope.password}">
                            </div>
                            <font color="red" size="-1">${MsgMap.errorPwd}</font>
                            
                            <div class="checkbox" id="rememberMe">
                                <label>
                                     <input type="checkbox" name="remember" 
                                    	<c:if test='${sessionScope.rememberMe==true}'>
						                	checked='checked'
						               	</c:if> 
                                   	 value="true" /> 記住我
                                </label>
                            </div>
                            
<!--                             google 我不是機器人 -->
                          	<div class='g-recaptcha' data-sitekey='6LezzksUAAAAAAllmloZ5Z29laYoc1KZ4GTsW7ry'></div>
                          	<input type="hidden" id="errorMsg" value="${MsgMap}">
                            <button type="submit" class="btn btn-success btn-block">登入</button>
                            <button type="button" class="btn btn-danger btn-block" data-dismiss="modal">取消</button>
                        </form>
				</div>
				<div class="modal-footer">
					<p>
						還不是會員?<a href="<c:url value="/register/register.jsp"/>">註冊</a>
					</p>
					<p>
						忘記 <a href="<c:url value="/register/ForgetPwd.jsp"/>">密碼?</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 提醒視訊諮詢的小圖示用 -->
<script type="text/javascript" src="/TeleHealth/js/showIcon.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>