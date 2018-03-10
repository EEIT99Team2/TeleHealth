<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>請假系統</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="../fullCalendar/w3.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div>
<h2>未回覆申請</h2>
<div id="UnCheck"></div>
<table class="table  table-hover">
  <thead>
    <tr>
      <th scope="col">編號</th>
      <th scope="col">申請人</th>
      <th scope="col">請假事項</th>
      <th scope="col">申請時間</th>
      <th scope="col">預約狀態</th>
    </tr>
  </thead>
  <tbody id="UnCheckList">
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>回覆</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>回覆</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry the Bird</td>
      <td>Larry the Bird</td>
      <td>@twitter</td>
      <td>回覆</td>
    </tr>
  </tbody>
</table>
</div>
<div>
<h2>已回覆申請</h2>
<div id="Checked"></div>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">申請人</th>
      <th scope="col">申請時間</th>
      <th scope="col">請假事項</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody id="CheckList">
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td>回覆</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>回覆</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry the Bird</td>
      <td>Larry the Bird</td>
      <td>@twitter</td>
      <td>回覆</td>
    </tr>
  </tbody>
</table>
</div>
<script src="../fullCalendar/moment.min.js"></script>
<script src="../fullCalendar/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	LoadData();
	var DataPackage;
function LoadData(){
	var docFrag =$(document.createDocumentFragment());
	var unCheckData = $("#UnCheckList");
	unCheckData.empty();
$.getJSON("<c:url value='/AdvisoryMoment/takeoffData.controller'/>",{},function(datas){
	console.log(datas);
	$.each(datas,function(index,data){
			var col1 = $("<th scope='row'>"+(index+1)+"</th>");
			var col2 = $("<td>"+data.empName+"</td>");
			var col3 = $("<td>"+data.apType+"</td>");
			var col4 = $("<td>"+moment(data.apTime).format("YYYY-MM-DD HH:mm")+"</td>");
			var col5;
			if(data.status == "已預約"){
				col5 = $("<td style='color:red'>"+data.status+"</td>");
			}else{
				col5 = $("<td style='color:blue'>"+data.status+"</td>");
			}			
			var allcol = $("<tr></tr>").append([col1,col2,col3,col4,col5]);
		docFrag.append(allcol);
		})
	$("#UnCheckList").append(docFrag);
})
}

$("tbody>tr").click(function(){
	alert($("this>td:eq(2)").text());
})

	var o1 = {'color':'black','background-color':'white'}
	var o2 = {'color':'black','background-color':'cyan'}
// $("tbody tr").on("hover",function(){
// 	$("tr").css(o1).mouseover(over).mouseout(out);
// })
$("tr").css(o1).mouseover(over).mouseout(out);

function over(){
	$(this).removeClass("Default");
	$(this).addClass("table-success");
	
}
function out(){
	$(this).removeClass("table-success");
	$(this).addClass("Default");
}
})

</script>
</body>
</html>