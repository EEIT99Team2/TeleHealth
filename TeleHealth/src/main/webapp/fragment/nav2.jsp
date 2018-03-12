<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" >

	<!-- w3 core CSS -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- Custom fonts for this template -->
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="<c:url value="/css/agency.css" />" rel="stylesheet" >
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark" id="mainNavB">
      <div class="container">
        <a class="navbar-brand" href="#page-top"><img alt="Logo" src="<c:url value="/img/logo.png"/>" /></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
          	<li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#carouselExampleIndicators">健康專欄</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#introduction">簡介</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#team">醫師團隊</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#temp1">Temp1</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#temp2">Temp2</a>
            </li>
          </ul>
        </div>
<div class="text-center">
	<a href="" id="myBtn" class="btn btn-primary btn-rounded" data-toggle="modal" data-target="#darkModalForm">登入</a>
</div>
      </div>
    </nav>

<div class="container">
 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <h4 class="modal-title"><span class="fa fa-lock"></span> 登入</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="usrname"><span class="fa fa-user"></span> 帳號</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="psw"><span class="fa fa-eye"></span> 密碼</label>
              <input type="text" class="form-control" id="psw" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>記住我</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"> 登入</button>
	          <button type="submit" class="btn btn-danger btn-block" data-dismiss="modal"> 取消</button>
          </form>
        </div>
        <div class="modal-footer">
          <p>還不是會員? <a href="#">註冊</a></p>
          <p>忘記 <a href="#">密碼?</a></p>
        </div>
      </div>
      
    </div>
  </div> 
</div>