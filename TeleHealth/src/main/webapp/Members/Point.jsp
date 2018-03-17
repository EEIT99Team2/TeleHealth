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
width:600px;
height:600px;
border:3px #cccccc dashed;
margin:0px auto;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/fragment/nav2.jsp" />
<main>
	<ul
		class="nav nav-tabs justify-content-center w3-padding-large w3-card "
		id="myTab" role="tablist">

		<li class="nav-item"><input type="button" class="nav-link active"
			id="BOD" data-toggle="tab" role="tab" value="修改資料"
			onclick="location.href='ModifyData.jsp'" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="修改密碼"
			onclick="location.href='ChangePwd.jsp'" /></li>			
			<li class="nav-item"><input type="button" class="nav-link active"
			id="checkPoint" data-toggle="tab" role="tab" value="點數查詢" /></li>		
		<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="儲值紀錄"
			onclick="location.href='Point.jsp'" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="我的留言"
			onclick="location.href='questionMempublish.jsp'" /></li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel"
			aria-labelledby="home-tab">
			<!-- Main Content -->
			<div class="container">
				<div class="row">
					<table class="col-lg-4 col-md-10 mx-auto" id="title">
						<tbody id="tbody">
							<tr class="post-preview">
							</tr>
							<hr>
						</tbody>
					</table>
				</div>
				<div class="container">
					<div class="row">
						<span id='table_page' class='col-lg-2 col-md-10 mx-auto'></span>
					</div>
				</div>
			</div>
		</div>
	</div>

	</main>	
				<div style="text-align:center;"><h3 class="title">儲值紀錄</h3></div>
<div class="point1">	
									<table id='pointTable' width="100%"
									class="table table-bordered table-striped table-hover ">
									<thead class="table-dark">
										<tr>
											<th scope="col">儲值金額</th>
											<th scope="col">儲值時間</th>											
										</tr>
									</thead>
									<tbody>
									</tbody>
		</table>
	</div>
	
	<!-- 查詢餘額視窗 -->
<div class="modal fade" id="myPointItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myPointTitle">餘額查詢</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 跳出視窗的內容 -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="myPoint">我知道了</button>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/fragment/footer.jsp" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script>
					
<script type="text/javascript">
$(document).ready(function() {
	var memberid = $("#memberId").val();
	pointTable();
     function pointTable(){
    	 $('#pointTable').dataTable().fnDestroy(); 
    	 $('#pointTable').DataTable({
			    "ajax": '/TeleHealth/point.controller?memberid='+memberid,
			    "columns": [
			        { "data": "TotalAmount" },
			        { "data": "MerchantTradeDate" },
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
				    
			$('#checkPoint').click(function(){
				$.get("<c:url value='/checkPoint.controller'/>",{"memberId":memberId},function(result){
					console.log("point="+result);
					$("#myPointItem .modal-body").empty();
					var docFrag = $(document.createDocumentFragment());
					docFrag.append("<H3>您的餘額為:"+result+"點</H3>");
					$("#myPointItem .modal-body").append(docFrag);
					})
					$("#myPointItem").modal("show");
				
			});
})  



</script>
</body>
</html>