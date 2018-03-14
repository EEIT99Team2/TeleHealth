<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../forCkeditor/ckeditor/ckeditor.js"></script>
<script src="../forCkeditor/ckfinder/ckfinder.js"></script>
<link rel="stylesheet" href="../forCkeditor/ckeditor/contents.css">
<link rel="stylesheet" type="text/css"
	href="/TeleHealth/css/fonts/fontstyle.css" />
<style type="text/css">
.createtext {
	margin: 0px auto;
}
</style>
</head>
<jsp:include page="/fragment/navemp.jsp" />
<body>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							CKEDITOR
									.replace(
											'content',
											{
												filebrowserBrowseUrl : '../forCkeditor/ckfinder/ckfinder.html',
												filebrowserImageBrowseUrl : '../forCkeditor/ckfinder/ckfinder.html?type=Images',
												filebrowserFlashBrowseUrl : '../forCkeditor/ckfinder/ckfinder.html?type=Flash',
												filebrowserUploadUrl : '../forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files',
												filebrowserImageUploadUrl : '../forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images',
												filebrowserFlashUploadUrl : '../forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash'
											});
							console.log("ready!");
						});
	</script>
	<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<form enctype="multipart/form-data">
				<input type="hidden" id="name" value="${empLoginOK.empId}">
				<h6>標題:<input type="text" id="title" placeholder="title"></h6>
				<font id="erroeMsgtitle" color="red" size="-1"></font>
				<h6>影片上傳:<input type="file" name="file1" id="video" accept="video/*" /></h6>				
				<div id="batchImportModal" class="modal fade" role="dialog"
					aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<div class="progress progress-striped active"
									style="display: none">
									<div id="progressBar" class="progress-bar progress-bar-info"
										role="progressbar" aria-valuemin="0" aria-valuenow="0"
										aria-valuemax="100" style="width: 0%"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h6>
					文章類型:<select name="type">
						<option id="BOB" value="BOD">塑身減重</option>
						<option id="FOO" value="FOO">飲食資訊</option>
						<option id="OLD" value="OLD">銀髮照護</option>
						<option id="CHR" value="CHR">慢性疾病</option>
						<option id="EYE" value="EYE">眼睛保健</option>
						<option id="VID" value="VID">影音專區</option>
					</select>
				</h6><font id="erroeMsg" color="red" size="-1"></font>				
				<textarea name="content" id="content" rows="10" cols="80"></textarea><font id="erroeMsgcontent" color="red" size="-1"></font>
				<div class="form-group">
					<input id="batchUploadBtn" type="button" name="submit"
						class="btn btn-success" value="上傳" /><input type="reset"
						id="clean" class="btn btn-danger" value="清除">
					<p style="color: green">${msgOK.uploadok}${errors.uploaderror}</p>
				</div>
			</form>
		</div>
		<div class="col-2"></div>
	</div>
</div>
	<script>
		$('#clean').on('click', function() {
			CKEDITOR.instances.contenttext.setData(' ');
		})
		$(function() {
			$("#batchImportBtn").click(function() {
				$('#batchImportModal').modal('show');
			});
			$("#batchUploadBtn").attr('disabled', false);
			// 上傳按鈕點擊的时候
			$("#batchUploadBtn").click(function() {
				// 進度條0
				$("#progressBar").width("0%");
				// 上傳按鈕禁用
				$(this).prop('disabled', true);
				// 進度條顯示
				$("#progressBar").parent().show();
				$("#progressBar").parent().addClass("active");
				// 上傳文件
				UpladFile();
			})

			// 文件修改时
			$("#video").change(function() {
				$("#batchUploadBtn").val("上傳");
				$("#progressBar").width("0%");
				var file = $(this).prop('files');				
			});

			function UpladFile() {
				var fileObj = $("#video").get(0).files[0]; // js 获取文件对象
				var filename = $("#video").val();
				console.info("文件：" + filename);
				var title = $("#title").val();
				console.log(title)
				var name = $("#name").val();
				var type = $(":selected").val();
				var content = CKEDITOR.instances.content.getData();
				if(title==""||title.length==0){
					$('#erroeMsgtitle').text('標題不能為空')
					$("#batchUploadBtn").attr('disabled', false);
				}else if(content==null||content.length==0){
					$('#erroeMsgtitle').text('')
					$('#erroeMsgcontent').text('文章不能為空')
					$("#batchUploadBtn").attr('disabled', false);
				}				
				else if(filename!=" " && type!="VID"){					
					$('#erroeMsg').text("請選影音專區喔!!");
					$("#batchUploadBtn").attr('disabled', false);
				}else{			
				
				console.log(title + " " + name + " " + type + " " + content);
				var FileController = "/TeleHealth/healthcolumn/inshealthcolumn.controller"; // 接收上传文件的后台地址 
				// FormData 对象
				var form = new FormData();
				// form.append("author", "hooyes"); // 可以增加表单数据
				form.append("file1", fileObj);
				form.append("title", title);
				form.append("name", name);
				form.append("type", type);
				form.append("content", content); // 文件对象
				// XMLHttpRequest 对象
				var xhr = new XMLHttpRequest();
				xhr.open("post", FileController, true);
				xhr.onload = function() {
					alert("上傳完成");
					$("#batchUploadBtn").attr('disabled', false);
					$("#batchUploadBtn").val("上傳");
					$("#progressBar").parent().removeClass("active");
					$("#progressBar").parent().hide();
					//$('#myModal').modal('hide');
					$('#erroeMsgtitle').text('');
					$('#erroeMsgtcontent').text('');
					$('#erroeMsg').text("");
				};
				xhr.upload.addEventListener("progress", progressFunction, false);
				xhr.send(form);
				}
			}
			;
			function progressFunction(evt) {
				var progressBar = $("#progressBar");
				if (evt.lengthComputable) {
					var completePercent = Math.round(evt.loaded / evt.total
							* 100)
							+ "%";
					progressBar.width(completePercent);
					$("#batchUploadBtn").val("正在上傳 " + completePercent);
				}
			}
			;
		})
	</script>
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>