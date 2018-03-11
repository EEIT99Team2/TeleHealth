<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>WebRTC Offer</title>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js" type="application/javascript"></script>
    <script src="<c:url value="/socket.io/socket.io.js"/>" type="application/javascript"></script>
</head>

<body>
    <h1> Self View </h1>
    <video id="selfView" width="320" height="240" autoplay></video>
    <br/>
    <input type="text" id="idCode"/>
    <button id="call">Call</button>
    <h1> Remote View </h1>
    <video id="remoteView" width="320" height="240" autoplay></video>
    <script type="application/javascript">
        var socket = io.connect('http://192.168.21.76:9090');
        var configuration = {
            iceServers: [
                {urls: "stun:23.21.150.121"}, 
                {urls: "stun:stun.l.google.com:19302"},
                {urls: "turn:numb.viagenie.ca", credential: "turnserver", username: "sj0016092@gmail.com"}]
        };
        var pc;

        // run start(true) to initiate a call
        function start(isCaller) {
            pc = new RTCPeerConnection(configuration);

            // send any ice candidates to the other peer
            pc.onicecandidate = function(evt) {
                socket.emit('candidate', {
                    "candidate": evt.candidate
                });
            };

            // once remote stream arrives, show it in the remote video element
            pc.ontrack = function(evt) {
                console.log("add remote stream");
                console.log(evt);
                remoteView.src = URL.createObjectURL(evt.streams[0]);
            };

            if (navigator.getUserMedia) {
                // get the local stream, show it in the local video element and send it
                let contraints = {
                    audio: true,
                    video: true
                }

                navigator.mediaDevices.getUserMedia(contraints).then((stream) => {
                    console.log("start streaming");
                    console.log(stream);

                    stream.getTracks().forEach(function (track) {
                        track.stop();
                    })

                    selfView.src = URL.createObjectURL(stream);
                    pc.addStream(stream);

                    if (isCaller)
                        pc.createOffer().then((desc) => gotDescription(desc));
                    else
                        pc.createAnswer().then((desc) => gotDescription(desc));

                    function gotDescription(desc) {
                        pc.setLocalDescription(desc);
                        socket.emit('sdp', {
                            "sdp": desc
                        });
                    }

                });
            } else {
                alert('Your browser does not support getUserMedia API');
            }
        }

        call.addEventListener('click', () => {
            console.log('webrtc start');
            var code1 = document.getElementById("idCode").value;
            start(true);
        });

        socket.on('msg', function(data) {
            console.log(data);
            if (!pc)
                start(false);

            if (data.sdp)
                pc.setRemoteDescription(new RTCSessionDescription(data.sdp));
            else if (data.candidate)
                pc.addIceCandidate(new RTCIceCandidate(data.candidate));
        });
    </script>
</body>

</html>