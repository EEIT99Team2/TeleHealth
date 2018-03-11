//檢查瀏覽器是否支援下列的非標準含數
function hasUserMedia() {
    return !!(navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia 
        || navigator.msGetUserMedia);
}

//如果Browser支援這些函數，則進行video標籤的設定
if(hasUserMedia()) {
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia 
        || navigator.mozGetUserMedia || navigator.msGetUserMedia;
    
    navigator.mediaDevices.enumerateDevices().then(function(devices) {
        devices = devices.filter(function(devices) { return devices.kind === 'videoinput'; });
        alert(devices);
        var videoinput_id = '';
        devices.forEach(function(device) {
            if(device.label.toLowerCase().search("back") >-1){
                 videoinput_id = device.deviceId;
            }
        });
        if(videoinput_id != ''){
            navigator.mediaDevices.getUserMedia({ video: { deviceId: {'exact':videoinput_id}, facingMode: 'environment' }}).then(successCallback);
        }else{
            navigator.mediaDevices.getUserMedia({ video: { facingMode: 'environment' }}).then(successCallback);
        }

    });
    
} else {
    alert("您的瀏覽器不支援getUserMedia!");
}