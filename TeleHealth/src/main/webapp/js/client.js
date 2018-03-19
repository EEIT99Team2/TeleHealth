var connection = new WebSocket('wss://tzeing.asuscomm.com:15449');
	name = "",
	username = "",
	userAccount = document.querySelector("#user"),
	roomNameInput = document.querySelector("#roomName"),
	hangUpButton = document.querySelector("#hang-up"),
	joinButton = document.getElementById("join"),
	yourVideo = document.querySelector("#yours"),
	theirVideo = document.querySelector("#theirs"),
	fullscreenButton = document.querySelector('#fullscreen'),
	yourConnection = null,
	connectedUser = "",
	room = "",
	stream = null;

var offerOptions = {
		  offerToReceiveAudio: 1,
		  offerToReceiveVideo: 1
		};

var configuration = {
		iceServers: [
            {
				urls: "stun:stun.l.google.com:19302"
			},
			{
            	urls: 'turn:numb.viagenie.ca',
            	credential: 'turnserver',
            	username: 'm70049@outlook.com'
            }
		]
};

//載入畫面後，自動登入WebSocket
window.onload = function() {
	name = userAccount.value;
	if(name.length > 0) {
		send({
			type: "login",
			 name: name
		});
	}
}

connection.onopen = function() {
    console.log("Connected");
};

connection.onmessage = function(message) {
    console.log("Got message ", message.data);

    var data = JSON.parse(message.data);
    switch (data.type) {
        case "login":
            onLogin(data.success, data.name);
            break;
        
        case "joinreturn":
        	onJoinReturn(data.roomname,data.success,data.message,data.users,data.callname);
        	break;
            
        case "checkreturn":
        	onCheckReturn(data.success, data.callname);
        	break;
            
        case "offer":
        	console.log("case offer");
            onOffer(data.offer, data.name);
            break;

        case "answer":
        	console.log("getMessage = Answer")
            onAnswer(data.answer);
            break;

        case "candidate":
            onCandidate(data.candidate);
            break;

        case "leave":
            onLeave();
            break;
                	
        default:
            break;
    }
};

connection.onerror = function(err) {
    console.log("Got error ", err);
};

function send(message) {
    if (connectedUser) {
        message.name = connectedUser;
    }
    var str = "";
    for(var val in message) {
    	str = str + message[val] + ", ";
    }
    connection.send(JSON.stringify(message));
}

//進入房間
joinButton.addEventListener("click", function() {
	var roomName = roomNameInput.value;
	if(roomName.length > 0) {
		send({
			type: "join",
			roomname: roomName,
			name: name
		});
	} else {
		alert("請輸入要進行視訊的對象ID!");
	}
});

hangUpButton.addEventListener("click", function() {
	console.log("roomname = " + room);
	console.log("name = " + name);
	send({
		type: "leave",
		leavename: name,
		calluser: connectedUser,
		roomname : room
	});
	onLeave();
//	location.reload();
});
var screenFlag = false;
fullscreenButton.addEventListener("click", function() {
	if(screenFlag == false) {
		if (theirVideo.requestFullscreen) {
			theirVideo.requestFullscreen();
		} else if (theirVideo.msRequestFullscreen) {
			theirVideo.msRequestFullscreen();
		} else if (theirVideo.mozRequestFullScreen) {
			theirVideo.mozRequestFullScreen();
		} else if (theirVideo.webkitRequestFullscreen) {
			theirVideo.webkitRequestFullscreen();
		}
	} else {
		Document.exitFullscreen();
	}
});

function onLogin(success, name) {
    if (success === false) {
        alert("登入的ID： " + name + " 重複，請重新輸入!");
    } else {
//        loginPage.style.display = "none";
//        callPage.style.display = "block";
        startConnection();
    }
}

function onJoinReturn(roomname, success, message, users, callname) {
	if(success) {
		room = roomname;
		if(success && users == 2) {
			console.log("processing onJoinReturn");
			startPeerConnection1(callname);
		} else {
			alert(message);
		}
	}
}
 
function onOffer(offer, callname) {
	connectedUser = callname;
    console.log("handleOffer" + "," + offer + "," + connectedUser);
	yourConnection.setRemoteDescription(new RTCSessionDescription(offer));
	console.log("Create Answer!")
	var answer = yourConnection.createAnswer().then(function(answer) {
		yourConnection.setLocalDescription(answer);
		send({
			type: "answer",
			answer: answer,
			username : connectedUser
		});
	})
}	

function onAnswer(answer) {
	yourConnection.setRemoteDescription(answer);
}

function onCandidate(a) {
	yourConnection.addIceCandidate(new RTCIceCandidate(a));
	hangUpButton.disabled = false;
}

function onLeave() {
	hangUpButton.disabled = true;
	joinButton.disabled = false;
	connectedUser = null;
	theirVideo.src = null;
	yourConnection.onicecandidate = null;
	yourConnection.ontrack = null;
	yourConnection.close();
	startConnection();
}

function hasUserMedia() {
	navigator.getUserMedia =
        navigator.getUserMedia ||
        navigator.webkitGetUserMedia ||
        navigator.mozGetUserMedia ||
        navigator.msGetUserMedia ||
        navigator.mediaDevices.getUserMedia;
    return !!navigator.getUserMedia;
}

function hasRTCPeerConnection() {
    window.RTCPeerConnection =
        window.RTCPeerConnection ||
        window.webkitRTCPeerConnection ||
        window.mozRTCPeerConnection ||
        window.pluginRTCPeerConnection ||
        window.msRTCPeerConnection;
    window.RTCSessionDescription = 
    	window.RTCSessionDescription ||
    	window.webkitRTCSessionDescription ||
    	window.mozRTCSessionDescription||
    	window.pluginRTCSessionDescription ||
    	window.msRTCSessionDescription;
    window.RTCIceCandidate = 
    	window.RTCIceCandidate ||
    	window.webkitRTCIceCandidate ||
    	window.mozRTCIceCandidate ||
    	window.pluginRTCIceCandidate ||
    	window.msRTCIceCandidate;
    	
    return !!window.RTCPeerConnection;
}

function startConnection() {
	if(hasUserMedia()) {
		navigator.mediaDevices
        .getUserMedia({ audio: true, video: true })
        .then(myStream => {
            console.log("start streaming");
            stream = myStream;
            if(yourVideo.srcObject != stream) {
            	yourVideo.srcObject = stream;
            }
            if (hasRTCPeerConnection()) {
                setupPeerConnection(stream);
            } else {
                alert("Sorry, your browser does not support WebRTC.");
            }
        })
	} else {
		alert("Sorry, your browser dose not support WebRTC.");
	}
}

function setupPeerConnection(stream) {
    yourConnection = new RTCPeerConnection(configuration);
    //設定連線
    stream.getTracks().forEach(function(track) {
    	yourConnection.addTrack(track, stream)
    });
    
    yourConnection.ontrack = function(event) {
    	 if (theirVideo.srcObject !== event.streams[0]) {
    		 theirVideo.srcObject = event.streams[0];
    		 console.log("設定theirVideo.srcObject!");
    		 joinButton.disabled = true;
    	 }
    };
    //設定ice處理事件
    yourConnection.onicecandidate = function(event) {
    	if(event.candidate) {
    		send({
    			type: "candidate",
    			candidate: event.candidate
    		});
    	}
    };
}

function startPeerConnection1(user) {
	connectedUser = user;
	//開始建立offer
	var offer = yourConnection.createOffer(offerOptions).then(function(offer) {
		yourConnection.setLocalDescription(offer);
		send({
			type: "offer",
			offer: offer ,
			callname: connectedUser
		});
	});
}