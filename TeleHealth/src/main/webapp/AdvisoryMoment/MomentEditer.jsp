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
<style>
.txtWaring{color:red}
</style>
</head>
<body>
<div>
<h2>未處理申請</h2>
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
<!--      未處理申請 -->
  </tbody>
</table>
</div>
<div>
<h2>已處理申請</h2>
<div id="Checked"></div>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">編號</th>
      <th scope="col">申請人</th>
      <th scope="col">請假事項</th>
      <th scope="col">申請時間</th>
      <th scope="col">回覆時間</th>
    </tr>
  </thead>
  <tbody id="CheckList">
<!--      已處理申請 -->
  </tbody>
</table>
</div>
<!-- 管理員回覆視窗 -->
<div class="modal fade" id="responseItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
        <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>
<!--=======================載入script檔跟程式==========================-->
<script src="../fullCalendar/moment.min.js"></script>
<script src="../fullCalendar/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	LoadData();
	var DataPackage;
	
function LoadData(){
	var docFrag1 =$(document.createDocumentFragment());
	var docFrag2 =$(document.createDocumentFragment());
	var unCheckData = $("#UnCheckList");
	var CheckData = $("#CheckList");
	unCheckData.empty();
	CheckData.empty();
$.getJSON("<c:url value='/AdvisoryMoment/takeoffData.controller'/>",{},function(datas){
	console.log(datas);
	$.each(datas,function(index,data){
		var momStatus=data.momStatus;
		if(momStatus=="Y"){			
			var col1 = $("<th scope='row'>"+(index+1)+"</th>");
			var col2 = $("<td>"+data.empName+" "+data.zhCareer+"</td>");
			var col3 = $("<td>"+data.apType+"</td>");
			var col4 = $("<td>"+moment(data.apTime).format("YYYY-MM-DD HH:mm")+"</td>");
			var col5;
			if(data.status == "已預約"){
				col5 = $("<td style='color:red'>"+data.status+"</td>");
			}else{
				col5 = $("<td style='color:blue'>"+data.status+"</td>");
			}
			var col6 = $("<span hidden='hidden'>"+data.empId+"#"+data.videoCode+"$"+data.apReason+"%"+data.MomentId+"^"+data.takeoffId+"</span>");			
			var allcol = $("<tr></tr>").append([col1,col2,col3,col4,col5,col6]);
		    docFrag1.append(allcol);		
		}else{
			var col21 = $("<th scope='row'>"+(index+1)+"</th>");
			var col22 = $("<td>"+data.empName+" "+data.zhCareer+"</td>");
			var col23 = $("<td>"+data.apType+"</td>");
			var col24 = $("<td>"+moment(data.apTime).format("YYYY-MM-DD HH:mm")+"</td>");
			var col25 = $("<td>"+moment(data.reTime).format("YYYY-MM-DD HH:mm")+"</td>");			
			var col26 = $("<span hidden='hidden'>"+data.empId+"#"+data.videoCode+"$"+data.apReason+"%"+data.MomentId+"^"+data.takeoffId+"</span>");			
			var allcol2 = $("<tr></tr>").append([col21,col22,col23,col24,col25,col26]);
			docFrag2.append(allcol2);
		}
		})
	$("#UnCheckList").append(docFrag1);
	$("#CheckList").append(docFrag2);
})
}

$("body").on("click","tbody tr",function(){
	$("#responseItem .modal-body").empty();
	var docFrag =$(document.createDocumentFragment());
	var apType = $(this).find("td:eq(1)").text();
	var apTime = $(this).find("td:eq(2)").text();
	var allData = $(this).find("span").text();
	var emptyChar1 = allData.indexOf("#");
	var emptyChar2 = allData.indexOf("$");
	var emptyChar3 = allData.indexOf("%");
	var emptyChar4 = allData.indexOf("^");
	var empId = allData.substr(0,emptyChar1);
	var videoCode = allData.substr(emptyChar1+1,emptyChar2-emptyChar1-1);
	var apReason = allData.substr(emptyChar2+1,emptyChar3-emptyChar2-1);
	var MomentId = allData.substr(emptyChar3+1,emptyChar4-emptyChar3-1);
	var takeoffId = allData.substr(emptyChar4+1);
	var reType;
	var note;
	docFrag.append("<span style='font-size:1.3em'>請假事項:  </span>"+apType
			+"<br/><span style='font-size:1.3em'>申請時間:  </span>"+apTime	
			+"<br/><span style='font-size:1.3em'>請假事由:  </span>"+apReason	
			+"<br/><span style='font-size:1.3em'>是否核准:  </span>"
			+"<input type='radio' value='Y' name='approve' checked='true'/>是 "
			+"<input type='radio' value='N' name='approve'/>否 "
			+"<br/><div id='noteBox'><span>備註: </span><textarea id='noteTxt' rows='6' cols='50' style='font-size:1em'></textarea><div>");		
	$("#responseItem .modal-body").append(docFrag);
	reType= $("input[name^='approve']:radio").val();
	DataPackage={"takeoffId":takeoffId,"empId":empId,"MomentId":MomentId,"videoCode":videoCode,"apResult":reType};
	$("#responseItem").modal("show");
});

$("#responseCheck").click(function(){
	var docFrag =$(document.createDocumentFragment());
	var note = $.trim($("#noteTxt").val());
	if(note.length==0){
		$(".txtWaring").remove();
		$("#responseCheck").removeAttr("data-dismiss");
		$("#noteBox").append("<h5 class='txtWaring'>請加上備註</h5>");
	}else{
		$(".txtWaring").remove();
		$("#responseCheck").attr("data-dismiss","modal");
	console.log(DataPackage.takeoffId+";"+DataPackage.empId+";"+DataPackage.MomentId+";"+DataPackage.apResult+";"+note);
	$.post("<c:url value='/AdvisoryMoment/approveTakeoff.controller'/>",{"takeoffId":DataPackage.takeoffId,"empId":DataPackage.empId,"MomentId":DataPackage.MomentId,"videoCode":DataPackage.videoCode,"apResult":DataPackage.apResult,"reason":note},function(result){
		docFrag.append("<h4>"+result+"</h4>");
		$("#resultItem .modal-body").append(docFrag);
		})
	$("#resultItem").modal("show");
			}
});

//綁定radiobutton



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



})

</script>
</body>
</html>