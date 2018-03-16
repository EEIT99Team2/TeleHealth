<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.point1 { 
color:red; 
background-color:#AAFFEE;
/* width:600px; */
/* height:600px; */
border:3px #cccccc dashed;
margin:0px auto;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/fragment/nav2.jsp" />

				<div style="text-align:center;"><h3 class="title">會員管理</h3></div>
<div class="point1">	
									<table id='membersTable' width="100%"
									class="table table-bordered table-striped table-hover ">
									<thead class="table-dark">
										<tr>
											<th scope="col">會員帳號</th>
											<th scope="col">姓名</th>	
											<th scope="col">註冊時間</th>
											<th scope="col">性別</th>
											<th scope="col">電話</th>
											<th scope="col">行動電話</th>
											<th scope="col">生日</th>
											<th scope="col">地址</th>
											<th scope="col">藥物過敏</th>
											<th scope="col">過去病史</th>
<!-- 											<th scope="col">照片</th> -->
										</tr>
									</thead>
									<tbody>
									</tbody>
		</table>
	</div>
	
<!-- 	<!-- 查詢餘額視窗 --> -->
<!-- <div class="modal fade" id="myPointItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> -->
<!--   <div class="modal-dialog modal-dialog-centered" role="document"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <h5 class="modal-title" id="myPointTitle">餘額查詢</h5> -->
<!--         <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--           <span aria-hidden="true">&times;</span> -->
<!--         </button> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         跳出視窗的內容 -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<!--         <button type="button" class="btn btn-primary" data-dismiss="modal" id="myPoint">我知道了</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<jsp:include page="/fragment/footer.jsp" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script>
					
<script type="text/javascript">
$(document).ready(function() {
	var memberid = $("#memberId").val();
	membersTable();
     function membersTable(){
    	 $('#membersTable').dataTable().fnDestroy(); 
    	 $('#membersTable').DataTable({
			    "ajax": '/TeleHealth/checkMembers.controller?memberid='+memberid,
			    "columns": [
			        { "data": "account" },
			        { "data": "memName" },
			        { "data": "registerTime" },
			        { "data": "gender" },
			        { "data": "phone" },
			        { "data": "cellphone" },
			        { "data": "birth" },
			        { "data": "address" },
			        { "data": "medicine" },
			        { "data": "medicalHistory" },
// 			        { "data": "photo" },			      
			    ],
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
				    
})  



</script>
</body>
</html>