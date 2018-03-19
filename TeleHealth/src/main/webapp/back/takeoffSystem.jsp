<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <style>
.txtWaring{color:red}
.headStyle{font-size:22px;}
.bodyStyle{font-size:18px;}
.allFontStyle{font-family: CJKtc_Bold;}
.takeoffUse{margin-top:100px}
</style>
<div class='container takeoffUse'>
<h2  class='container'>未處理申請</h2>
<table class="table  table-hover">
  <thead class="headStyle">
    <tr>
      <th scope="col">編號</th>
      <th scope="col">申請人</th>
      <th scope="col">請假事項</th>
      <th scope="col">申請時間</th>
      <th scope="col">預約狀態</th>
    </tr>
  </thead>
  <tbody id="UnCheckList" class="bodyStyle">
<!--      未處理申請 -->
  </tbody>
</table>
<h2 class='container'>已處理申請</h2>
<table class="table table-hover">
  <thead class="headStyle">
    <tr>
      <th scope="col">編號</th>
      <th scope="col">申請人</th>
      <th scope="col">請假事項</th>
      <th scope="col">申請時間</th>
      <th scope="col">核准結果</th>
      <th scope="col">回覆時間</th>
    </tr>
  </thead>
  <tbody id="CheckList" class="bodyStyle">
<!--      已處理申請 -->
  </tbody>
</table>

<!-- 管理員回覆視窗 -->
<div class="modal fade bodyStyle" id="responseItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title allFontStyle" id="responseTitle">假單明細</h5>
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
<div class="modal fade allFontStyle" id="resultItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title allFontStyle" id="resultTitle">核准結果</h5>
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
	$.each(datas,function(index,data){
		var momStatus=data.momStatus;
		var reResult=data.reResult;
		if(momStatus=="Y" && reResult=="null"){			
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
			var col6 = $("<span hidden='hidden'>"+data.empId+"#"+data.videoCode+"$"+data.apReason+"%"+data.MomentId+"^"+data.takeoffId+"*"+data.calendar+"</span>");			
			var allcol = $("<tr></tr>").append([col1,col2,col3,col4,col5,col6]);
		    docFrag1.append(allcol);		
		}else{
			if(reResult=="Y"){
				reResult="核准";
				}else{
					reResult="未核准";
					}
			var col21 = $("<th scope='row'>"+(index+1)+"</th>");
			var col22 = $("<td>"+data.empName+" "+data.zhCareer+"</td>");
			var col23 = $("<td>"+data.apType+"</td>");
			var col24 = $("<td>"+moment(data.apTime).format("YYYY-MM-DD HH:mm")+"</td>");
			var col25 = $("<td>"+reResult+"</td>");			
			var col26 = $("<td>"+moment(data.reTime).format("YYYY-MM-DD HH:mm")+"</td>");			
			var col27 = $("<span hidden='hidden'>"+data.empId+"#"+data.videoCode+"$"+data.apReason+"%"+data.MomentId+"^"+data.takeoffId+"*"+data.calendar+"&"+data.reReason+"</span>");			
			var allcol2 = $("<tr></tr>").append([col21,col22,col23,col24,col25,col26,col27]);
			docFrag2.append(allcol2);
		}
		})
	$("#UnCheckList").append(docFrag1);
	$("#CheckList").append(docFrag2);
})
}
//未回覆
$("body").on("click","#UnCheckList tr",function(){
	$("#responseItem .modal-body").empty();
	var docFrag =$(document.createDocumentFragment());
	var empName = $(this).find("td:eq(0)").text();
	var apType = $(this).find("td:eq(1)").text();
	var apTime = $(this).find("td:eq(2)").text();
	var allData = $(this).find("span").text();
	var emptyChar1 = allData.indexOf("#");
	var emptyChar2 = allData.indexOf("$");
	var emptyChar3 = allData.indexOf("%");
	var emptyChar4 = allData.indexOf("^");
	var emptyChar5 = allData.indexOf("*");
	var empId = allData.substr(0,emptyChar1);
	var videoCode = allData.substr(emptyChar1+1,emptyChar2-emptyChar1-1);
	var apReason = allData.substr(emptyChar2+1,emptyChar3-emptyChar2-1);
	var MomentId = allData.substr(emptyChar3+1,emptyChar4-emptyChar3-1);
	var takeoffId = allData.substr(emptyChar4+1,emptyChar5-emptyChar4-1);
	var calendar = allData.substr(emptyChar5+1);
	docFrag.append("<span style='font-size:1.3em'>請假事項:  "+apType+"</span>"
			+"<br/><span style='font-size:1.3em'>申請時間:  "+apTime+"</span>"	
			+"<br/><span style='font-size:1.3em'>請假事由:  "+apReason+"</span>"
			+"<br/><span style='font-size:1.3em'>是否核准:  </span>"
			+"<input type='radio' value='Y' name='approve'/>是 "
			+"<input type='radio' value='N' name='approve'/>否 "
			+"<br/><div id='noteBox'><span>備註: </span><textarea id='noteTxt' rows='6' cols='50' style='font-size:1em'></textarea><div>");		
	$("#responseItem .modal-body").append(docFrag);
	DataPackage={"takeoffId":takeoffId,"empId":empId,"empName":empName,"MomentId":MomentId,"calendar":calendar,"videoCode":videoCode};
	$("#responseItem").modal("show");
});

//已回覆
$("body").on("click","#CheckList tr",function(){
	$("#resultItem .modal-body").empty();
	var docFrag =$(document.createDocumentFragment());
	var empName = $(this).find("td:eq(0)").text();
	var apType = $(this).find("td:eq(1)").text();
	var apTime = $(this).find("td:eq(2)").text();
	var reResult = $(this).find("td:eq(3)").text();
	var allData = $(this).find("span").text();
	var emptyChar1 = allData.indexOf("#");
	var emptyChar2 = allData.indexOf("$");
	var emptyChar3 = allData.indexOf("%");
	var emptyChar4 = allData.indexOf("^");
	var emptyChar5 = allData.indexOf("*");
	var emptyChar6 = allData.indexOf("&");
	var empId = allData.substr(0,emptyChar1);
	var videoCode = allData.substr(emptyChar1+1,emptyChar2-emptyChar1-1);
	var apReason = allData.substr(emptyChar2+1,emptyChar3-emptyChar2-1);
	var MomentId = allData.substr(emptyChar3+1,emptyChar4-emptyChar3-1);
	var takeoffId = allData.substr(emptyChar4+1,emptyChar5-emptyChar4-1);
	var calendar = allData.substr(emptyChar5+1,emptyChar6-emptyChar5-1);
	var reReason = allData.substr(emptyChar6+1);
	docFrag.append("<span style='font-size:1.3em'>申請人:  "+empName+"</span>"
			+"<br/><span style='font-size:1.3em'>請假事項:  "+apType+"</span>"
			+"<br/><span style='font-size:1.3em'>請假時段:  "+calendar+"</span>"
			+"<br/><span style='font-size:1.3em'>申請時間:  "+apTime+"</span>"		
			+"<br/><span>申請說明: </span><p>"+apReason+"</p>"		
			+"<br/><span style='font-size:1.3em'>核准結果:  "+reResult+"</span>"
			+"<br/><span>備註: </span><p>"+reReason+"</p>");		
	$("#resultItem .modal-body").append(docFrag);
	$("#resultItem").modal("show");
});

$("#responseCheck").click(function(){
	var docFrag =$(document.createDocumentFragment());
	var apResult= $("input[name='approve']:checked").val();
	var note = $.trim($("#noteTxt").val());
	if(note.length==0){
		$(".txtWaring").remove();
		$("#responseCheck").removeAttr("data-dismiss");
		$("#noteBox").append("<h5 class='txtWaring'>請加上備註</h5>");
	}else{
		$(".txtWaring").remove();
		$("#responseCheck").attr("data-dismiss","modal");
	$.post("<c:url value='/AdvisoryMoment/approveTakeoff.controller'/>",{"takeoffId":DataPackage.takeoffId,"empId":DataPackage.empId,"empName":DataPackage.empName,"MomentId":DataPackage.MomentId,"calendar":DataPackage.calendar,"videoCode":DataPackage.videoCode,"apResult":apResult,"reason":note},function(result){
		docFrag.append("<h4>"+result+"</h4>");
		$("#resultItem .modal-body").append(docFrag);
		})
	$("#resultItem").modal("show");
			}
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
	LoadData();
});
})
</script>