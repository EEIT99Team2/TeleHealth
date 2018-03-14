<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>視訊諮詢記錄</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="<c:url value='/fullCalendar/w3.css'/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value='/css/fonts/fontstyle.css'/>" rel="stylesheet" type="text/css"/>
<style>
.txtWaring{color:red}
</style>
</head>
<body>
<jsp:include page="/fragment/nav2.jsp" />
<div class='container'>
<h2  class='container'>即將進行諮詢</h2>
<table class="table  table-hover">
  <thead>
    <tr>
      <th scope="col">編號</th>
      <th scope="col">諮詢項目</th>
      <th scope="col">諮詢時段</th>
      <th scope="col">會員姓名</th>
      <th scope="col">狀態</th>
    </tr>
  </thead>
  <tbody id="UnCheckList">
  </tbody>
</table>

<h2  class='container'>未完成諮詢</h2>
<table class="table  table-hover">
  <thead>
    <tr>
      <th scope="col">編號</th>
      <th scope="col">諮詢項目</th>
      <th scope="col">諮詢時段</th>
      <th scope="col">諮詢人員</th>
      <th scope="col">狀態</th>
    </tr>
  </thead>
  <tbody id="UnTalkList">
<!--      未處理申請 -->
  </tbody>
</table>

<h2 class='container'>已完成項目</h2>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">編號</th>
      <th scope="col">諮詢項目</th>
      <th scope="col">諮詢時段</th>
      <th scope="col">負責人</th>
      <th scope="col">狀態</th>
    </tr>
  </thead>
  <tbody id="CheckList">
<!--      已處理申請 -->
  </tbody>
</table>

<!-- 管理員回覆視窗 -->
<div class="modal fade" id="UnItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="responseTitle">假單明細</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 回覆內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="responseCheck">送出</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
      </div>
    </div>
  </div>
</div>
<!-- 回覆結果視窗 -->
<div class="modal fade" id="resultItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="resultTitle">核准結果</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 結果 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="resultCheck">OK</button>
      </div>
    </div>
  </div>
</div>
</div>
<!--=======================載入script檔跟程式==========================-->
<script src="<c:url value='/fullCalendar/moment.min.js'/>"></script>
<script src="<c:url value='/fullCalendar/jquery-3.3.1.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	var empId="930F2472-337E-4800-B774-EB0AAE703D2A";
	LoadData();
	var DataPackage;
function LoadData(){
	var docFrag1 =$(document.createDocumentFragment());
	var docFrag2 =$(document.createDocumentFragment());
	var dataSource;
	var unTalkOne;
	var TalkedOne;
	var unCheckData = $("#UnCheckList");
	var CheckData = $("#CheckList");
	unCheckData.empty();
	CheckData.empty();
$.getJSON("<c:url value='/Advisory/empreserve.controller'/>",{"empId":empId},function(datas){
	console.log(datas);
	$.each(datas,function(index,data){
		console.log(data);
		var status=data.status;
		if(status=="N"){			
			var col1 = $("<th scope='row'>"+(index+1)+"</th>");
			var col2 = $("<td>"+data.reserveItem+"</td>");
			var col3 = $("<td>"+moment(data.advisoryTime).format("YYYY-MM-DD HH:mm")+"</td>");
			var col4 = $("<td>"+data.memName+"</td>");
			var col5 = $("<td>未開始</td>");
			unTalkOne={"empId":data.empId,"videoCode":data.videoCode,"descrip":data.descrip,"videoRecord":data.videoRecord,"statify":data.statify,"modifyTime":data.modifyTime,"momentId":data.momentId};			
			var allcol = $("<tr></tr>").append([col1,col2,col3,col4,col5]);
		    docFrag1.append(allcol);		
		}else{
			var col21 = $("<th scope='row'>"+(index+1)+"</th>");
			var col22 = $("<td>"+data.reserveItem+"</td>");
			var col23 = $("<td>"+moment(data.advisoryTime).format("YYYY-MM-DD HH:mm")+"</td>");
			var col24 = $("<td>"+data.memName+"</td>");
			var col25 = $("<td>已完成</td>");
// 			var col26 = $("<td>5</td>");
			TalkedOne={"empId":data.empId,"videoCode":data.videoCode,"descrip":data.descrip,"videoRecord":data.videoRecord,"statify":data.statify,"modifyTime":data.modifyTime,"momentId":data.momentId};		
			var allcol2 = $("<tr></tr>").append([col21,col22,col23,col24,col25]);
			docFrag2.append(allcol2);
		}
		})
	$("#UnCheckList").append(docFrag1);
	$("#CheckList").append(docFrag2);
	console.log(unTalkOne);
	console.log(TalkedOne);
})
}

//綁定動態產生tr滑鼠滑過變色
$("body").on("mouseover","tr",function(){
	$("tbody tr").mouseover(over).mouseout(out);	
});

$("tbody tr").mouseover(over).mouseout(out);

function over(){
	$(this).removeClass("Default");
	$(this).addClass("table-success");
}
function out(){
	$(this).removeClass("table-success");
	$(this).addClass("Default");
}

$("#resultCheck").click(function(){
	window.location.reload();
});
})
</script>
</body>
</html>