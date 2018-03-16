<%@ page contentType="text/html; charset=utf-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!--<script type="text/javascript" src="js/jquery-1.7.2.js"></script>-->
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <title>webSocket测试</title>
    <script type="text/javascript">
    	var chater;
    	
        $(function(){
        	
            var websocket;
            function connectServer() {
            	var clientName = $("#client_name").val();
				if ("WebSocket" in window) {
					websocket = new WebSocket("wss://192.168.21.76:8443/websocket/echo?name=" + clientName);
				} else if ("MozWebSocket" in window) {
				    alert("MozWebSocket");
				    websocket = new MozWebSocket("ws://echo");
				} else {
				    alert("SockJS");
				    websocket = new SockJS("https://192.168.21.76:8443/websocket/sockjs/echo");
				}
            }
            
            $("#conncet_server").bind("click", function() {
            	connectServer();
            	
            	websocket.onopen = function (evnt) {
					console.log("websocket連接成功");
                };
                websocket.onmessage = function (evnt) {
                    $("#msg").html($("#msg").html() + "<br/>" + evnt.data);
                };
                websocket.onerror = function (evnt) {
                };
                websocket.onclose = function (evnt) {
                	console.log("websocket連線中斷");
                }
            });
            
            $("#send").bind("click", function() {
                send();
            });
            
            function send(){
                if (websocket != null) {
                    var message = document.getElementById("message").value;
                    
                    if ($.trim(chater) != "") {
                    	message = chater + "|" + message;
                    }
                    
                    websocket.send(message);
                } else {
                    alert("未連接伺服器");
                }
            }
        });
        
        function changeChater(e) {
        	chater = $(e).html();
        	alert("您將對" + chater + "發送訊息");
        }
    </script>

</head>
<body>

	<div class="page-header" id="tou">牽伴線上客服</div>
	<div class="well" id="msg"></div>
	<div class="col-lg">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="請輸入登入代號" id="client_name"> 
			<span class="input-group-btn">
				<button class="btn btn-default" type="button" id="conncet_server">連接伺服器</button>
			</span>
		</div>
	</div>
	
	<br/>
	
	<div class="col-lg">
		<div class="input-group">
			<input type="text" class="form-control" placeholder="發送訊息..." id="message"> 
			<span class="input-group-btn">
				<button class="btn btn-default" type="button" id="send">傳送</button>
			</span>
		</div>
	</div>
</body>

</html>
