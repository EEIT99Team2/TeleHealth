<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="memberName" value="${LoginOK.memName}" />
	<c:remove var="LoginOK" scope="session" />
	<h1>已順利登出!!歡迎您下次光臨</h1>
	
 <BR> 
	${member.mid} <hr>
	${member.password} <hr>
	${member.Email} <hr>
	${member.Name} <hr>
	${member.address} <hr>
	${member.Tel} <hr>
	<input type="button" value="回主頁" onclick="location.href='../index.jsp'">

</body>
</html>