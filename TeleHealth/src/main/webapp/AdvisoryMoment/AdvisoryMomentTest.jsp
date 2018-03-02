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
<script src="../fullCalendar/moment.min.js"></script>
<script src="../fullCalendar/jquery-3.3.1.min.js"></script>
<script src="../fullCalendar/fullcalendar.min.js"></script>
<script type="text/javascript" src="../fullCalendar/zh-tw.js"></script>

<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1000px;
    margin: 0 auto;
/*     background-color: lightblue; */
  }
  
  #chooseCode {font-size:2em;}
  #chooseTime {font-size:2em;}
  #item {font-size:1.8em;
		 padding-right:10px;}
</style>
</head>
<body>
<%-- <form action="<c:url value="/AdvisoryMomemt/Choice.controller" />" method="GET"> --%>
<span id="item">時段:</span><select id="chooseTime">
<option id="allday">全天</option>
<option id="mor">上午</option>
<option id="aft">下午</option>
<option id="nig">晚上</option>
</select><br>
<span id="item">科別:</span><select id="chooseCode">
<option id="FAM">家醫科</option>
<option id="EAD">生活飲食</option>
<option id="REH">復健醫學</option>
<option id="DIA">糖尿病諮詢</option>
<option id="CAR">心血管慢性疾病諮詢</option>
<option id="WEL">健康減重</option>
</select><br>
<!-- </form> -->

<div id="calendar"></div>
<script>
$(document).ready(function() {
	var initialLocaleCode = 'zh';
	var urlPath = "/TeleHealth";
	var time;
	var minT;
	var maxT;
	var contentH;
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
		
	$("#chooseCode").change(function (){
		var code = $("#chooseCode :selected").prop("id");		
		$.getJSON(urlPath+"/AdvisoryMomemt/Choice.controller",{advisoryCode:code},function(data){	
			$.each(data,function(i,datas){
				})		
		console.log(data);
		$("#calendar").fullCalendar('removeEventSources');
		$("#calendar").fullCalendar('addEventSource', data);
		$("#calendar").fullCalendar('rerenderEvents');
		})
	});
	
    $('#calendar').fullCalendar({
    	customButtons: {
            myCustomButton: {
                text: 'custom!',
                click: function() {
                    alert('clicked the custom button!');
                }
            }
        },
      defaultView:'agendaWeek',
      header: {
        left: '',
        center: 'prev, title, next',
        right: 'month,agendaWeek,agendaDay,myCustomButton'
      },
      allDaySlot:false,
      firstDay:1,
      slotDuration:'00:05:00',
      slotLabelFormat:'hh:mm',
      axisFormat : 'H:mm',
      defaultTimedEventDuration:"00:15",
      minTime:"08:00",
      maxTime:"21:00",
      navLinks: true, // can click day/week names to navigate views
      editable: false,
//       eventLimit: true, // allow "more" link when too many events
	  eventSources:[
		  urlPath+"/AdvisoryMomemt/selectAll.controller"],	   	
	  eventClick: function(events) {
		  if(events.backgroundColor=="#0080ff"){

			  alert("要預約嗎?");
			  }
			  	    
		      
		  }
		  

    });
		
	$("#mybu2").click(function(){
		
		$("#calendar").fullCalendar('rerenderEvents');
		
		})
});


</script>
</body>
</html>