<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>藥品查詢</title>
<style>
	.btn {
		width:100px;
	}
	.form-group {
		font-size: 18px;
	}
	.th1 {
		width: 50px
	}
	.th2 {
		width: 50px
	}	
	.th3 {
		width: 50px
	}	
	.th4 {
		width: 100px
	}	
	.th5 {
		width: 50px
	}
	.th6 {
		width: 50px
	}		
	img {
		cursor : pointer
	}
</style>
<link rel="stylesheet" type="text/css" href="/TeleHealth/css/fontstyle.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.css"/>

</head>
<body>
	<jsp:include page="/fragment/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="w3-container marketing " style="padding: 20px 16px" id="team">
				<h1 class="w3-center">藥品資訊查詢</h1>
					<form class="form-group" id="drugForm" >
						<div class="form-group has-success has-feedback row">
					    	<label class="col-2 control-label" for="chineseName">食藥署核准字號:</label>
					    	<div class="col-10">
					    		<input type="text" class="form-control" id="licenseNum" name="licenseNum">
					        	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					      	</div>
		   				</div>
						<div class="form-group has-success has-feedback row">
					    	<label class="col-2 control-label" for="chineseName">藥品中文名稱:</label>
					    	<div class="col-10">
					    		<input type="text" class="form-control" id="chineseName" name="chineseName">
					        	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					      	</div>
		   				</div>
		   				<div class="form-group has-success has-feedback row">
					    	<label class="col-2 control-label" for="englishName">藥品英文名稱:</label>
					    	<div class="col-10">
					    		<input type="text" class="form-control" id="englishName" name="englishName">
					        	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					      	</div>
		   				</div>
		   				<div class="form-group has-success has-feedback row">
					    	<label class="col-2 control-label" for="manuName">製造商:</label>
					    	<div class="col-10">
					    		<input type="text" class="form-control" id="manuName" name="manuName">
					        	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					      	</div>
		   				</div>
		   				<div class="form-group has-success has-feedback row">
					    	<label class="col-2 control-label" for="symptom">適用症狀:</label>
					    	<div class="col-10">
					    		<input type="text" class="form-control" id="symptom" name="symptom">
					        	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
					      	</div>
		   				</div>
						<div class="form-group row">
							<label class="control-label col-2">藥品刻痕:</label>
							<div class="col-10">
								<label class="radio-inline">
		     							<input type="radio" name="marks" id="marks" value="Y">有
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="marks" id="marks" value="N">無
		   						</label>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-2">藥品顏色:</label>
							<div class="col-10">
								<label class="radio-inline ">
		     							<input type="radio" name="color" id="color" value="白">白色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color" value="紅">紅色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color" value="橘">橘色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color" value="黃">黃色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color" value="綠">綠色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color" value="藍">藍色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color" value="紫">紫色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color" value="咖啡">咖啡色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color" value="褐">褐色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color" value="黑">黑色
		   						</label>    	    						
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-2">藥品劑型:</label>
							<div class="col-10">
								<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="錠劑">錠劑
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="膜衣">膜衣錠
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="糖衣">糖衣錠
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="膠囊">膠囊
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="粉">粉劑
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="散">散
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="顆粒">顆粒
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="口溶">口溶錠
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="咀嚼">咀嚼錠
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="腸溶">腸溶錠
		   						</label>    	
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation" value="液">液劑
		   						</label>    	   						    										
							</div>
						</div>
						<div class="form-group row">
							<div class="col-4"></div>
							<div class="col-8 row">
								<div class="col-3">
									<button type="button" class="btn btn-primary" id="queryBtn">確認查詢</button>
								</div>
								<div class="col-3">
									<button type="reset" class="btn btn-danger">清除</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: 0;">
			<div class="card col-12">
				<div class="card-header">藥品查詢結果</div>
				<div class="card-body">
					<!-- 每頁不同的內容從這裡開始 -->
					<table id="table1" class="table table-bordered table-striped table-hover">
						<thead>
							<tr>
								<th class="th1">核准字號</th>
								<th class="th2">中文名稱</th>
								<th class="th3">英文名稱</th>
								<th class="th4">適用症狀</th>
								<th class="th5">製造商</th>
								<th class="th6">圖片</th>
							</tr>
						</thead>
						<tbody id="tableBody">
						</tbody>
					</table>
					<!-- 每頁不同的內容到這裡結束 -->
				</div>
			</div>
		</div>
	</div>
	<!-- 顯示圖片視窗 -->
	<div class="modal fade" id="showImgItem" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <!-- 圖片內容 -->
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Footer -->
	<jsp:include page="/fragment/footer.jsp" />

	<script>
		$(document).ready(function() {
			$('#queryBtn').click(function() {
				$('#table1').dataTable().fnDestroy(); 
				var licenseNum = $('#licenseNum').val();
				var chineseName = $('#chineseName').val();
				var englishName = $('#englishName').val();
				var manuName = $('#manuName').val();
				var symptom = $('#symptom').val();
				var marks = $('input[name="marks"]:checked' , '#drugForm').val();
				var color = $('input[name="color"]:checked' , '#drugForm').val();
				var formulation = $('input[name="formulation"]:checked' , '#drugForm').val();
		        $('#table1').DataTable({
			        "ajax": "/TeleHealth/querydrugs.controller?licenseNum=" +licenseNum + 
			        		"&chineseName=" + chineseName + "&englishName=" + englishName + 
			        		"&manuName=" + manuName + "&symptom=" + symptom + 
			        		"&marks=" + marks + "&color=" + color + "&formulation=" + formulation,
			        "columns": [
			            { "data": "licenseNum" },
			            { "data": "chineseName" },
			            { "data": "englishName" },
			            { "data": "symptom" },
			            { "data": "manuName"},
			            { "data": "licenseNum",
			              "orderable": false,
			              "width": "60px",
			              "render": function(data,type,row,meta) {
			            	  return data =   '<img style="width:100px" src="/TeleHealth/QueryDrugs/DrugsImages/' + data +'.png">';
					    }}
			        ],
		        
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
				
			});

			$('body').on("click", "td>img", function() {
				$("#showImgItem .modal-body").empty();
				var docFrag = $(document.createDocumentFragment());
				docFrag.append("<img style='width:450px' src='"+$(this).attr("src")+"'/>");
				$("#showImgItem .modal-body").append(docFrag);
				$("#showImgItem").modal("show");
			})

// 			$('#table1>tbody>td:eq(5)').click(function(){
// 				var docFrag = $(document.createDocumentFragment());
// 				docFrag.append("<img style='width:100px' src='"+$(this).attr("src")+"'/>");
// 				$("#showImgItem .modal-body").append(docFrag);
// 				$("#showImgItem").modal("show");
// 			})
		})
	</script>

</body>

</html>