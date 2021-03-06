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
    margin: 20px auto;   
    background-color:	#fff4c1;
    font-size:18px;
  }
   
 	.fc-toolbar{ 
 	background-color:white;
 	} 
  .headFont {font-size:20px;}
  .columnHead{display:inline-block;font-size:1.5em;}
  .momentColor {font-family: CJKtc_Bold;}
  .eventItem{text-align:center;
  			font-size:18px;}
  .selectTime{margin-top:40px;}
  .selectWord {padding:0px 5px;}
</style>
</head>
<body>
<jsp:include page="/fragment/nav2.jsp" />
<div class="container">
<div class="row headFont">
<div class="momentColor col-2"><span style='color:#0080ff'>尚未被預約</span><br/><span style='color:#00db00'>您已預約</span><br/><span style='color:#ea0000'>已被預約</span></div>
<div class="col-6 selectTime">
<span class="selectWord">快速查詢:</span>
<select id="year"><option>請選擇</option></select><span class="selectWord">年</span>
<select id="month"><option>請選擇</option></select><span class="selectWord">月</span>
<select id="date"><option>請選擇</option></select><span class="selectWord">日</span>
<button type="button" id="fastSearch" class="btn btn-success">查詢</button>
</div>
<div class="col-2 selectTime">
<span class="selectWord">時段:</span><select id="chooseTime">
<option id="allday">全天</option>
<option id="mor" SELECTED>上午</option>
<option id="aft">下午</option>
<option id="nig">晚上</option>
</select>
</div>
<div class="col-2 selectTime">
<span class="selectWord">科別:</span><select id="chooseCode">
<option id="all">所有諮詢項目</option>
<option id="FAM">家庭醫學</option>
<option id="EAD">生活飲食</option>
<option id="REH">復健醫學</option>
<option id="DIA">糖尿病諮詢</option>
<option id="CAR">心血管慢性疾病</option>
<option id="WEL">健康減重</option>
</select><br>
</div>
</div>
<!-- 點擊預約時段彈跳視窗 -->
<div class="modal fade" id="reserveDataDetail" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reserveCheckTitle">預約告示</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="reserveCheck">確定預約</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
      </div>
    </div>
  </div>
</div>
<!-- 預約結果視窗 -->
<div class="modal fade" id="reserveResult" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reserveDoneTitle">預約結果</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="reserveDone">我知道了</button>
      </div>
    </div>
  </div>
</div>

<!-- 已預約查詢視窗 -->
<div class="modal fade" id="checkResult" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="checkResultTitle">您的預約</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="checkResultDone">我知道了</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="cancelReserve">取消預約</button>
      </div>
    </div>
  </div>
</div>

<!-- 取消預約查詢視窗 -->
<div class="modal fade" id="cancelReserveItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="checkResultTitle">警告</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="cancelReserveCheck">確定</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="NocancelReserve">取消</button>
      </div>
    </div>
  </div>
</div>

<!-- 確定取消預約視窗 -->
<div class="modal fade" id="cancelCheckItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="checkResultTitle">取消預約結果</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="cancelCheck">我知道了</button>
      </div>
    </div>
  </div>
</div>

<!-- 點數不足視窗 -->
<div class="modal fade" id="noPointItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="noPointTitle">取消預約結果</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="noPoint">加值去<i class="fas fa-money-bill-alt"></i></button>
      </div>
    </div>
  </div>
</div>

<!-- 預約已過視窗 -->
<div class="modal fade" id="passReserveItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="passReserveTitle">預約結果</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">我知道了</button>
      </div>
    </div>
  </div>
</div>

<div id="calendar"></div>
</div>
<!-- Footer -->
<jsp:include page="/fragment/footer.jsp" />
<!--=======================載入script檔跟程式==========================-->
<script src="<c:url value='/fullCalendar/moment.min.js'/>"></script>
<script src="<c:url value='/fullCalendar/fullcalendar.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/fullCalendar/zh-tw.js'/>"></script>
<script type="text/javascript" src="<c:url value='/fullCalendar/calender.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
</body>
<script>
$(document).ready(function() {
	var initialLocaleCode = 'zh';
	var UserId=$("#memberId").val();
	var mom = moment();
	//預約用
	var reserveData;
	//取消預約用
	var reservedData;
	var time;
	var minT;
	var maxT;
	var contentH;
	var weekformat=["一","二","三","四","五","六","日"];
	var today = new Date();
	var eventsData;

	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
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
	$.getJSON("<c:url value='/AdvisoryMomemt/memberSelectAll.controller'/>",{"UserId":UserId},function(eventsData){	
	$("#chooseCode").change(function (){
		var code = $("#chooseCode :selected").prop("id");
		if(code=="all"){
			$("#calendar").fullCalendar('removeEventSources');
			$("#calendar").fullCalendar('addEventSource', eventsData);
			$("#calendar").fullCalendar('rerenderEvents');
		}else{		
		$.getJSON("<c:url value='/AdvisoryMomemt/memberSelectByCode.controller'/>",{"UserId":UserId,advisoryCode:code},function(data){	
		$("#calendar").fullCalendar('removeEventSources');
		$("#calendar").fullCalendar('addEventSource', data);
		$("#calendar").fullCalendar('rerenderEvents');
		})
		}
	});
	
    $('#calendar').fullCalendar({
    	 columnHeaderHtml: function(mom) {
        	 for(var i = 0;i<7;i++){
    		    if (mom.weekday() === i) {
    		      return "<span style='color:#000000'>"+mom.format('MM/DD')+"\r\n"+weekformat[i]+"</span>";
    		    } }
    		  },    	
    	customButtons: {
            myCustomButton: {
                text: '回到今天',
                click: function() {
                	$('#calendar').fullCalendar('today');
                }
            }
        },
      defaultView:'agendaWeek',
      header: {
        left: '',
        center: 'prev, title, next',
        right: 'agendaWeek,agendaDay,myCustomButton'
      },
      allDaySlot:false,
//       dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
      firstDay:1,
      handleWindowResize: true,
      slotDuration:'00:05:00',
      slotLabelFormat:'hh:mm',
      defaultTimedEventDuration:"00:15",
      displayEventTime: true,
      minTime:"08:00",
      maxTime:"12:00",
      contentHeight:"auto",
      navLinks: true, // can click day/week names to navigate views
      editable: false,
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
		  var VideoCode=events.VideoCode;
		  var memPoint=events.point;
		  if(events.backgroundColor=="#0080ff"){
			  $('#reserveDataDetail').modal('show');
			  docFrag.append("<h3>諮詢時段:</h3><h5>"+startTime+"\n~\n"+endTime+"</h5>"
			  			+"<h3>諮詢項目:</h3><h5>"+reserveItem+"</h5>"
					  	+"<h3>諮詢人員:</h3><h5>"+reserveEmp+"</h5>");
			  	$("#reserveDataDetail .modal-body").append(docFrag);
			  	reserveData ={"startTime":sendBackTime,"reserveItem":reserveItem,"reserveEmp":reserveEmp,"empId":empId,"UserId":UserId,"MomentId":MomentId,"memPoint":memPoint};
			  }else if(events.backgroundColor=="#00db00"){
				  reservedData={"startTime":sendBackTime,"reserveItem":reserveItem,"reserveEmp":reserveEmp,"empId":empId,"UserId":UserId,"MomentId":MomentId,"VideoCode":VideoCode,"memPoint":memPoint};
				  $('#checkResult').modal('show');
				  docFrag.append("<h3>諮詢項目:"+reserveItem+"</h3>"
						  	+"<h3>諮詢人員:"+reserveEmp+"</h3>"
				  			+"<h3>諮詢時間:"+"<span>"+moment(events.start).format("YYYY-MM-DD HH:mm")+"</span>"+"</h3>");
				  	$("#checkResult .modal-body").append(docFrag);
				  } 
	  },
	  eventMouseover:function( event, jsEvent, view ) {
				$(this).addClass('zoom')
		  },
	  eventMouseout:function( event, jsEvent, view ) {
				$(this).removeClass('zoom') 
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
	$("#reserveCheck").click(function(){
		var docFrag = $(document.createDocumentFragment());
		var now = moment(new Date()).format("YYYY-MM-DD HH:mm");
		var Time = moment(reserveData.startTime).format("YYYY-MM-DD HH:mm");
		var ms = moment(Time).diff(now);
		var checkPoint=reserveData.memPoint;
		if(checkPoint <5){
			$('#reserveDataDetail').modal('hide');
			 $('#noPointItem').modal('show');
			  docFrag.append("<h3>您的剩餘點數不足，請加值後再進行預約喔</h3>");
			  	$("#noPointItem .modal-body").append(docFrag);
			}else if(ms<0){
				$('#reserveDataDetail').modal('hide');
				 $('#passReserveItem').modal('show');
				  docFrag.append("<h3>此時段已過預約時間</h3>");
				  	$("#passReserveItem .modal-body").append(docFrag);
			} else{
			$.post("<c:url value='/Advisory/reserveCheck.controller'/>",{"advisoryTime":reserveData.startTime,"reserveItem":reserveData.reserveItem,
				"reserveEmp":reserveData.reserveEmp,"empId":reserveData.empId,"UserId":reserveData.UserId,"MomentId":reserveData.MomentId},function(result){			
				var splitCode1=result.indexOf(",");
				var splitCode2=result.indexOf(",,");
				$('#reserveDataDetail').modal('hide');
				 $('#reserveResult').modal('show');
				  docFrag.append("<h3>"+result.substr(0,splitCode1)+"</h3>"
				  			+"<h3>視訊代碼為:"+"<span>"+result.substr(7,splitCode2-7)+"</span>"+"</h3>"
				  			+"<h3>時間:"+"<span>"+result.substr(splitCode2+2)+"</span>"+"</h3>");
				  	$("#reserveResult .modal-body").append(docFrag);
				})
				}
		})  
	$("#reserveDone").click(function(){
		window.location.reload();
		})
	$("#cancelCheck").click(function(){
		window.location.reload();
		})
	$("#checkResultDone").click(function(){
		$("#checkResult").modal('hide');
		})
	$("#cancelReserve").click(function(){
		var docFrag = $(document.createDocumentFragment());
		$("#checkResult").modal('hide');
		 $('#cancelReserveItem').modal('show');
		  docFrag.append("<h3>確定要取消預約?</h3>");
		  	$("#cancelReserveItem .modal-body").append(docFrag);
		})
	
	$("#cancelReserveCheck").click(function(){
		var docFrag = $(document.createDocumentFragment());		
		$.post("<c:url value='/AdvisoryMomemt/memberCancelRes.controller'/>",{"MomentId":reservedData.MomentId,"VideoCode":reservedData.VideoCode,"UserId":reservedData.UserId},function(result){
			$("#cancelReserveItem").modal('hide');
			if(result == "success"){
			docFrag.append("<h3>取消預約成功<img src='<c:url value="/images/yes.png"/> '/>"+"</h3>");
				}else{
			docFrag.append("<h3>取消預約失敗<img src='<c:url value="/images/error.png"/> '/>"+"</h3>");
					}
			$("#cancelCheckItem").modal('show');
	  	$("#cancelCheckItem .modal-body").append(docFrag);
			})
		})

	$("#noPoint").click(function(){
		window.location.href="/TeleHealth/pay/pay.jsp";
		})
});
</script>
</html>