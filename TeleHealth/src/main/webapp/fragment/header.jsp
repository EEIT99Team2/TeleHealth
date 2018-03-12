<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Bootstrap core CSS -->
<script src='https://www.google.com/recaptcha/api.js'></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/w3.css"/>">
<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/index.css"/>" />
<!-- Navigation -->
<header>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top w3-black">
		<a class="navbar-brand" href="#">牽伴 健康諮詢平台</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse w3-center" id="navbarCollapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value="/healthcolumn/HealthColumn.jsp"/>">健康專欄 <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#team">醫師介紹</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#pricing">方案介紹</a>
				</li>
				<c:if test="${not empty LoginOK}">
					<li class="nav-item"><a class="nav-link" href="#pricing">健康護照</a>
					</li>
				</c:if>
				<c:if test="${not empty LoginOK}">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/AdvisoryMoment/AdvisoryMoment.jsp'/>">預約時刻</a>
					</li>
				</c:if>
				<c:if test="${not empty LoginOK}">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/Members/Members02.jsp'/>">會員專區</a></li>
				</c:if>
			</ul>
			<c:if test="${empty LoginOK}">
				<button type="button" class="btn btn-sm btn-outline-secondary"
					id="myBtn">
					<c:out value="Login" />
				</button>
			</c:if>
			<c:if test="${not empty LoginOK}">
				<p>
					<c:out value="${LoginOK.memName},你好!!" />
				</p>
				<a href="<c:url value='/Members/Logout.jsp' />"><button
						class="btn btn-sm btn-outline-secondary" id="myBtn1">登出</button></a>
			</c:if>
		</div>
	</nav>
	<!--         <script> -->
	<!-- 		document.getElementById('myBtn').addEventListener('click', function() { -->
	<!-- 		$('#rememberMe').append("<div class='g-recaptcha' data-sitekey='6LezzksUAAAAAAllmloZ5Z29laYoc1KZ4GTsW7ry'></div>"); -->

	<!-- 		}); -->
	<!--     	</script>  -->
</header>
