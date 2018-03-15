function getAdvisory(empId) {
	var count = 0;
	$.getJSON("<c:url value='/Advisory/empreserve.controller'/>",{"empId":empId},function(datas){
		console.log(datas);
		$.each(datas,function(index,data){
			var status=data.status;
			if(status=="N"){			
				count++;
			}
		});
		$('#advisoryNum').text(count);
		if(count == 0) {
			$('#advisoryNum').css("display", "none");
		}
	});
}	