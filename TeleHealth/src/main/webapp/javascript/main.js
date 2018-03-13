//檢查瀏覽器是否支援下列的非標準含數
function hasUserMedia() {
    return !!(navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia 
        || navigator.msGetUserMedia);
}

//如果Browser支援這些函數，則進行video標籤的設定
if(hasUserMedia()) {
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia 
        || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    navigator.getUserMedia({
        // video:true,
        // audio:false
	    video: true, 
//	    { 
//	        	mandatory: {
//	        		minAspectRatio:1.777,
//	        		maxAspectRatio:1.778
//	        	},
//	        	optional: {
//	        		maxWidth:640,
//	        		maxHeight:480
//	            },
	        audio:false
	    },
	    function(stream) {
	        var video = document.querySelector('video');
	        video.src = window.URL.createObjectURL(stream);
	    },
	    function(error) {
	        console.log("Raised an error when capturing:", error);
	    }
	);
	

	MediaStreamTrack.getSources(function(sources){
		var audioSource = null;
		var videoSource = null;
		for(var i=0; i< sources.length; i++) {
			var source = sources[i];
			alert(source);
		}
	}) 



} else {
    alert("您的瀏覽器不支援getUserMedia!");
}