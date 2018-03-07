//var connection = new WebSocket("ws://tzeing.asuscomm.com:8888"),
//	name = "";

//var connection = new WebSocket('wss://tzeing.asuscomm.com:15449', {
//	 protocolVersion: 8,
//	 origin: 'https://tzeing.asuscomm.com:15449',
//	 rejectUnauthorized: false 
//	});
var connection = new WebSocket('wss://tzeing.asuscomm.com:15449');
var name = "";

var loginPage = document.querySelector("#login-page"),
	usernameInput = document.querySelector("#username"),
	loginButton = document.querySelector("#login"),
	callPage = document.querySelector("#call-page"),
	theirUsernameInput = document.querySelector("#their-username"),
	callButton = document.getElementById("callHere"),
	hangUpButton = document.querySelector("#hang-up");

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
            onLogin(data.success);
            break;

        case "offer":
        	alert("case offer");
            onOffer(data.offer, data.name);
            break;

        case "answer":
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

function onLogin(success) {
    if (success === false) {
        alert("Login unsuccessful, please try a different name.");
    } else {
        loginPage.style.display = "none";
        callPage.style.display = "block";

        startConnection();
    }
}

callButton.addEventListener("click", function() {
	var theirUsername = theirUsernameInput.value;
	console.log(theirUsername);
	
	if(theirUsername.length > 0) {
		startPeerConnection(theirUsername);
	} else {
		alert("No such user");
	}
});

hangUpButton.addEventListener("click", function() {
	send({
		type: "leave"
	});
	onLeave();
	location.reload();
});

function onOffer(offer, name) {
	connectedUser = name;
    console.log("handleOffer" + "," + offer + "," + name);
	yourConnection.setRemoteDescription(new RTCSessionDescription(offer));
	
	var answer = yourConnection.createAnswer()
	.then(function(answer) {
		yourConnection.setLocalDescription(answer);
		send({
			type: "answer",
			answer: answer
		});
	})
}	

function onAnswer(answer) {
	yourConnection.setRemoteDescription(answer);
}

function onCandidate(a) {
	yourConnection.addIceCandidate(new RTCIceCandidate(a));
}

function onLeave() {
	connectedUser = null;
	theirVideo.src = null;
	yourConnection.close();
	yourConnection.onicecandidate = null;
	yourConnection.ontrack = null;
	setupPeerConnection(stream);
	location.reload();
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

var yourVideo = document.querySelector("#yours"),
	theirVideo = document.querySelector("#theirs"),
	yourConnection = new RTCPeerConnection(configuration),
	connectedUser, stream;

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
//        .then(error => {
//            alert("Sorry, we failed to capture your camera, please try again.");
//        });
		
	} else {
		alert("Sorry, your browser dose not support WebRTC.2");
	}
}

function setupPeerConnection(stream) {
    yourConnection = new RTCPeerConnection(configuration);
    //設定連線
    yourConnection.addStream(stream);
    yourConnection.ontrack = function(event) {
    	 if (theirVideo.srcObject) return;
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


function startPeerConnection(user) {
	connectedUser = user;
	
	//開始建立offer
	var offer = yourConnection.createOffer(offerOptions)
	.then(function(offer) {
		yourConnection.setLocalDescription(offer);
		send({
			type: "offer",
			offer: offer 
		});
	});
}

