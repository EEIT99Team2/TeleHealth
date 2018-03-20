<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>	
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密碼</title>
</head>
<body>
<jsp:include page="/fragment/nav2.jsp" />
	<c:set var="memberName" value="${LoginOK.memName}" />
	<c:remove var="LoginOK" scope="session" />
		<div class="row"><p> </p></div>
		<div class="row"><p> </p></div>
		<div class="row"><p> </p></div>
		<div class="row"><p> </p></div>
		<div class="row"><p> </p></div>
	<div style="text-align:center;"><h1>修改密碼成功！請重新登入！謝謝</h1></div>
		<div class="row"><p> </p></div>
		<div class="row"><p> </p></div>
	<div style="text-align:center;"><h4>(3秒後回首頁)<h4></div>
		<div class="row"><p> </p></div>
		<div class="row"><p> </p></div>
	<div style="text-align:center;"><input type="submit" class="btn btn-primary" name="submitBtn" id="submitBtn"value="回主頁" onclick="location.href='../home.jsp'" ></div>
<jsp:include page="/fragment/footer.jsp" />

<Script Language="JavaScript">
setTimeout("location.href='../home.jsp'",3000);
</Script> 
</body>
</html>