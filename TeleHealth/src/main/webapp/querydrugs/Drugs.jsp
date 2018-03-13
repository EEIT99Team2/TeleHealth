<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
		width: 80px
	}
	.th2 {
		width: 50px
	}	
	.th3 {
		width: 50px
	}	
	.th4 {
		width: 85px
	}	
	.th5 {
		width: 50px
	}
	.th6 {
		width: 50px
	}		
	img, p {
		cursor : pointer
	}
</style>

</head>
<body>
	<jsp:include page="/fragment/nav2.jsp" />
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
					    	<div class="col-2 control-label">
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
		     							<input type="radio" name="marks" id="marks1" value="Y">有
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="marks" id="marks2" value="N">無
		   						</label>
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-2">藥品顏色:</label>
							<div class="col-10">
								<label class="radio-inline ">
		     							<input type="radio" name="color" id="color1" value="白">白色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color2" value="紅">紅色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color3" value="橘">橘色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color4" value="黃">黃色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color5" value="綠">綠色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color6" value="藍">藍色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color7" value="紫">紫色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color8" value="咖啡">咖啡色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color9" value="褐">褐色
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="color" id="color10" value="黑">黑色
		   						</label>    	    						
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-2">藥品劑型:</label>
							<div class="col-10">
								<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation1" value="錠劑">錠劑
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation2" value="膜衣">膜衣錠
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation3" value="糖衣">糖衣錠
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation4" value="膠囊">膠囊
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation5" value="粉">粉劑
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation6" value="散">散
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation7" value="顆粒">顆粒
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation8" value="口溶">口溶錠
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation9" value="咀嚼">咀嚼錠
		   						</label>
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation10" value="腸溶">腸溶錠
		   						</label>    	
		   						<label class="radio-inline">
		     							<input type="radio" name="formulation" id="formulation11" value="液">液劑
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
	
	<!-- 顯示藥品詳細資 -->
	<div class="modal fade" id="showdrug" role="dialog" >
	  <div class="modal-dialog">
	    <div class="modal-header">
	    	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	        	 <span aria-hidden="true">&times;</span>
	        </button>
	    </div>
	    <div class="modal-content">
			<div class="modal-body" style="padding: 40px 50px;">
				<form id="emptyForm">
                 </form>
			</div>
	    </div>
	  </div>
	</div>
	
	<!-- Footer -->
	<jsp:include page="/fragment/footer.jsp" />
	
	<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script>	
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
			            { "data": "licenseNum",
			            	"orderable": false,
			            	"render": function(data,type,row,meta) {
				            	  return data = '<p>' + data +'</p>';
						}},
			            { "data": "chineseName" },
			            { "data": "englishName" },
			            { "data": "symptom" },
			            { "data": "manuName"},
			            { "data": "licenseNum",
			              "orderable": false,
			              "width": "60px",
			              "render": function(data,type,row,meta) {
			            	  return data =   '<img style="width:100px" src="/TeleHealth/querydrugs/drugsimages/' + data +'.png">';
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
			});

			$('body').on("click", "td>p", function() {
				$("#emptyForm").empty();
				var licenseNumId = $(this).text();
				var decodelicenseNumId=decodeURIComponent(licenseNumId);				
				$.getJSON('/TeleHealth/querydrug.controller', {licenseNum:decodelicenseNumId} , function(data) {
					var container = $('<div class="container col-12"></div>')
					var cell1 = $('<div class="form-group row"><label class="control-label" for="licenseNum1">核准字號：</lable><input id="licenseNum1" type="text" readonly="readonly" value="' + data.licenseNum + '" /></div>');
					var cell2 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="chineseName1">中文名稱：</lable><input id="chineseName1" type="text" readonly="readonly" value="' + data.chineseName + '" /></div>');
					var cell3 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="englishName1">英文名稱：</lable><input id="englishName1" type="text" readonly="readonly" value="' + data.englishName + '" /></div>');
					var cell4 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="issueDate1">申請日期：</lable><input id="issueDate1" type="text" readonly="readonly" value="' + data.issueDate + '" /></div>');
					var cell5 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="effectiveDate1">有效日期：</lable><input id="effectiveDate1" type="text" readonly="readonly" value="' + data.effectiveDate + '" /></div>');
					var cell6 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="clearanceNum1">送審文件：</lable><input id="clearanceNum1" type="text" readonly="readonly" value="' + data.clearanceNum + '" /></div>');
					var cell7 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="symptom1">適應症：</lable><textarea rows="3" readonly="readonly" cols="40">' + data.symptom + '</textarea>');
					var cell8 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="formulation1">劑型：</lable><input id="formulation1" type="text" readonly="readonly" value="' + data.formulation + '" /></div>');
					var cell9 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="packs1">包裝：</lable><input id="packs1" type="text" readonly="readonly" value="' + data.packs + '" /></div>');
					var cell10 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="category1">類型：</lable><input id="category1" type="text" readonly="readonly" value="' + data.category + '" /></div>');
					var cell11 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="regulatoryLevel1">管制級別：</lable><input id="regulatoryLevel1" type="text"  readonly="readonly" value="' + data.regulatoryLevel + '" /></div>');
					var cell12 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="ingredients1">成份概述：</lable><textarea readonly="readonly" rows="3" cols="40">' + data.ingredients + '</textarea>');
					var cell13 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="applicatorName1">申請商：</lable><input id="applicatorName1" type="text"  readonly="readonly" value="' + data.applicatorName + '" /></div>');
					var cell14 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="manuName">製造商：</lable><input id="manuName" type="text"  readonly="readonly" value="' + data.manuName + '" /></div>');
					var cell15 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="country1">國別：</lable><input id="country1" type="text" readonly="readonly" value="' + data.country + '" /></div>');
					var cell16 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="usage1">用法用量：</lable><input id="usage1" type="text"  readonly="readonly" value="' + data.usage + '" /></div>');
					var cell17 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="shape1">形狀：</lable><input id="shape1" type="text"  readonly="readonly" value="' + data.shape + '" /></div>');
					var cell18 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="color1">顏色：</lable><input id="color1" type="text" readonly="readonly" value="' + data.color + '" /></div>');
					var cell19 = $('<div class="form-group has-success has-feedback row"><label class="control-label" for="marks1">有無刻痕：</lable><input id="marks1" type="text"  readonly="readonly" value="' + data.marks + '" /></div>');
					var cell20 = $('<img style="width:200px; height:200px;" src="/TeleHealth/querydrugs/drugsimages/' + data.licenseNum +'.png">');
					$(container).append(cell20);
					$(container).append(cell1);
					$(container).append(cell2);
					$(container).append(cell3);
					$(container).append(cell4);
					$(container).append(cell5);
					$(container).append(cell6);
					$(container).append(cell7);
					$(container).append(cell8);
					$(container).append(cell9);
					$(container).append(cell10);
					$(container).append(cell11);
					$(container).append(cell12);
					$(container).append(cell13);
					$(container).append(cell14);
					$(container).append(cell15);
					$(container).append(cell16);
					$(container).append(cell17);
					$(container).append(cell18);
					$(container).append(cell19);
					
					$("#emptyForm").append(container);
				})
				$("#showdrug").modal("show");
			});
		});
	</script>

</body>

</html>