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
<link href="<c:url value='/fullCalendar/w3.css'/>" rel="stylesheet" type="text/css"/>
<link href="<c:url value='/css/fonts/fontstyle.css'/>" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-countdown/2.0.2/jquery.countdown.min.css" />
<style>
.txtWaring{color:red}
</style>
</head>
<body>
<div class='container'>
<h2  class='container'>即將進行諮詢</h2>
<table class="table  table-hover">
  <thead>
    <tr>
      <th scope="col">編號</th>
      <th scope="col">諮詢項目</th>
      <th scope="col">諮詢時段</th>
      <th scope="col">諮詢人員</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody id="TalkingList">
<!--      未處理申請 -->
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
    </tr>
  </thead>
  <tbody id="UnTalkList">
<!--      未處理申請 -->
  </tbody>
</table>
<h2 class='container'>已完成諮詢</h2>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">編號</th>
      <th scope="col">諮詢項目</th>
      <th scope="col">諮詢時段</th>
      <th scope="col">諮詢人員</th>
      <th scope="col">滿意度</th>
    </tr>
  </thead>
  <tbody id="TalkList">
<!--      已處理申請 -->
  </tbody>
</table>

<!-- 未諮詢視窗 -->
<div class="modal fade" id="UnTalkItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="UnTalkTitle">諮詢資訊</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 回覆內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="UnTalk">送出</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
      </div>
    </div>
  </div>
</div>
<!-- 已諮詢視窗 -->
<div class="modal fade" id="TalkItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="TalkTitle">諮詢結果</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 結果 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="Talk">OK</button>
      </div>
    </div>
  </div>
</div>
</div>
<!--=======================載入script檔跟程式==========================-->
<script src="<c:url value='/fullCalendar/moment.min.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-countdown/2.0.2/jquery.plugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-countdown/2.0.2/jquery.countdown.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-countdown/2.0.2/jquery.countdown-zh-TW.min.js"></script>
<script>
$(document).ready(function(){
	var memberId="0A21A5D0-3AA1-4A16-9742-585B4A1EA78E";
	var memName = $("#memName").text();
	LoadData();
	var DataPackage;
	var unTalkOne;
	var TalkedOne;
	var TalkingOne;
function LoadData(){
	var docFrag1 =$(document.createDocumentFragment());
	var docFrag2 =$(document.createDocumentFragment());
	var docFrag3 =$(document.createDocumentFragment());
	var dataSource;
	var unCheckData = $("#UnCheckList");
	var CheckData = $("#CheckList");
	unCheckData.empty();
	CheckData.empty();
$.getJSON("<c:url value='/Advisory/memberReserve.controller'/>",{"memberId":memberId},function(datas){
	console.log(datas);
	$.each(datas,function(index,data){
		var now = moment(new Date()).format("YYYY-MM-DD HH:mm");
		var advisoryTime = moment(data.advisoryTime).format("YYYY-MM-DD HH:mm");
		var ms = moment(advisoryTime).diff(now);
		console.log(ms);
		var status=data.status;
		if(status=="N" && ms<=600000){			
			var col1 = $("<th scope='row'>"+(index+1)+"</th>");
			var col2 = $("<td>"+data.reserveItem+"</td>");
			var col3 = $("<td>"+advisoryTime+"</td>");
			var col4 = $("<td>"+data.empName+" "+data.career+"</td>");
			var col5 = $("<td></td>");
			TalkingOne={"reserveItem":data.reserveItem,"advisoryTime":advisoryTime,"empName":data.empName+" "+data.career,"empId":data.empId,"videoCode":data.videoCode,"descrip":data.descrip,"videoRecord":data.videoRecord,"satisfy":data.satisfy,"modifyTime":data.modifyTime,"momentId":data.momentId};			
			var allcol = $("<tr></tr>").append([col1,col2,col3,col4,col5]);
		    docFrag1.append(allcol);		
		}else if(status=="N"){			
			var col1 = $("<th scope='row'>"+(index+1)+"</th>");
			var col2 = $("<td>"+data.reserveItem+"</td>");
			var col3 = $("<td>"+advisoryTime+"</td>");
			var col4 = $("<td>"+data.empName+" "+data.career+"</td>");
			unTalkOne={"reserveItem":data.reserveItem,"advisoryTime":data.advisoryTime,"empName":data.empName+" "+data.career,"empId":data.empId,"videoCode":data.videoCode,"descrip":data.descrip,"videoRecord":data.videoRecord,"satisfy":data.satisfy,"modifyTime":data.modifyTime,"momentId":data.momentId};			
			var allcol = $("<tr></tr>").append([col1,col2,col3,col4]);
		    docFrag2.append(allcol);		
		}else{
			var col1 = $("<th scope='row'>"+(index+1)+"</th>");
			var col2 = $("<td>"+data.reserveItem+"</td>");
			var col3 = $("<td>"+advisoryTime+"</td>");
			var col4 = $("<td>"+data.empName+" "+data.career+"</td>");
			var col5 = $("<td>"+data.satisfy+"</td>");
			TalkedOne={"reserveItem":data.reserveItem,"advisoryTime":advisoryTime,"empName":data.empName+" "+data.career,"empId":data.empId,"videoCode":data.videoCode,"descrip":data.descrip,"videoRecord":data.videoRecord,"satisfy":data.satisfy,"modifyTime":data.modifyTime,"momentId":data.momentId};		
			var allcol2 = $("<tr></tr>").append([col1,col2,col3,col4,col5]);
			docFrag3.append(allcol2);
		}
		})
	$("#TalkingList").append(docFrag1);
	$("#UnTalkList").append(docFrag2);
	$("#TalkList").append(docFrag3);
	console.log(TalkingOne);
	console.log(unTalkOne);
	console.log(TalkedOne);
})
}
//即將諮詢
$("body").on("click","#TalkingList tr",function(){
	console.log(TalkingOne.reserveItem);
// 	$.get("<c:url value=''/>",{"memName":memName,"memberId":memberId,"reserveItem":TalkingOne.reserveItem,"empName":TalkingOne.empName,"empId":TalkingOne.empId,"videoCode":TalkingOne.videoCode},function(){})
});

//未諮詢 videoCodeError
$("body").on("click","#UnTalkList tr",function(){
	var docFrag =$(document.createDocumentFragment());
	$("#UnTalkItem .modal-body").empty();
	docFrag.append("<span style='font-size:1.3em'>諮詢項目:  "+unTalkOne.reserveItem+"</span>"
			+"<br/><span style='font-size:1.3em'>諮詢時段:  "+unTalkOne.advisoryTime+"</span>"
			+"<br/><span style='font-size:1.3em'>諮詢人員:  "+unTalkOne.empName+"</span>"
			+"<div id='getting-started'></div>");		
	$("#UnTalkItem .modal-body").append(docFrag);
	$("#UnTalkItem").modal("show");
	$("#getting-started").countdown({until:unTalkOne.advisoryTime, format: 'DHMS'});
});

//已諮詢
$("body").on("click","#TalkList tr",function(){
	var docFrag =$(document.createDocumentFragment());
	$("#TalkItem .modal-body").empty();
	docFrag.append("<span style='font-size:1.3em'>申請人:  "+empName+"</span>"
			+"<br/><span style='font-size:1.3em'>請假事項:  "+apType+"</span>"
			+"<br/><span style='font-size:1.3em'>請假時段:  "+calendar+"</span>"
			+"<br/><span style='font-size:1.3em'>申請時間:  "+apTime+"</span>"		
			+"<br/><span>申請說明: </span><p>"+apReason+"</p>"		
			+"<br/><span style='font-size:1.3em'>核准結果:  "+reResult+"</span>"
			+"<br/><span>備註: </span><p>"+reReason+"</p>");		
	$("#TalkItem .modal-body").append(docFrag);
	$("#TalkItem").modal("show");
});



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