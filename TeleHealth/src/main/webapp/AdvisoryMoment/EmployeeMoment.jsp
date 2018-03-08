<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>諮詢時刻表</title>
    
<link href="../fullCalendar/fullcalendar.min.css" rel="stylesheet"/>
<link href="../fullCalendar/fullcalendar.print.min.css" rel="stylesheet"  media='print' />

<!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link href="../fullCalendar/w3.css" rel="stylesheet" type="text/css"/>
<style>

  body {
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
  }

  #calendar {
  
    max-width: 1100px;
    margin: 60px auto;
/*     background-color: lightblue; */
  }
  .fc-widget-header{
     background-color:#00e3e3;
	}
/* 	//week格線 */
/*    .fc .fc-agendaWeek-view .fc-bg tr > td{ */
/*     border: 2px solid grey; */
/* 	} */
/* 	//table格線 */
/* 	.fc-bg table{ */
		
/* 	} */
  .headerChoose {}
  .item1 {margin-left:100px;}
  .item2 {margin-left:200px;}
  .item3 {padding-right:10px;
		 }
  .columnHead{font-size:1.2em;}
  .eveMouseOver {cursor: pointer;}
</style>
</head>
<body>
<!-- Navigation -->
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top w3-black">
            <a class="navbar-brand" href="#">Carousel</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse w3-center" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">健康專欄 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#team">醫師介紹</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#pricing">方案介紹</a>
                    </li>
                </ul>
                <form action="<c:url value="/AdvisoryMomemt/MemberSelectByCode.controller" />" method="GET">
<input type="text" id="empId" name="empId" value="0A55726B-8733-451F-9939-4D387698C7B6">
<span id="item1" class="item1 nav-item active">快速查詢:</span>
<select id="year" class="headerChoose"></select><span id="item1" class="headerChoose nav-item active">年</span>
<select id="month" class="headerChoose"></select><span id="item1" class="headerChoose nav-item active">月</span>
<select id="date" class="headerChoose"></select><span id="item1" class="headerChoose nav-item active">日</span>
<button type="button" id="fastSearch" class="headerChoose">查詢</button>
<span id="item2" class="item2">時段:</span><select id="chooseTime" class="headerChoose nav-item active">
<option id="allday">全天</option>
<option id="mor">上午</option>
<option id="aft">下午</option>
<option id="nig">晚上</option>
</select>
</form>
                <!-- Trigger the modal with a button -->                
                <button type="button" class="btn btn-sm btn-outline-secondary" id="myBtn">Login</button>
            </div>
        </nav>
    </header>
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
<!--         <button type="button" class="btn btn-primary" id="Change">我要調班</button> -->
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
<!-- 調班視窗 暫定不需要 -->
<!-- <div class="modal fade" id="changeItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> -->
<!--   <div class="modal-dialog modal-dialog-centered" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="changeItemTitle">申請調班</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         <h2>不准調</h2> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-primary" data-dismiss="modal" id="checkChange">確定</button> -->
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<!-- 請假視窗 -->
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
<div id="calendar"></div>
<!-- Footer -->
    <footer class="w3-center w3-black w3-padding-16">
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">eeit</a></p>
    </footer>
<!--=======================載入script檔跟程式==========================-->
<script src="../fullCalendar/moment.min.js"></script>
<script src="../fullCalendar/jquery-3.3.1.min.js"></script>
<script src="../fullCalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="../fullCalendar/zh-tw.js"></script>
<script type="text/javascript" src="../fullCalendar/calender.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	var initialLocaleCode = 'zh';
	var EmpId=$("#empId").val();
	var mom = moment();
	var reserveData;
	var time;
	var minT;
	var maxT;
	var contentH;
	var weekformat=["一","二","三","四","五","六","日"];
	var today = new Date();
	var eventsData;
			
	$("#chooseTime").change(function(){
		time = $("#chooseTime :selected").prop("id");		
		if(time=="mor"){
			minT="08:00";
			maxT="12:00";
			contentH="auto";
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
					maxT="21:00";
					contentH="1000";
				}
		$("#calendar").fullCalendar('option', { minTime:minT, maxTime:maxT ,contentHeight:contentH})
		})
		
	$.getJSON("<c:url value='/AdvisoryMomemt/employeeSelectAll.controller'/>",{"EmpId":EmpId},function(eventsData){	
// 	$("#chooseCode").change(function (){
// 		var code = $("#chooseCode :selected").prop("id");
// 		if(code=="all"){
// 			$("#calendar").fullCalendar('removeEventSources');
// 			$("#calendar").fullCalendar('addEventSource', eventsData);
// 			$("#calendar").fullCalendar('rerenderEvents');
// 		}else{		
// 		$.getJSON("<c:url value='/AdvisoryMomemt/employeeSelectByCode.controller'/>",{"EmpId":EmpId,advisoryCode:code},function(data){	
// 		$("#calendar").fullCalendar('removeEventSources');
// 		$("#calendar").fullCalendar('addEventSource', data);
// 		$("#calendar").fullCalendar('rerenderEvents');
// 		})
// 		}
// 	});
		
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
					$.getJSON("<c:url value='/AdvisoryMomemt/employeeSelectById.controller'/>",{"EmpId":EmpId},function(Mydata){	
						$("#calendar").fullCalendar('removeEventSources');
						$("#calendar").fullCalendar('addEventSource', Mydata);
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
      displayEventEnd:false,
      minTime:"08:00",
      maxTime:"21:00",
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
		  if(events.backgroundColor=="#0080ff"){
			  $('#UnReserveItem').modal('show');
			  docFrag.append("<h3>諮詢時段:</h3><h5>"+startTime+"\n~\n"+endTime+"</h5>"
			  			+"<h3>諮詢項目:</h3><h5>"+reserveItem+"</h5>"
					  	+"<h3>諮詢人員:</h3><h5>"+reserveEmp+"</h5>");
			  	$("#UnReserveItem .modal-body").append(docFrag);
			  	reserveData ={"startTime":sendBackTime,"reserveItem":reserveItem,"reserveEmp":reserveEmp,"empId":empId,"MomentId":MomentId};
				console.log("events="+reserveData);
			  }else if(events.backgroundColor=="#d26900"){
				  $('#reservedItem').modal('show');
				  docFrag.append("<h3>視訊代碼:"+events.selfResCode+"</h3>"
				  			+"<h3>諮詢時間:"+"<span>"+moment(events.start).format("YYYY-MM-DD HH:mm")+"</span>"+"</h3>");
				  	$("#reservedItem .modal-body").append(docFrag);
				  }  
	  },
	  eventMouseover:function( event, jsEvent, view ) {
			if(event.backgroundColor=="#d26900"||event.backgroundColor=="#0080ff"){
				$('#calendar').fullCalendar(this).addClass('eveMouseOver')
				}
		  },
	  eventMouseout:function( event, jsEvent, view ) {
				$('#calendar').fullCalendar(this).removeClass('eveMouseOver') 
		  }			  
    });
	});	
	$("#fastSearch").click(function(){
		var chooseyear = "20"+$("#year :selected").val();
		var choosemonth = "-"+$("#month :selected").val();
		var choosedate = "-"+$("#date :selected").val();
		var checkDate =moment(chooseyear+choosemonth+choosedate,"YYYY-MM-DD");
		console.log(chooseyear+choosemonth+choosedate);
		$("#calendar").fullCalendar('gotoDate',checkDate);
		})
 
	$("#UnReTakeOff").click(function(){
		$('#UnReserveItem').modal('hide');
		$('#reservedItem').modal('hide');
		$('#TakeOffItem').modal('show');
		})
	$("#ReTakeOff").click(function(){
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
		
		$("#checkTakeOff").click(function(){		
			var docFrag = $(document.createDocumentFragment());
			var TakeoffItem = $("#chooseToff :selected").val();
			var TReason = $.trim($("#takeoffReason").val());
			if(TReason.length == 0){
				$("#checkTakeOff").prop("data-dismiss")="no";
			}else{
			console.log("請假事項"+TakeoffItem+"請假事由"+TReason);
				}
// 				$.post("",{},function(){
				
// 					})
			})
// 	$("#Change").click(function(){
// 		$('#UnReserveItem').modal('hide');
// 		$('#changeItem').modal('show');
// 		})
});
</script>
</body>
</html>