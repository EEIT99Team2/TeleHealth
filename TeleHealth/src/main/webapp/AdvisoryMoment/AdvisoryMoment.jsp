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
  .headerChoose {font-size:1.5em;}
  .item1 {font-size:1.8em;
		 margin-left:100px;}
  .item2 {font-size:1.8em;
		 margin-left:100px;}
  .item3 {font-size:1.8em;
		 padding-right:10px;
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
                        <a class="nav-link" href="<c:url value="/healthcolumn/HealthColumn.jsp"/>">健康專欄 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#team">醫師介紹</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#pricing">方案介紹</a>
                    </li>
                
                <c:if test="${not empty LoginOK}">
                       <li class="nav-item">
                        <a class="nav-link" href="#pricing">健康護照</a>
                    </li>
				    </c:if>
               	    <c:if test="${not empty LoginOK}">
                      <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/AdvisoryMoment/AdvisoryMoment.jsp'/>">預約時刻</a>
                    </li>
				     </c:if>
				     <c:if test="${not empty LoginOK}">
                      <li class="nav-item">
                        <a class="nav-link" href="#pricing">會員專區</a>
                    </li>
				     </c:if>
				   </ul>

<span id="item1" class="item1">快速查詢:</span>
<select id="year" class="headerChoose"></select><span id="item1" class="headerChoose">年</span>
<select id="month" class="headerChoose"></select><span id="item1" class="headerChoose">月</span>
<select id="date" class="headerChoose"></select><span id="item1" class="headerChoose">日</span>
<button type="button" id="fastSearch" class="headerChoose">查詢</button>
<span id="item2" class="item2">時段:</span><select id="chooseTime" class="headerChoose">
<option id="allday">全天</option>
<option id="mor">上午</option>
<option id="aft">下午</option>
<option id="nig">晚上</option>
</select>
<span id="item3" class="item3">科別:</span><select id="chooseCode" class="headerChoose">
<option id="all">所有諮詢項目</option>
<option id="FAM">家庭醫學</option>
<option id="EAD">生活飲食</option>
<option id="REH">復健醫學</option>
<option id="DIA">糖尿病諮詢</option>
<option id="CAR">心血管慢性疾病諮詢</option>
<option id="WEL">健康減重</option>
</select><br>

                <c:if test="${empty LoginOK}">
                       <button type="button" class="btn btn-sm btn-outline-secondary" id="login"><c:out value="Losgin"/></button>
				</c:if>
               	<c:if test="${not empty LoginOK}">
                       <button type="button" name="<c:out value='${LoginOK.memberId}'/>" class="btn btn-sm btn-outline-secondary" id="loginName"><c:out value="${LoginOK.memName},你好!!"/></button>
				</c:if>
            </div>
        </nav>
    </header>
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
<div id="calendar"></div>

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


<div id="calendar"></div>

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
	var UserId=$("#loginName").prop("name");
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
    		      return "<span class='columnHead'>"+mom.format('MM/DD')+"\r\n"+weekformat[i]+"</span>";
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
		  var VideoCode=events.VideoCode;
		  if(events.backgroundColor=="#0080ff"){
			  $('#reserveDataDetail').modal('show');
			  docFrag.append("<h3>諮詢時段:</h3><h5>"+startTime+"\n~\n"+endTime+"</h5>"
			  			+"<h3>諮詢項目:</h3><h5>"+reserveItem+"</h5>"
					  	+"<h3>諮詢人員:</h3><h5>"+reserveEmp+"</h5>");
			  	$("#reserveDataDetail .modal-body").append(docFrag);
			  	reserveData ={"startTime":sendBackTime,"reserveItem":reserveItem,"reserveEmp":reserveEmp,"empId":empId,"UserId":UserId,"MomentId":MomentId};
				console.log("events="+reserveData);
			  }else if(events.backgroundColor=="#00db00"){
				  reservedData={"startTime":sendBackTime,"reserveItem":reserveItem,"reserveEmp":reserveEmp,"empId":empId,"UserId":UserId,"MomentId":MomentId,"VideoCode":VideoCode};
				  $('#checkResult').modal('show');
				  docFrag.append("<h3>諮詢項目:"+reserveItem+"</h3>"
						  	+"<h3>諮詢人員:"+reserveEmp+"</h3>"
// 				  			+"<h3>視訊代碼:"+"<span>"+"</span>"+"</h3>"
				  			+"<h3>諮詢時間:"+"<span>"+moment(events.start).format("YYYY-MM-DD HH:mm")+"</span>"+"</h3>");
				  	$("#checkResult .modal-body").append(docFrag);
				  }  
	  },
	  eventMouseover:function( event, jsEvent, view ) {
			if(event.backgroundColor=="#00db00"||event.backgroundColor=="#0080ff"){
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
	$("#reserveCheck").click(function(){
		var docFrag = $(document.createDocumentFragment());
		console.log("reserveData checking=="+reserveData);
			$.post("<c:url value='/Advisory/ReserveCheck.controller'/>",{"advisoryTime":reserveData.startTime,"reserveItem":reserveData.reserveItem,
				"reserveEmp":reserveData.reserveEmp,"empId":reserveData.empId,"UserId":reserveData.UserId,"MomentId":reserveData.MomentId},function(result){			
				var splitCode1=result.indexOf(",");
				var splitCode2=result.indexOf(",,");reservedData
				$('#reserveDataDetail').modal('hide');
				 $('#reserveResult').modal('show');
				  docFrag.append("<h3>"+result.substr(0,splitCode1)+"</h3>"
				  			+"<h3>視訊代碼為:"+"<span>"+result.substr(7,splitCode2-7)+"</span>"+"</h3>"
				  			+"<h3>時間:"+"<span>"+result.substr(splitCode2+2)+"</span>"+"</h3>");
				  	$("#reserveResult .modal-body").append(docFrag);
				})
		})  
	$("#reserveDone").click(function(){
		window.location.reload();
		})
	$("#cancelCheck").click(function(){
		window.location.reload();
		})
	$("#checkResultDone").click(function(){
		console.log("reserveData beforeReload=="+reserveData);
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
		$.post("<c:url value='/AdvisoryMomemt/memberCancelRes.controller'/>",{"MomentId":reservedData.MomentId,"VideoCode":reservedData.VideoCode},function(result){
			$("#cancelReserveItem").modal('hide');
			$("#cancelCheckItem").modal('show');
			docFrag.append("<h3>"+result+"</h3>");
			console.log("result="+result);
	  	$("#cancelCheckItem .modal-body").append(docFrag);
			})
		})
});
</script>
<!-- Footer -->
    <footer class="w3-center w3-black w3-padding-16">
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">eeit</a></p>
    </footer>
</body>
</html>