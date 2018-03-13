<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Bootstrap core JavaScript -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- Bootstrap core CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">

<!-- w3 core CSS -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="<c:url value="/css/agency.css" />" rel="stylesheet">
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark" id="mainNavB">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"><img
			alt="Logo" src="<c:url value="/images/logo.png" />" /></a>
		<span class="navbar-brand">牽伴健康諮詢平台</span>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fa fa-bars"></i>
		</button>

		<div class="text-center">
			<c:if test="${empty empLoginOK}">
				<button type="button" class="btn btn-primary btn-rounded" 
					data-toggle="modal" id="myBtn">登入</button>
			</c:if>
			<c:if test="${not empty empLoginOK}">
				<span>
					<c:out value="${empLoginOK.empName},你好!!" />
				</span>
				<a href="<c:url value='/Members/Logout.jsp' />">
					<button class="btn btn-sm btn-outline-secondary" 
					id="myBtn1">登出</button>
				</a>
			</c:if>				
				
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
                                <label for="usrname"><span class="fa fa-user"></span> 帳號</label>
                                <input type="text" class="form-control" name="usrname" id="usrname" placeholder="Enter email" value="${param.usrname}">
                                <font color="red" size="-1">${MsgMap.errorUsrName}</font>                              
                            </div>
                            <div class="form-group">
                                <label for="psw">
                                    <span class="fa fa-eye"></span> 密碼</label>
                                <input type="password" class="form-control" name="psw" id="psw" placeholder="Enter password">
                            </div>
                            <font color="red" size="-1">${MsgMap.errorPsw}</font>
                            <div class="checkbox" id="rememberMe">
                                <label>
                                    <input type="checkbox" value="" checked /> 記住我
                                </label>
                            </div>
                          	<div class='g-recaptcha' data-sitekey='6LezzksUAAAAAAllmloZ5Z29laYoc1KZ4GTsW7ry'></div>
                            <button type="submit" class="btn btn-success btn-block">登入</button>
                            <button type="submit" class="btn btn-danger btn-block">取消</button>
                        </form>
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>
</div>