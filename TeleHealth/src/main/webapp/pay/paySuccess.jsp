<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功付款</title>
</head>
<body>
	<jsp:include page="/fragment/nav2.jsp" />
	<div class="container col-md-8 col-md-offset-2">
		<div class="card bg-light mb-3">
		  <div class="card-header text-center"><h2>成功付款</h2></div>
		  <div class="card-body">
		    <h5 class="card-title text-center">感謝您購買我們的產品</h5>
		    <br />
			  <a class="btn btn-success btn-block" href="<c:url value="/home.jsp" />">回首頁</a>
		  </div>
		</div>
	</div>
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>