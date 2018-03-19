<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
@font-face {
    font-family: CJKtc_Bold;
    src: url(/TeleHealth/css/fonts/NotoSansMonoCJKtc_Bold.otf);
}

.div_right_bottom {
	background: navajowhite;
	width:300px;
	height:320px;
	padding:10px;
	right:0px;
	border:2px solid #69c;
	border-radius: 5px;
 	display:inline-block;
}
.sendTextArea {
	border: 1px red solid; 
	width: 75%; 
	margin-left: 5px;
	padding-bottom: 5px;
}
.sendBtn {
	width: 20%;
	margin-left: 3px;
	float:right;
	padding-bottom: 5px;
}

#content {
	font-family: CJKtc_Bold;
}

/* Scrollbar styles */
.myBox {
border: none;
padding: 0px;
font: 12px/20px;
width: 100%;
height: 100%;
overflow: scroll;
}

::-webkit-scrollbar {
width: 12px;
height: 12px;
}

::-webkit-scrollbar-track {
box-shadow: inset 0 0 10px olivedrab;
border-radius: 10px;
}

::-webkit-scrollbar-thumb {
border-radius: 10px;
background: yellowgreen; 
box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
}

::-webkit-scrollbar-thumb:hover {
background: #7bac10;
}
</style>
<div id="content" style="opacity:1;">

</div>
<script type="text/javascript">
	var customers = [];

	$(document).ready(function(){

	    $('#customerService2').toggle(1000);
		$('#setHide2').on("click",function() {
			$('#customerService').toggle(1000);
			$('#customerService2').toggle(1000);
		})
		$('#setHide').on("click",function() {
			$('#customerService').toggle(1000);
			$('#customerService2').toggle(1000);
		})
	});
	if($("#empId").val() != "" && $("#empId").val() != null) {
		$(function(){
		    var websocket;
		    var clientName = $("#empId").val();
		    var chater = "";
		    function connectServer() {
				if ("WebSocket" in window) {
					websocket = new WebSocket("wss://tzeing.asuscomm.com:443/websocket/echo?name=" + clientName);
				} else if ("MozWebSocket" in window) {
				    alert("MozWebSocket");
				    websocket = new MozWebSocket("ws://echo");
				} else {
				    alert("SockJS");
				    websocket = new SockJS("https://tzeing.asuscomm.com:443/websocket/sockjs/echo");
				}
		    }
		    //連線websocket
	    	connectServer();
	    	websocket.onopen = function (evnt) {
				console.log("websocket連接成功!")
	        };
	        websocket.onmessage = function (event) {
		        var customer = event.data.substring(event.data.indexOf(":")+1, event.data.indexOf("，"));
		        var outputMsg = event.data.substring(event.data.indexOf("$")+1);
				if(customer!="" && customer!=null) {
					if(customers.indexOf(customer) < 0) {
			        	customers.push(customer);
			        	var newChat = $('<div></div>').addClass("div_right_bottom").attr("id",customer);
			        	var chatTitle = $('<h4></h4>').text(customer).css("border-bottom","2px solid orange");
			        	var getMsg = $('<div></div>').addClass("well myBox text-left").attr("id",customer+"msg").css("height","70%").css("display","block");
			        	var sendMsg = $('<div></div>').addClass("row").attr("id",customer+"sendMsg").css("margin-left","1px").css("width","100%");
			        	var sendText = $('<textarea></textarea>').attr("id",customer+"Text").addClass("sendTextArea");
			        	var sendBtn = $('<button></button>').attr("id",customer+"Btn").addClass("btn .btn-default sendBtn").text("送出");
			        	sendMsg.append(sendText).append(sendBtn);
			        	newChat.append(chatTitle).append(getMsg).append(sendMsg);
			        	$('#content').append(newChat);
					}
				}
				$("#"+customer+"msg").html($("#"+customer+"msg").html() + "<div>" + customer + ":"+outputMsg+"</div>");
				$('#'+customer+"msg").css("border","3px solid red");
				$("#"+customer+"msg").animate({scrollTop: $("#"+customer+"msg").offset().top}, 2000);
				
	        };
	        websocket.onerror = function (event) {
	        };
	        websocket.onclose = function (event) {
	        	console.log("websocket連接中斷!");
	        };
		    
		    $("body").on("click", "#content button", function() {
		    	var toUser =  $(this).attr("id").substring(0, $(this).attr("id").indexOf("Btn"));
		    	var message = $(this).parent("div").find("textarea").val();
		    	var showMsg = $(this).parent("div").parent("div").children(".myBox");
		    	send(showMsg,toUser, message);
		        $(this).parent("div").find("textarea").val(" ");
		    });
		    
		    $("body").on("keyup", "#content textarea", function(e) {
			    if(e.keycode==13) {
			    	var toUser =  $(this).attr("id").substring(0, $(this).attr("id").indexOf("Btn"));
			    	var message = $(this).parent("div").find("textarea").val();
			    	var showMsg = $(this).parent("div").parent("div").children(".myBox");
			    	send(showMsg,toUser, message);
			        $(this).parent("div").find("textarea").val(" ");
				}
		    });

		    $("body").on("click", "#content textarea", function() {
		    	$(this).parents("div").parent("div").children(".myBox").css("border", "none");
		    });
		    
		    function send(showMsg, toUser, message){
		        if (websocket != null) {
			    	console.log("toUser=" + toUser);
			    	console.log("message=" + message);
		            var sendMsg = $('<div></div>').text(message);
		            sendMsg.addClass("text-right");
		            showMsg.append(sendMsg);
		            showMsg.animate({scrollTop: showMsg.offset().top}, 2000);
		            if ($.trim(toUser) != "") {
		            	message = toUser + "|" + message;
		            }
		            websocket.send(message);
		        } else {
		            alert("伺服器異常，請速聯繫相關人員排除!");
		        }
		    }
		});
	}
</script>