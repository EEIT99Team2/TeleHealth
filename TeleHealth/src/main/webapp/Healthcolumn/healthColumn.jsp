<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jumbotron.css">
</head>
<body>

<script src="../js/jquery-3.3.1.min.js"></script>
<div class="row">		
		<div class="col-lg-9">
			<div class="card">
				<div class="card-header">jQuery Plugin - DataTable</div>
				<div class="card-body">
					<!-- 每頁不同的內容從這裡開始 -->
					<table id="table1"	class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
							 	<th>columnId</th>
								<th>title</th>
								<th>content</th>
								<th>createDate</th>
								<th>advisoryCode</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<!-- 每頁不同的內容到這裡結束 -->
				</div>
			</div>		
		</div>
	</div>
<div id="title">
<input type="button" id="BOD" class='health' value="塑身減重">
<input type="button" id="FOO" class='health' value="飲食資訊">
<input type="button" id="CHR" class='health' value="慢性病">
<input type="button" id="EYE" class='health' value="眼睛保健">
<input type="button" id="OLD" class='health' value="銀髮照護">
<input type="button" id="VID" class='health' value="影音專區">
</div>

<script type="text/javascript">
$('.health').click(function() {
	var value=$(this).prop("id");
	$.getJSON('/TeleHealth/Healthcolumn/healthcolumn.controller', {advisoryCode:value}, function (data) {
		console.log(data);		
		$('#table1>tbody').empty();		  
        $.each(data, function (i, data) { 
        	var cell1 = $("<td></td>").text(data.columnId);           
            var cell2 = $("<td></td>").text(data.title);
            var cell3 = $("<td></td>").text(data.content);
            var cell4 = $("<td></td>").text(data.createDate);
            var cell5 = $("<td></td>").text(data.videoContent);
            
            var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4,cell5]);

            $('#table1>tbody').append(row);
        });

    
    })

})

	
</script>






</body>
</html>