<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Footer -->
<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<span class="copyright">Copyright &copy; TeleHealth 2018</span>
			</div>
			<div class="col-md-4">
				<ul class="list-inline">
					<li class="list-inline-item"><a href="#"> <i><img
								title="Logo" src="<c:url value="/images/logo.png" />" /></i>
					</a></li>
				</ul>
			</div>
			<div class="col-md-4"></div>
			<c:if test="${not empty LoginOK}">
				<div id="customerService" class="div_right_bottom" style="background: navajowhite;">
					<div style="border-bottom: 1px red solid">
						<span>線上諮詢</span>
						<button id="setHide" class="btn btn-warning right_button" style="height: 20px">
							<i class="fas fa-angle-down" style="margin-bottom: 8px"></i>
						</button>
					</div>
					<div class="well myBox text-left" id="msgBox" style="background: navajowhite; height: 70%"></div>
					<div class="row"
						style="margin-left: 1px; background: navajowhite; width: 100%">
						<textarea 
							style="border: 1px red solid; width: 75%; margin-left: 5px"
							cols="5" id="inputMsg"></textarea>
						<button id="send" class="btn .btn-default"
							style='width: 20%; margin-left: 3px;'>送出</button>
					</div>
				</div>
				<div id="customerService2" class="hide_div_right_bottom">
					<button id="setHide2" class="hide_right_button btn btn-warning " >
						線上客服
					</button>
				</div>
			</c:if>
		</div>
	</div>
</footer>


<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
    $('#customerService').toggle(0);
    $('#customerService2').toggle(1000);
    $('#customerService').toggle(1000);
	$('#setHide2').on("click",function() {
		$('#customerService').toggle(1000);
		$('#customerService2').toggle(1000);
	})
	$('#setHide').on("click",function() {
		$('#customerService').toggle(1000);
		$('#customerService2').toggle(1000);
	})
});

if($("#memberId").val() != "" && $("#memberId").val() != null && $("#memberId").val()!= undefined) {
	$(function(){
	    var websocket;
	    var clientName = $("#account").val().substring(0, $("#account").val().indexOf("@"));
	    var chater = "930F2472-337E-4800-B774-EB0AAE703D2A";
	    function connectServer() {
			if ("WebSocket" in window) {
				websocket = new WebSocket("wss://tzeing.asuscomm.com:443/websocket/echo?name=" + clientName);
			} else if ("MozWebSocket" in window) {
			    alert("MozWebSocket");
			    websocket = new MozWebSocket("ws://echo");
			} else {
			    alert("SockJS");
			    websocket = new SockJS("https://tezing.asuscomm.com:443/websocket/sockjs/echo");
			}
	    }
	    
    	connectServer();
    	websocket.onopen = function (evnt) {
			console.log("websocket連接成功!")
        };
        websocket.onmessage = function (event) {
            $("#msgBox").html($("#msgBox").html() + "<div>"+event.data+"</div>");
            $("#msgBox").animate({scrollTop: $("#msgBox").offset().top}, 2000);
        };
        websocket.onerror = function (event) {
        };
        websocket.onclose = function (event) {
        	console.log("websocket連接中斷!");
        };
	    
	    $("#send").bind("click", function() {
	        send();
	        $('#inputMsg').val(" ");
	    });

	    $('#inputMsg').bind("keyup", function(e) {
		    if(e.keyCode == 13) {
		    	send();
		        $('#inputMsg').val(" ");
			}
		})
	    
	    function send(){
	        if (websocket != null) {
	            var message = $('#inputMsg').val();
	            var sendMsg = $('<div></div>').text(message);
	            sendMsg.addClass("text-right");
	            $("#msgBox").append(sendMsg);
	            $("#msgBox").animate({scrollTop: $("#msgBox").offset().top}, 2000);
	            if ($.trim(chater) != "") {
	            	message = chater + "|" + message;
	            }
	            websocket.send(message);
	        } else {
	            alert("很抱歉，目前客服人員忙線，請您稍後再聯繫!");
	        }
	    }
	});
}

</script>

<!-- Bootstrap core JavaScript -->
<script	src="<c:url value="/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!--     google 我不是機器人 -->
<script src='https://www.google.com/recaptcha/api.js'></script>
