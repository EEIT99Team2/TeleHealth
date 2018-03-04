<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<c:url value="/page/userEnter.controller" />" method="post">
	
	<table>
	<tr>
	<td>MinBloodPressure:	</td>
		<td><input  type="text" name="minBloodPressure" value="${param.minBloodPressure}"></td>		
		<td>${errors.minBP}</td>
	</tr>
	<tr>
	<td>MaxBloodPressure:	</td>
		<td><input  type="text" name="maxBloodPressure" value="${param.maxBloodPressure}"></td>		
		<td>${errors.maxBP}</td>
	</tr>
	<tr>
	<td>MinBloodSugar:	</td>
		<td><input  type="text" name="minBloodSugar" value="${param.minBloodSugar}"></td>
		<td>${errors.minBS}</td>		
	</tr>
	<tr>
	<td>MaxBloodSugar:	</td>
		<td><input  type="text" name="maxBloodSugar" value="${param.maxBloodSugar}"></td>
		<td>${errors.maxBS}</td>
	</tr>
	<tr>
	<td>Height:	</td>
		<td><input  type="text" name="height" value="${param.height}"></td>
		<td>${errors.height}</td>
	</tr>
	<tr>
	<td>Weight:	</td>
		<td><input  type="text" name="weight" value="${param.weigth}"></td>
		<td>${errors.weight}</td>
	</tr>
	<tr>	
	<td>Heartbeat:	</td>
		<td><input  type="text" name="Heartbeat" value="${param.Heartbeat}"></td>
		<td>${errors.Heartbeat}</td>
	</tr>
	<tr>
		<td>
			<input type="submit" name="button" value="Insert" />
			<input type="submit" name="button" value="Data" />
			<input type="submit" name="button" value="memberhistory" />
		</td>
	</tr>
	</table>
	
</form>

<c:if test="${not empty insert}">
<h3>Insert Product Table Success</h3>
<table border="1">
	<tr><td>age</td><td>${insert.age}</td></tr>
	<tr><td>minBloodPressure</td><td>${insert.minBloodPressure}</td></tr>
	<tr><td>maxBloodPressure</td><td>${insert.maxBloodPressure}</td></tr>
	<tr><td>minBloodSugar</td><td>${insert.minBloodSugar}</td></tr>
	<tr><td>maxBloodSugar</td><td>${insert.maxBloodSugar}</td></tr>
	<tr><td>height</td><td>${insert.height}</td></tr>
	<tr><td>weight</td><td>${insert.weight}</td></tr>
	<tr><td>createTime</td><td>${insert.createTime}</td></tr>

</table>
</c:if>
</body>
</html>