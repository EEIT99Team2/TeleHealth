<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <div class="container"> -->
				<div style="font-family:CJKtc_Bold;text-align:center;"><h3 class="title allFontStyle">會員管理</h3></div>
					<div class="point1 allFontStyle">	
								<table id='membersTable'
									class="allFontStyle table table-bordered table-striped table-hover ">
									<thead class="table-dark">
										<tr>
											<th scope="col" width=120px>會員帳號</th>
											<th scope="col" width=100px>姓名</th>	
											<th scope="col" width=150px>註冊時間</th>
											<th scope="col" width=80px>性別</th>
											<th scope="col" width=120px>電話</th>
											<th scope="col" width=120px>行動電話</th>
											<th scope="col" width=120px>生日</th>
											<th scope="col" width=250px>地址</th>
											<th scope="col" width=150px>藥物過敏</th>
											<th scope="col" width=150px>過去病史</th>
											<th scope="col" width=80px>狀態</th>
											<th scope="col" width=80px>管理</th>
<!-- 											<th scope="col">照片</th> -->
										</tr>
									</thead>
									<tbody>
									</tbody>
		</table>
	</div>
<!-- </div> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script>
					
<script type="text/javascript">
$(document).ready(function() {
	
	membersTable();
     function membersTable(){
    	 $('#membersTable').DataTable({
			    "ajax": '/TeleHealth/checkMembers.controller',
			    "columns": [
			        { "data": "account"},
			        { "data": "memName"},
			        { "data": "registerTime"},
			        { "data": "gender"},
			        { "data": "phone"},
			        { "data": "cellphone"},
			        { "data": "birth"},
			        { "data": "address"},
			        { "data": "medicine"},
			        { "data": "medicalHistory"},			    
			        { "data": "status"},
			        { "data": "status",
			        	  "orderable": false,
			              "width": "80px",
			              "render": function(data,type,row,meta) {
				              if(data=='停權') {
				            	  return data = "<button class='btn btn-success' onclick=''>復權</button>";
						      } else if(data=='正常') {
						    	  return data = "<button class='btn btn-danger'>停權</button>";
							  } else {
								  return data = "未開通";
							  }				           
					}}	
			     		  
			    ],
			    "autoWidth":false,
			    "order": [[ 1, 'desc' ]],
				"bProcessing": true,//顯示處理中的圖樣
				"oLanguage": {
			    "sLengthMenu": " _MENU_ 筆/頁",
			    "sZeroRecords": "找不到符合的資料。",
			    "sInfo": "共 _MAX_ 筆",
			    "sSearch": "搜尋",
			    "sInfoFiltered": " - 找到 _TOTAL_ 筆 資料",
			    "sInfoEmpty": "共 0 頁",
			    "oPaginate": {
			        "sPrevious": "«",
			        "sNext": "»"
			  	 	 }
					}
				});		
			
			};
		
		   $('#membersTable>tbody').on('click','tr button:nth-child(1)',function(){
 			   var account = $(this).parents('tr').find('td:nth-child(1)').text();
 			   $.get("<c:url value='/checkstatus.controller'/>",{"account": account},function(data){
 				  $('#membersTable').dataTable().fnDestroy(); 
					membersTable();
 			   })
		   })
		  
});

</script>