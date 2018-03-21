<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>諮詢時刻表</title>
    
<link href="<c:url value='/fullCalendar/fullcalendar.min.css'/>" rel="stylesheet"/>
<link href="<c:url value='/fullCalendar/fullcalendar.print.min.css'/>" rel="stylesheet"  media='print' />
<link href="<c:url value='/fullCalendar/materialFullCalendar.css'/>" rel="stylesheet" type="text/css"/>
<style>
  #calendar {
    max-width: 1100px;
    margin:0px auto;
    background-color: lightblue;
    font-size:18px;
  }
  .fc-widget-header{
     background-color:#00e3e3;
	}
	.fc-toolbar{
	font-family: CJKtc_Bold;
	}
  .headFont {font-size:20px;}
  .columnHead{font-size:1em;}
  .momentColor {font-family: CJKtc_Bold;}
  .eventItem{text-align:center;
  			font-size:18px;}
  #loading{background-color:white}
  .selectTime{margin-top:40px;}
  .selectWord {padding:0px 5px;}
  .addSuccess{font-size:2em}
</style>
</head>
<body>
<jsp:include page="/fragment/nav2.jsp" />
<div id='loading' class="container">
<div class="row headFont">
<div class="momentColor col-3"><span style='color:#0080ff'>您的班表(無預約)</span><br/><span style='color:#d26900'>您的班表(有預約)</span><br/><span style='color:#bebebe'>未被預約班表</span><br/><span style='color:#ea0000'>已被預約班表</span></div>
<div class="col-6 selectTime">
<span class="selectWord">快速查詢:</span>
<select id="year"><option>請選擇</option></select><span class="selectWord">年</span>
<select id="month"><option>請選擇</option></select><span class="selectWord">月</span>
<select id="date"><option>請選擇</option></select><span class="selectWord">日</span>
<button type="button" id="fastSearch" class="btn btn-success">查詢</button>
</div>
<div class="col-3 selectTime">
<span class="selectWord">時段:</span>
<select id="chooseTime">
<option id="allday">全天</option>
<option id="mor" SELECTED>上午</option>
<option id="aft">下午</option>
<option id="nig">晚上</option>
</select>
</div>
</div>
<!-- 未預約班表視窗 -->
<div class="modal fade" id="UnReserveItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="UnReserveItemTitle">您的班表</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="UnReTakeOff">我要請假</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>

<!-- 已預約班表視窗 -->
<div class="modal fade" id="reservedItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reservedTitle">您有預約</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="ReTakeOff">我要請假</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="TakeOffItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="TakeOffTitle">編寫請假單</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="checkTakeOff">確定</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>

<!-- 申請假單最終結果 -->
<div class="modal fade" id="takeoffResItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="takeoffResTitle">申請結果</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="takeoffRes">我知道了</button>
      </div>
    </div>
  </div>
</div>

<!-- 已申請過假單 -->
<div class="modal fade" id="takeoffedItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="takeoffedTitle">申請結果</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="takeoffed">我知道了</button>
      </div>
    </div>
  </div>
</div>

<!-- 新增班表確認 -->
<div class="modal fade" id="addNewItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addNewTitle">確認新增</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="addNew">確定</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>

<!-- 新增班表結果 -->
<div class="modal fade" id="addResultItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addResultTitle">新增結果</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="addResult">我知道了</button>
      </div>
    </div>
  </div>
</div>
<input type="hidden" id="account" value="${empLoginOK.account}"/>
<div id="calendar"></div>
</div>
	<!-- Footer -->
	<jsp:include page="/fragment/footer.jsp" />
<!--=======================載入script檔跟程式==========================-->
<script src="<c:url value='/fullCalendar/moment.min.js'/>"></script>
<script src="<c:url value='/fullCalendar/fullcalendar.min.js'/>"></script>
<script src="<c:url value='/fullCalendar/calender.js'/>"></script>
<script type="text/javascript" src="<c:url value='/fullCalendar/zh-tw.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- loading用 -->
<script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@1.6.0/src/loadingoverlay.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@1.6.0/extras/loadingoverlay_progress/loadingoverlay_progress.min.js"></script>
</body>
<script>     
$(document).ready(function() {

	$.LoadingOverlaySetup({
	    color : "rgba(255,255,255, 1)",
	});
// 	$.LoadingOverlay("show");
	setTimeout(function(){
	    $.LoadingOverlay("hide");
	}, 2500);
	var initialLocaleCode = 'zh';
	var EmpId=$("#empId").val();
	var account=$("#account").val();
	var mom = moment();
	var reserveData;
	var time;
	var minT;
	var maxT;
	var contentH;
	var weekformat=["一","二","三","四","五","六","日"];
	var today = new Date();
	var eventsData;
	var addNewTime;		
	$("#chooseTime").change(function(){
		time = $("#chooseTime :selected").prop("id");		
		if(time=="allday"){
			minT="08:00";
			maxT="21:00";
			contentH="1000";
			}else if(time=="aft"){
				minT="14:00";
				maxT="18:00";
				contentH="auto";
			}else if(time=="nig"){
					minT="19:00";
					maxT="21:00";
					contentH="auto";
			}else{
					minT="08:00";
					maxT="12:00";
					contentH="auto";
				}
		$("#calendar").fullCalendar('option', { minTime:minT, maxTime:maxT ,contentHeight:contentH})
		})
		
	$.getJSON("<c:url value='/AdvisoryMomemt/employeeSelectAll.controller'/>",{"EmpId":EmpId},function(eventsData){	
		
    $('#calendar').fullCalendar({
    	 columnHeaderHtml: function(mom) {
        	 for(var i = 0;i<7;i++){
    		    if (mom.weekday() === i) {
    		      return "<span class='columnHead'>"+mom.format('MM/DD')+"\r\n"+weekformat[i]+"</span>";
    		    } }
    		  },    	
    	customButtons: {
    		BackToToday:{
				text:'回到今天',
				click:function(){
					$('#calendar').fullCalendar('today');
					}
        		},
        	SelectByEmpID:{
        		text:'我的班表',
				click:function(){
					$.getJSON("<c:url value='/AdvisoryMomemt/employeeSelectById.controller'/>",{"EmpId":EmpId},function(eventsData){	
						$("#calendar").fullCalendar('removeEventSources');
						$("#calendar").fullCalendar('addEventSource', eventsData);
						$("#calendar").fullCalendar('rerenderEvents');
						})
					}
            	},
            AllMoment:{
            		text:'所有班表',
    				click:function(){	
    						$("#calendar").fullCalendar('removeEventSources');
    						$("#calendar").fullCalendar('addEventSource', eventsData);
    						$("#calendar").fullCalendar('rerenderEvents');
    					}
            }
        },
      defaultView:'agendaWeek',
      header: {
        left: '',
        center: 'prev, title, next',
        right: 'agendaWeek,agendaDay,BackToToday,AllMoment,SelectByEmpID'
      },
      allDaySlot:false,
//       dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
      firstDay:1,
      slotDuration:'00:05:00',
      slotLabelFormat:'hh:mm',
      defaultTimedEventDuration:"00:15",
      minTime:"08:00",
      maxTime:"12:00",
      contentHeight:"auto",
      navLinks: true, // can click day/week names to navigate views
      editable: false,
      selectable: true,
//       eventLimit: true, // allow "more" link when too many events
	  eventSources:[	
	  		{events:eventsData}
		  ],	   	
	  eventClick: function eventCheck(events) {
		  var docFrag = $(document.createDocumentFragment());
          var reserve = $('.modal-body');
          reserve.empty();
		  var startTime =moment(events.start).format("a H:mm");
		  var sendBackTime=moment(events.start).format("YYYY-MM-DD HH:mm");
		  var endTime =moment(events.end).format("H:mm");
		  var emptyChar = events.title.indexOf("\r\n");
		  var reserveItem=events.title.substr(0,emptyChar);
		  var empId=events.empId;
		  var reserveEmp=events.title.substr(emptyChar+2);
		  var MomentId=events.MomentId;
		  var takeoff=events.takeoff;
		  var MomentStatus=events.MomentStatus;
		  var reResult=events.reResult;
		  if(events.backgroundColor=="#0080ff" && takeoff == "noexist" || reResult == "N"){
			  $('#UnReserveItem').modal('show');
			  docFrag.append("<h3>諮詢時段:</h3><h5>"+startTime+"\n~\n"+endTime+"</h5>"
			  			+"<h3>諮詢項目:</h3><h5>"+reserveItem+"</h5>"
					  	+"<h3>諮詢人員:</h3><h5>"+reserveEmp+"</h5>");
			  	$("#UnReserveItem .modal-body").append(docFrag);
			  	reserveData ={"startTime":sendBackTime,"reserveItem":reserveItem,"reserveEmp":reserveEmp,"empId":empId,"MomentId":MomentId};
			  }else if(events.backgroundColor=="#d26900" && takeoff == "noexist" || reResult=="N"){
				reserveData ={"startTime":sendBackTime,"reserveItem":reserveItem,"reserveEmp":reserveEmp,"empId":empId,"MomentId":MomentId};
				  $('#reservedItem').modal('show');
				  docFrag.append("<h3>視訊代碼:"+events.selfResCode+"</h3>"
				  			+"<h3>諮詢時間:"+"<span>"+moment(events.start).format("YYYY-MM-DD HH:mm")+"</span>"+"</h3>");
				  	$("#reservedItem .modal-body").append(docFrag);
				}else if(events.backgroundColor=="#0080ff" && takeoff == "exist" && reResult == "null"|| events.backgroundColor=="#d26900" && takeoff == "exist"  && reResult=="null"){					
						docFrag.append("<h3>"+"請假申請審核中"+"</h3>");
						$("#takeoffedItem .modal-body").append(docFrag);
						$('#takeoffedItem').modal('show');								
					}  
	  },
	  eventMouseover:function( event, jsEvent, view ) {
				$(this).addClass('zoom')
		  },
	  eventMouseout:function( event, jsEvent, view ) {
		  		$(this).removeClass('zoom')  
		  },
	  //新增班表
	  select: function(startDate, endDate) {
		  var docFrag = $(document.createDocumentFragment());
          var addNew = $('#addNewItem .modal-body');
          addNew.empty();
		  var start = moment(startDate).format("YYYY-MM-DD HH:mm");
		  var add15m = moment(startDate).add(15,"m");
		  var end = moment(add15m).format("HH:mm");
		  addNewTime={"start":start};
		  docFrag.append("<h3>您選擇的時段為:</h3><h5>"+start+"~"+end+"</h5><br/><h3>確定要在此時段新增諮詢?</h3>");
		  addNew.append(docFrag);
		  $('#addNewItem').modal('show');		      
		    }			  
    });
	});	
	$("#fastSearch").click(function(){
		var chooseyear = "20"+$("#year :selected").val();
		var choosemonth = "-"+$("#month :selected").val();
		var choosedate = "-"+$("#date :selected").val();
		var checkDate =moment(chooseyear+choosemonth+choosedate,"YYYY-MM-DD");
		$("#calendar").fullCalendar('gotoDate',checkDate);
		})
		
 	//我要請假
$("#UnReTakeOff").click(function takeoff(){
	var docFrag = $(document.createDocumentFragment());
	$('#UnReserveItem').modal('hide');
	$('#reservedItem').modal('hide');
	$('#TakeOffItem').modal('show');
	docFrag.append("<span style='font-size:1.3em'>請假事項:  </span>"
			+"<select id='chooseToff'>"
			+"<option>請選擇</option>"
			+"<option>特休</option>"
			+"<option>事假</option>"
			+"<option>病假</option>"
			+"<option>公假</option>"
			+"<option>喪假</option>"
			+"<option>產假</option>"
			+"<option>生理假</option>"
			+"<option>家庭照顧假</option>"+"</select><br>"
			+"<span style='font-size:1.3em'>請假事由:</span><textarea id='takeoffReason' rows='6' cols='50' style='font-size:1em'></textarea>");
	$("#TakeOffItem .modal-body").append(docFrag);
	})	
$("#ReTakeOff").click(function takeoff(){
	var docFrag = $(document.createDocumentFragment());
	$('#UnReserveItem').modal('hide');
	$('#reservedItem').modal('hide');
	$('#TakeOffItem').modal('show');
	docFrag.append("<span style='font-size:1.3em'>請假事項:  </span>"
			+"<select id='chooseToff'>"
			+"<option>請選擇</option>"
			+"<option>特休</option>"
			+"<option>事假</option>"
			+"<option>病假</option>"
			+"<option>公假</option>"
			+"<option>喪假</option>"
			+"<option>產假</option>"
			+"<option>生理假</option>"
			+"<option>家庭照顧假</option>"+"</select><br>"
			+"<span style='font-size:1.3em'>請假事由:</span><textarea id='takeoffReason' rows='6' cols='50' style='font-size:1em'></textarea>");
	$("#TakeOffItem .modal-body").append(docFrag);
	})
		
		//送出請假申請
		$("#checkTakeOff").click(function(){		
			var docFrag = $(document.createDocumentFragment());
			var TakeoffItem = $("#chooseToff :selected").val();
			var TReason = $.trim($("#takeoffReason").val());
			if(TakeoffItem == "請選擇" ||TReason.length == 0){
				$(".txtWaring").remove();
				$("#checkTakeOff").removeAttr("data-dismiss");
				$("#TakeOffItem .modal-body").append("<h4 class='txtWaring'>請輸入請假事項及事由!!!</h4>");
			} else{
				$(".txtWaring").remove();
				$("#checkTakeOff").attr("data-dismiss","modal");
				var docFrag = $(document.createDocumentFragment());
				$.post("<c:url value='/AdvisoryMoment/takeoff.controller'/>",{"MomentId":reserveData.MomentId,"EmpId":reserveData.empId,"TakeoffItem":TakeoffItem,"TakeoffReason":TReason},function(result){
					docFrag.append("<h3>"+result+"<img src='../images/yes.png'/>"+"</h3>");
					$("#takeoffResItem .modal-body").append(docFrag);
					})
					$('#takeoffResItem').modal('show');
				}
			})
		$("#takeoffRes").click(function(){
			window.location.reload();
		});
		$("#addResult").click(function(){
			window.location.reload();
		});
		$("#addNew").click(function(){
			$.post("<c:url value='/AdvisoryMomemt/empAddMoment.controller'/>",{"empId":EmpId,"account":account,"start":addNewTime.start},function(result){
				var docFrag = $(document.createDocumentFragment());
				var addResult = $('#addResultItem .modal-body');
				addResult.empty();
				if(result=="success"){
					docFrag.append("<span class='addSuccess'>新增成功</span><img src='<c:url value="/images/yes.png"/>'/>");
					}else{
					docFrag.append("<h3>新增班表失敗，請重新輸入或洽詢管理員</h3>");
						}
				addResult.append(docFrag);				
				$('#addNewItem').modal('hide');						
				$('#addResultItem').modal('show');						
		      })
			})
						
// 	$("#Change").click(function(){
// 		$('#UnReserveItem').modal('hide');
// 		$('#changeItem').modal('show');
// 		})


});

function rload(){
	window.location.reload();
}

</script>
</html>