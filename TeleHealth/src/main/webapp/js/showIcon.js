var empId =$.trim($("#empId").val());
var memberId =$.trim($("#memberId").val());
if(empId!=null && empId!=undefined && empId!=""){	

	var empCount = 0;
	$.getJSON("/TeleHealth/Advisory/empreserve.controller",{"empId":empId},function(datas){
		$.each(datas,function(index,data){
			var status=data.status;
			if(status=="N"){			
				empCount++;
			}
		});
		$('#advisoryNum').text(empCount);
		if(empCount == 0) {
			$('#advisoryNum').css("display", "none");
		}
	});
}else if(memberId!=null && memberId!=undefined && memberId!=""){
	var memCount = 0;
	$.getJSON("/TeleHealth/Advisory/memberReserve.controller",{"memberId":memberId},function(datas){
		$.each(datas,function(index,data){
			var status=data.status;
			if(status=="N"){			
				memCount++;
			}
		});
		$('#advisoryNum').text(memCount);
		if(memCount == 0) {
			$('#advisoryNum').css("display", "none");
		}
	});
}
