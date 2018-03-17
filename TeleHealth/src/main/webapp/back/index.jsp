<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>後台管理</title>
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap core CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"	rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="<c:url value='/css/sb-admin.min.css'/>" rel="stylesheet">
  <!-- w3 core CSS -->
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <!-- 引入字型 -->
  <link href="<c:url value='/css/fonts/fontstyle.css'/>"  rel="stylesheet" type='text/css' >
  <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
  <script src="<c:url value='/fullCalendar/moment.min.js'/>"></script>
  <style type="text/css">
  .navFontSize{font-size:20px;
  				font-family:CJKtc_Bold;}
  .rightNav{display:inline;}
  </style>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand navFontSize" href="index.jsp"><img
			alt="Logo" src="<c:url value="/images/logo.png" />" />牽伴健康諮詢平台-後台管理系統</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
      	<li class="nav-item" data-toggle="tooltip" data-placement="right" title="memberManger">
          <div id="memBtn" class="nav-link navFontSize">
            <div class="col-4 rightNav"><i class="fas fa-users"></i></div>
            <div class="col-8 rightNav"><span class="nav-link-text rightNav">會員管理</span></div>
          </div>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="msgManger">
          <div id="msgBtn" class="nav-link navFontSize">
            <div class="col-4 rightNav"><i class="fas fa-comment-alt "></i></div>
            <div class="col-8 rightNav"><span class="nav-link-text rightNav ">線上客服</span></div>
          </div>
        </li>       
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="columnManger">
          <div id="colBtn" class="nav-link navFontSize">
            <div class="col-4 rightNav"><i class="fa fa-fw fa-table"></i></div>
            <div class="col-8 rightNav"><span class="nav-link-text rightNav">專欄管理</span></div>
          </div>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="takeoffManger">
          <div id="empBtn" class="nav-link navFontSize">
            <div class="col-4 rightNav"><i class="fas fa-address-card"></i></div>
            <div class="col-8 rightNav"><span class="nav-link-text rightNav">假勤管理</span></div>
          </div>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="takeoffManger">
          <div id="financialBtn" class="nav-link navFontSize">
            <div class="col-4 rightNav"><i class="fas fa-chart-bar"></i></div>
            <div class="col-8 rightNav"><span class="nav-link-text rightNav">儲值紀錄</span></div>
          </div>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">       
        <li class="nav-item">
          <a class="nav-link  navFontSize" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-sign-out-alt"></i>登出</a>
        </li>
      </ul>
    </div>
  </nav>
  <input type="hidden" value="${empLoginOK.empId}" id="empId" />
    <div id="memberManger" class="content-wrapper" style="display:block">222</div>
    <div id="msgManger" class="content-wrapper" style="display:none"><jsp:include page="/back/CustomService.jsp" /></div>
    <div id="columnManger" class="content-wrapper" style="display:none"><jsp:include page="/back/totalpublish.jsp" /></div>
    <div id="takeoffManger" class="content-wrapper" style="display:none"><jsp:include page="/back/takeoffSystem.jsp" /></div>
    <div id="financialManger" class="content-wrapper" style="display:none">555</div>
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © TeleHealth 2018</small>
        </div>
      </div>
    </footer>
  
<!-----------------------------------------    Script檔   -------------------------------->
    <script src="<c:url value='/js/bootstrap.bundle.min.js'/>"></script>
    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/js/jquery.easing.min.js'/>"></script>
    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/js/sb-admin.min.js'/>"></script>

<script type="text/javascript">
$().ready(function(){
	//線上客服
	$("#msgBtn").click(function(){
			$("#memberManger").css("display","none");
			$("#columnManger").css("display","none");
			$("#takeoffManger").css("display","none");
			$("#financialManger").css("display","none");
			$("#msgManger").css("display","block");
		})
	//會員管理
	$("#memBtn").click(function(){
			$("#columnManger").css("display","none");
			$("#takeoffManger").css("display","none");
			$("#msgManger").css("display","none");
			$("#financialManger").css("display","none");
			$("#memberManger").css("display","block");
		})
	//專欄管理
	$("#colBtn").click(function(){
			$("#memberManger").css("display","none");
			$("#takeoffManger").css("display","none");
			$("#msgManger").css("display","none");
			$("#financialManger").css("display","none");
			$("#columnManger").css("display","block");
		})
	//員工管理
	$("#empBtn").click(function(){
			$("#memberManger").css("display","none");
			$("#columnManger").css("display","none");
			$("#msgManger").css("display","none");
			$("#financialManger").css("display","none");
			$("#takeoffManger").css("display","block");
		})
	//財務報表
	$("#financialBtn").click(function(){
			$("#memberManger").css("display","none");
			$("#columnManger").css("display","none");
			$("#msgManger").css("display","none");
			$("#takeoffManger").css("display","none");
			$("#financialManger").css("display","block");
		})
	
})

</script>
</body>
</html>
