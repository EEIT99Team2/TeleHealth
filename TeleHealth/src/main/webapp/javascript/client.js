var connection = new WebSocket('wss://tzeing.asuscomm.com:15449');
var name = "";
var username = "";

var loginPage = document.querySelector("#login-page"),
	usernameInput = document.querySelector("#username"),
	loginButton = document.querySelector("#login"),
	callPage = document.querySelector("#call-page"),
	theirUsernameInput = document.querySelector("#their-username"),
	callButton = document.getElementById("callHere"),
	hangUpButton = document.querySelector("#hang-up"),
	joinButton = document.getElementById("join"),
	yourVideo = document.getElementById("yours"),
	theirVideo = document.getElementById("theirs"),
	yourConnection,
	connectedUser,
	room,
	stream;

var offerOptions = {
		  offerToReceiveAudio: 1,
		  offerToReceiveVideo: 1
		};

var configuration = {
		 iceServers: [
				{
	                urls: "stun:23.21.150.121"
	            },
	            {
	                urls: "stun:stun.l.google.com:19302"
	            }
	            ,
	            {
	            	urls: 'turn:numb.viagenie.ca',
	            	credential: 'turnserver',
	            	username: 'm70049@outlook.com'
	            }
           ]
};

callPage.style.display="none";

loginButton.addEventListener("click", function(evnet) {
    name = usernameInput.value;
    if (name.length > 0) {
        send({
            type: "login",
            name: name
        });
    }
});

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

function onLogin(success, name) {
    if (success === false) {
        alert("登入的ID： " + name + " 重複，請重新輸入!");
    } else {
        loginPage.style.display = "none";
        callPage.style.display = "block";
        startConnection();
    }
}

callButton.addEventListener("click", function() {
	var theirUsername = theirUsernameInput.value;
	if(theirUsername.length > 0) {
		send({
			type: "callcheck",
//			username: username,
			callname: theirUsername
		});
	} else {
		alert("請輸入要進行視訊的對象ID!");
	}
});

//進入房間
joinButton.addEventListener("click", function() {
	var roomName = theirUsernameInput.value;
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
	send({
		type: "leave",
		name: name,
		roomname : room
	});
//	onLeave();
//	location.reload();
});

function onJoinReturn(roomname, success, message, users, callname) {
	if(success && users == 2) {
		console.log("processing onJoinReturn");
		startPeerConnection1(callname);
	} else {
		alert(message);
	}
}

function onCheckReturn(success, callname) {
	if(success) {
		startPeerConnection1(callname);
	} else {
		alert("你所要進行的視訊代號：" + callname + " 不在線上，請重新確認!");
	}
}

function onOffer(offer, name) {
	connectedUser = name;
    console.log("handleOffer" + "," + offer + "," + name);
	yourConnection.setRemoteDescription(new RTCSessionDescription(offer));
	var answer = yourConnection.createAnswer().then(function(answer) {
		yourConnection.setLocalDescription(answer);
		send({
			type: "answer",
			answer: answer,
			username : name
		});
	})
}	

function onAnswer(answer) {
	yourConnection.setRemoteDescription(answer);
}

function onCandidate(a) {
	yourConnection.addIceCandidate(new RTCIceCandidate(a));
	document.getElementById('hang-up').disabled = false;
}

function onLeave() {
	console.log("onLeave()");
	connectedUser = null;
	room = null;
	theirVideo.src = null;
//	yourConnection.onicecandidate = null;
//	yourConnection.ontrack = null;
	yourConnection.close();
	yourConnection = null;
	startConnection();
//	location.reload();
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
        window.mozRTCPeerConnection;
    window.RTCSessionDescription = 
    	window.RTCSessionDescription ||
    	window.webkitRTCSessionDescription ||
    	window.mozRTCSessionDescription;
    window.RTCIceCandidate = 
    	window.RTCIceCandidate ||
    	window.webkitRTCIceCandidate ||
    	window.mozRTCIceCandidate;
    	
    return !!window.RTCPeerConnection;
}

function startConnection() {
	if(hasUserMedia()) {
		navigator.mediaDevices
        .getUserMedia({ audio: true, video: true })
        .then(myStream => {
            console.log("start streaming");
            stream = myStream;
            yourVideo.srcObject = stream;
            if (hasRTCPeerConnection()) {
                setupPeerConnection(stream);
            } else {
                alert("Sorry, your browser does not support WebRTC.1");
            }
        })
	} else {
		alert("Sorry, your browser dose not support WebRTC.2");
	}
}

function setupPeerConnection(stream) {
    yourConnection = new RTCPeerConnection(configuration);
    //設定連線
//    yourConnection.addStream(stream);
    stream.getTracks().forEach(function(track) {
    	yourConnection.addTrack(track, stream)
    });
    
    yourConnection.ontrack = function(event) {
    	 if (theirVideo.srcObject) {
    		 return;
    	 }
    	 console.log("設定theirVideo.srcObject!")
    	 theirVideo.srcObject = event.streams[0];
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
		console.log("username===============" + username);
		send({
			type: "offer",
			offer: offer ,
			callname: connectedUser
		});
	});
}
function startPeerConnection(roomname) {
	//開始建立offer
	room = roomname;
	var offer = yourConnection.createOffer(offerOptions)
	.then(function(offer) {
		console.log("aaaaaaaaa");
		yourConnection.setLocalDescription(offer);
		send({
			type: "offerForRoom",
			offer: offer,
			roomname: roomname,
			name: name
		});
		console.log("bbbbbbbbb");
	});
}
