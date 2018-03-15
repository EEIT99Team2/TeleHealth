<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>視訊諮詢記錄</title>
<!-- Bootstrap core CSS -->
<link href="<c:url value='/css/fonts/fontstyle.css'/>" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-countdown/2.0.2/jquery.countdown.min.css" />
<style>
.txtWaring{color:red}

</style>
</head>
<body>
<jsp:include page="/fragment/navemp.jsp" />
<script src="<c:url value='/forCkeditor/ckeditor/ckeditor.js' />"></script>
<script src="<c:url value='/forCkeditor/ckfinder/ckfinder.js' />"></script>
<div class='container'>
<h2  class='container'>即將進行諮詢</h2>
<table class="table  table-hover">
  <thead>
    <tr>
      <th scope="col">編號</th>
      <th scope="col">視訊代號</th>
      <th scope="col">諮詢項目</th>
      <th scope="col">會員姓名</th>
      <th scope="col">諮詢時段</th>
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
      <th scope="col">視訊代號</th>      
      <th scope="col">諮詢項目</th>
      <th scope="col">會員姓名</th>
      <th scope="col">諮詢時段</th>
      <th scope="col">狀態</th>
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
      <th scope="col">視訊代號</th>
      <th scope="col">諮詢項目</th>
      <th scope="col">會員姓名</th>
      <th scope="col">諮詢時段</th>
      <th scope="col">狀態</th>
    </tr>
  </thead>
  <tbody id="TalkList">
<!--      已處理申請 -->
  </tbody>
</table>
<!-- 未諮詢視窗 -->
<div class="modal fade" id="UnTalkItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered  col-12" role="document">
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
        <h5 class="modal-title" id="TalkTitle">修改諮詢概要內容</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>        
      </div>     
      <div class="modal-body" id="modifyContent">   
      	<form>
     		<textarea class="form-control" id="contents" rows="10" cols="80"></textarea>       
        </form>  
      </div>      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="Talk">OK</button>
      </div>
    </div>
  </div>
</div>
</div>
<!-- Footer -->
<jsp:include page="/fragment/footer.jsp" />
<!--=======================載入script檔跟程式==========================-->
<script src="<c:url value='/fullCalendar/moment.min.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-countdown/2.0.2/jquery.plugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-countdown/2.0.2/jquery.countdown.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-countdown/2.0.2/jquery.countdown-zh-TW.min.js"></script>

</body>
<script>
$(document).ready(function(){
	 var tg=[ {name:'basicstyles',groups:['basicstyles','cleanup']},
        {name:'paragraph',groups:['align']},{name:'styles'},{name:'colors'},{ name: 'insert', groups: [ 'Image' ] },
     ];
	 CKEDITOR.replace('contents',{
		width:450, height:400, toolbarGroups:tg,
 		filebrowserBrowseUrl : '/TeleHealth/forCkeditor/ckfinder/ckfinder.html',
 		filebrowserImageBrowseUrl : '/TeleHealth/forCkeditor/ckfinder/ckfinder.html?type=Images', 
 		filebrowserFlashBrowseUrl : '/TeleHealth/forCkeditor/ckfinder/ckfinder.html?type=Flash',
 		filebrowserUploadUrl : '/TeleHealth/forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files', 
 		filebrowserImageUploadUrl : '/TeleHealth/forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images', 
 		filebrowserFlashUploadUrl : '/TeleHealth/forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash' 	
 		});
 	console.log("ready!");
	var empId =$("#empId").val();
	var count = 0;
	$.getJSON("<c:url value='/Advisory/empreserve.controller'/>",{"empId":empId},function(datas){
		console.log(datas);
		$.each(datas,function(index,data){
			var status=data.status;
			if(status=="N"){			
				count++;
			}
		});
		$('#advisoryNum').text(count);
		if(count == 0) {
			$('#advisoryNum').css("display", "none");
		}
	});
	var empName = $("#empName").val();
	LoadData();
	var DataPackage;
	var unTalkOne;
	var TalkedOne;
	var TalkingOne;
	var ms;
function LoadData(){
	var docFrag1 =$(document.createDocumentFragment());
	var docFrag2 =$(document.createDocumentFragment());
	var docFrag3 =$(document.createDocumentFragment());
	var dataSource;
	var unCheckData = $("#UnCheckList");
	var CheckData = $("#CheckList");
	unCheckData.empty();
	CheckData.empty();
$.getJSON("<c:url value='/Advisory/empreserve.controller'/>",{"empId":empId},function(datas){
	console.log(datas);
	$.each(datas,function(index,data){
		var now = moment(new Date()).format("YYYY-MM-DD HH:mm");
		var advisoryTime = moment(data.advisoryTime).format("YYYY-MM-DD HH:mm");
		ms = moment(advisoryTime).diff(now)/1000;
		console.log(ms);
		var status=data.status;
		if(status=="N" && ms<=900 && ms>0){			
			var col1 = $("<th scope='row'>"+(index+1)+"</th>");
			var col2 = $("<td>"+data.videoCode+"</th>");
			var col3 = $("<td>"+data.reserveItem+"</td>");
			var col4 = $("<td>"+data.memName+"</td>");
			var col5 = $("<td>"+advisoryTime+"</td>");
			var col6 = $("<input type='hidden' name='videoCode' value='"+data.videoCode+"'/>");
			var col7 = $("<input type='hidden' name='reserveItem' value='"+data.reserveItem+"'/>");
			TalkingOne={"reserveItem":data.reserveItem, "videoCode":data.videoCode};			
			var btn = $("<input type='submit' value='開始' class='btn btn-danger' />");
			var form1 = $("<form style='padding-top:7px;'  action='<c:url value="/Advisory/startadvisory.controller"/>' method=GET></form>").append([col6, col7, btn]);
			var tr1 = $("<tr></tr>").append([col1,col2,col3,col4,col5, form1]);
		    docFrag1.append(tr1);				
		}else if(status=="N"){
			var col1 = $("<th scope='row'>"+(index+1)+"</th>");
			var col2 = $("<td>"+data.videoCode+"</th>");
			var col3 = $("<td>"+data.reserveItem+"</td>");
			var col4 = $("<td>"+data.memName+"</td>");
			var col5 = $("<td>"+advisoryTime+"</td>");
			var col6 = $("<td>未完成</td>");
			unTalkOne={"reserveItem":data.reserveItem, "videoCode":data.videoCode};			
			var allcol = $("<tr></tr>").append([col1,col2,col3,col4,col5,col6]);
		    docFrag2.append(allcol);		
		}else{
			var col1 = $("<th scope='row'>"+(index+1)+"</th>");
			var col2 = $("<td>"+data.videoCode+"</th>");
			var col3 = $("<td>"+data.reserveItem+"</td>");
			var col4 = $("<td>"+data.memName+"</td>");
			var col5 = $("<td>"+advisoryTime+"</td>");
			var col6 = $("<td>已完成    </td>");
			var modifyBtn = $("<button class='btn btn-info'><i class='fas fa-edit'></i></button>")
			col6.append(modifyBtn);
			TalkedOne={"reserveItem":data.reserveItem, "videoCode":data.videoCode};	
			var allcol2 = $("<tr></tr>").append([col1,col2,col3,col4,col5,col6]);
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
	$.get("<c:url value='/Advisory/startadvisory.controller'/>",{"memName":memName,"memberId":memberId,"reserveItem":TalkingOne.reserveItem,"empName":TalkingOne.empName,"empId":TalkingOne.empId,"videoCode":TalkingOne.videoCode},function(data){
	})
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
	$("#getting-started").countdown({until:ms, format: 'DHMS'});	
	$("#UnTalkItem").modal("show");
});

//已諮詢 (查看諮詢內容)
// $("body").on("click","#TalkList tr",function(){
// 	var docFrag =$(document.createDocumentFragment());
// 	$("#TalkItem .modal-body").empty();
// 	docFrag.append("<span style='font-size:1.3em'>諮詢項目:  "+TalkedOne.reserveItem+"</span>"
// 			+"<br/><span style='font-size:1.3em'>諮詢時段:  "+TalkedOne.advisoryTime+"</span>"
// 			+"<br/><span style='font-size:1.3em'>諮詢人員:  "+TalkedOne.empName+"</span>");		
// 	$("#TalkItem .modal-body").append(docFrag);
// 	$("#TalkItem").modal("show");
// });

//修改視訊諮詢內容功能的function
$('#TalkList').on('click','tr button:nth-child(1)',function(){
	  $('#TalkItem').modal('show');	
	  var modifyVideo = $(this).parents('tr').find('td:nth-child(2)').text();
	 $.getJSON('/TeleHealth/selectadvisory.controller',{"videoCode":modifyVideo},function(data){
				console.log(data);				
				CKEDITOR.instances.contents.setData(data.data.descrip);				
						 					 	 					
			}); 					
 	 });
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

</script>
<script>
$.ready(function(){
	
});
</script>


</html>