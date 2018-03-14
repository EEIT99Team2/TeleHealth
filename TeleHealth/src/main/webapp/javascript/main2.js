//檢查瀏覽器是否支援下列的非標準含數
function hasUserMedia() {
    return !!(navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia 
        || navigator.msGetUserMedia);
}

//如果Browser支援這些函數，則進行video標籤的設定
if(hasUserMedia()) {
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia 
        || navigator.mozGetUserMedia || navigator.msGetUserMedia;
	MediaStreamTrack.getSources(function(sources){
		alert("hahaha");
		var audioSource = null;
		var videoSource = null;
		for(var i=0; i< sources.length; i++) {
			var source = sources[i];
			if(source.kind ==="audio") {
				console.log("finded mic:" , source.label, source.id);
				audioSource = source.id;
			} else if(source.kind ==="video") {
				console.log("finded camera:", source.label, source.id);
				videoSource = source.id;
			} else {
				console.log("not finded", source);
			}
		}

		var constraints = {
			audio:{
				optional:[{sourceId:audioSource}]
			},
			video:{
				optional:[{sourceId:videoSource}]
			}
		};

		navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
			var video = document.querySelector('video');
			video.src = window.URL.createObjectURL(stream);
		}, function(error) {
			console.log("Raised an error when capturing:", error);
		});
	}); 



} else {
    alert("您的瀏覽器不支援getUserMedia!");
}