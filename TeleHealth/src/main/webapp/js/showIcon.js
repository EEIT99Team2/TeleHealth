var empId =$.trim($("#empId").val());
var memberId =$.trim($("#memberId").val());
if(empId!=null && empId!=undefined && empId!=""){	

	var empCount = 0;
	$.getJSON("/TeleHealth/Advisory/empreserve.controller",{"empId":empId},function(datas){
		console.log(datas);
		$.each(datas,function(index,data){
			var status=data.status;
			if(status=="N"){			
				empCount++;
			}
		});
		console.log("count="+empCount);
		$('#advisoryNum').text(empCount);
		if(empCount == 0) {
			$('#advisoryNum').css("display", "none");
		}
	});
}else if(memberId!=null && memberId!=undefined && memberId!=""){
	var memCount = 0;
	$.getJSON("/TeleHealth/Advisory/memberReserve.controller",{"memberId":memberId},function(datas){
		console.log(datas);
		$.each(datas,function(index,data){
			var status=data.status;
			if(status=="N"){			
				memCount++;
			}
		});
		console.log("count="+memCount);
		$('#advisoryNum').text(memCount);
		if(memCount == 0) {
			$('#advisoryNum').css("display", "none");
		}
	});
}
