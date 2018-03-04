<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>gender</th>
			<th>age</th>			
			<th>minBloodPressure</th>
			<th>maxBloodPressure</th>
			<th>minBloodSugar</th>
			<th>maxBloodSugar</th>
			<th>height</th>
			<th>weight</th>
			<th>Heartbeat</th>
			<th>createTime</th>			
		</tr>
		<tbody>
		<c:forEach var="records" items="${SelectRecords}">
			<tr>
				<td>${records.gender}</td>
				<td>${records.age}</td>
				<td>${records.minBloodPressure}</td>
				<td>${records.maxBloodPressure}</td>
				<td>${records.minBloodSugar}</td>
				<td>${records.maxBloodSugar}</td>
				<td>${records.height}</td>
				<td>${records.weight}</td>
				<td>${records.heartBeat}</td>
				<td>${records.createTime}</td>
			</tr>
			</c:forEach>
		</tbody>
	</thead>
</table>
</body>
</html>