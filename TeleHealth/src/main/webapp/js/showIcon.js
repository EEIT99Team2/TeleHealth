var empId =$("#empId").val();
	var count = 0;
	$.getJSON("/TeleHealth/Advisory/empreserve.controller",{"empId":empId},function(datas){
		console.log(datas);
		$.each(datas,function(index,data){
			var status=data.status;
			if(status=="N"){			
				count++;
			}
		});
		console.log("count="+count);
		$('#advisoryNum').text(count);
		if(count == 0) {
			$('#advisoryNum').css("display", "none");
		}
});