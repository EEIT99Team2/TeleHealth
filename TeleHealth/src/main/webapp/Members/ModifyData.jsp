<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
</style>

<script>
	function aa() {
		var file = document.getElementById('ff').files[0];
		//console.dir(file);
		if (file) {
			var msg = [];
			msg.push('檔名：' + file.name, '大小：' + file.size, '檔案類型：' + file.type);
			document.getElementById('msg').innerHTML = msg.join("<"+"br"+">");

			//讀取檔案
			var fileReader = new FileReader();
			fileReader.onload = function(event) {//讀取完後執行的動作
				//console.dir(event);
				document.getElementById('xx').src = event.target.result;
			};
			fileReader.readAsDataURL(file);//讀取檔案內容,以DataURL格式回傳結果

			//fileReader.readAsText(file, 'UTF-8');
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密碼</title>
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
			id="FOO" data-toggle="tab" role="tab" value="儲值點數"
			onclick="location.href='<c:url value='/pay/pay.jsp'/>'" /></li>
						
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
	<form method="post" enctype="multipart/form-data"
		action="<c:url value="/Members02.controller" />">
<div class="container">
		<div style="text-align:center;"><h3 class="title">修改會員資料</h3></div>
					
		<table id="Table1" border="0" cellspacing="0" cellpadding="4"
						width="500" align="center">
						<tr>
							<td>
								<p>
									<span class="notice" style="color:red;">標有＊為必須填寫資料</span>
								</p>
								<table id="Table7" class="Collapse" border="0"   width="100%" style="border-collapse:separate; border-spacing:0px 10px;" >
									<tr>
										<td class="TableHeading" width="100">＊姓&nbsp;&nbsp;&nbsp;名
										</td>
										<td class="TableData"><input type="text" name="memName" id="memName"
											value="${LoginOK.memName}" style="width: 320px;"required> <font
											color="red" size="-1">${MsgMap.errormemName}</font>
												<span id="checkMemName" display="inline-block"></span>	
									</tr>
							
									<tr>
										<td class="TableHeading" width="100">＊身&nbsp;&nbsp;&nbsp;高
										</td>
										<td class="TableData"><input type="text" name="memHeight" id="memHeight"
											value="${LoginOK.memHeight}" style="width: 120px;"required> <font
											color="red" size="-1">${MsgMap.errorMemHeight}</font>
											<span id="checkMemHeight" display="inline-block"></span>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊體&nbsp;&nbsp;&nbsp;重
										</td>
										<td class="TableData"><input type="text" name="memWeight" id="memWeight"
											value="${LoginOK.memWeight}" style="width: 120px;"required> <font
											color="red" size="-1">${MsgMap.errorMemWeight}</font>
												<span id="checkMemWeight" display="inline-block"></span>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊血&nbsp;&nbsp;&nbsp;型</td>
										<td class="TableData"><select name="bloodType"
											id="bloodType" style="width: 120px; height: 20px;">
												<option value="">請選擇血型</option>
												<option value="A">A型</option>
												<option value="B">B型</option>
												<option value="AB">AB型</option>
												<option value="O">O型</option>
										</select><font color="red" size="-1">${MsgMap.errorBloodType}</font> <input
											type="hidden" id="hiddenBlood" value="${LoginOK.bloodType}">
											<span id="checkBloodType" display="inline-block"></span>
									</tr>
									
									<tr>
										<td class="TableHeading" width="100">＊藥物過敏</td>
										<td class="TableData"><input type="text" name="medicine" id="medicine"
											value="${LoginOK.medicine}" style="width: 320px;"required> <font
											color="red" size="-1">${MsgMap.errorMedicine}</font>
											<span id="checkMedicine" display="inline-block"></span>
									</tr>
									
									<tr>
										<td class="TableHeading" width="100">＊過去病史</td>
										<td class="TableData"><input type="text"
											name="medicalHistory" id="medicalHistory" value="${LoginOK.medicalHistory}"
											style="width: 320px;"required> <font color="red" size="-1">${MsgMap.errorMedicalHistory}</font>
									<span id="checkMedicalHistory" display="inline-block"></span>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊電&nbsp;&nbsp;&nbsp;話</td>
										<td class="TableData"><input type="text" name="phone" id="phone"
											value="${LoginOK.phone}" style="width: 320px;"required> <font
											color="red" size="-1">${MsgMap.errorPhone}</font>
											<span id="checkPhone" display="inline-block"></span>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊行動電話</td>
										<td class="TableData"><input type="text" name="cellphone" id="cellphone"
											value="${LoginOK.cellphone}" style="width: 320px;"required> <font
											color="red" size="-1">${MsgMap.errorCellphone}</font>
											<span id="checkCellphone" display="inline-block"></span>
									</tr>
									 
									<tr>
										<td class="TableHeading" width="100">＊居住地</td>
										<td class="TableData"><input type="text" name="address" id="address"
											value="${LoginOK.address}" style="width: 320px;"required> <font
											color="red" size="-1">${MsgMap.errorAddr}</font>
												<span id="checkAddress" display="inline-block"></span>
									</tr>
									<tr>
										<td class="TableHeading" width="100">&nbsp;&nbsp;&nbsp;&nbsp;照&nbsp;&nbsp;&nbsp;片
										</td>
										<td class="TableData"><input type="file" id="ff"
											onchange="aa()" name="fileout" />

											<div id="msg"></div>
											<div style="width: 300px; height: 200px; border: 0.5px black solid">
												<img id="xx"
													src="<c:url value='/getImage.controller' />"
													style="max-width: 300px; max-height: 900px;" />
											</div>
									</tr>
								</table>
							</table>
							
							<div class="row"><p> </p></div>
								<div style="text-align:center;">
								<input class="btn btn-primary" type="submit"name="submitBtn" id="submitBtn" value="送出">
							</div>
							
						</div>
					</form>	
					
					
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

<script>
$(document).ready(function() {
	var memberId = $('#memberId').val();
		window.onload = function() {
			var index;
			var val = document.getElementById("hiddenBlood").value.trim();
			if(val =='A') {
				index = 1;
			} else if(val =='B') {
				index = 2;
			} else if(val =='AB') {
				index = 3;
			} else if(val =='O') {
				index = 4;
			}
			console.log("index=" + index);	
			document.getElementById("bloodType").options.selectedIndex = index;
		}

		$('#memName').blur(function(){
			var memName = $('#memName').val();
			var checkMemName = $('#checkMemName');
		if(memName !==null && memName.length>0){
			var pattern =/^[\u4e00-\u9fa5]+$/i;
			flag = pattern.test(memName);	
			if(flag){
				checkMemName.html("<img src=images/yes.gif>"); 
				$('#submitBtn').prop("disabled", false);
				}else{
					checkMemName.html("<img src=images/error.png>"+"格式錯誤!");
					$('#submitBtn').prop("disabled", true);
					}	
		}else{
			checkMemName.html("<img src=images/error.png>"+"不得為空白!");
			$('#submitBtn').prop("disabled", true);
			}
			
		});

		$('#memHeight').blur(function(){
			var memHeight = $('#memHeight').val();
			var checkMemHeight = $('#checkMemHeight');
			if(memHeight!= null	&& memHeight.length>0){

				var pattern =/^[0-9]+(\.[0-9]{1,2})?$/;
				flag = pattern.test(memHeight);
				if(flag && memHeight>0 && memHeight<400){
				checkMemHeight.html("<img src=images/yes.gif>"); 
						}else{
							checkMemHeight.html("<img src=images/error.png>"+"身高格式錯誤!");
							}		
			}else{
				checkMemHeight.html("<img src=images/error.png>"+"不得為空白!");
				}
		})

		$('#memWeight').blur(function(){
			var memWeight = $('#memWeight').val();
			var checkMemWeight = $('#checkMemWeight');
			if(memWeight!= null	&& memWeight.length>0){

				var pattern =/^[0-9]+(\.[0-9]{1,2})?$/;
				flag = pattern.test(memWeight);
				if(flag  && memWeight<250 && memWeight>0){
					checkMemWeight.html("<img src=images/yes.gif>"); 
						}else{
							checkMemWeight.html("<img src=images/error.png>"+"體重格式錯誤!");
							}		
			}else{
				checkMemWeight.html("<img src=images/error.png>"+"不得為空白!");
				}
		})
		
		$('#bloodType').blur(function(){
		var bloodType = $('#bloodType').val();
		var checkBloodType = $('#checkBloodType');
		if(bloodType!==""){
		checkBloodType.html("<img src=images/yes.gif>"); 
		}else{
			checkBloodType.html("<img src=images/error.png>"+"不得為空白!");
			}
		})
	
	$('#medicine').blur(function(){
		var medicine = $('#medicine').val();
		var checkMedicine = $('#checkMedicine');
		if(medicine !=null && medicine.length>0){
			checkMedicine.html("<img src=images/yes.gif>"); 
			}else{
				checkMedicine.html("<img src=images/error.png>"+"不得為空白!");
				}
	})
	
	$('#medicalHistory').blur(function(){
		var medicalHistory = $('#medicalHistory').val();
		var checkMedicalHistory = $('#checkMedicalHistory');
		if(medicalHistory!=null &&medicalHistory.length>0){
			checkMedicalHistory.html("<img src=images/yes.gif>"); 
			}else{
				checkMedicalHistory.html("<img src=images/error.png>"+"不得為空白!");
				}
	})
	
$('#phone').blur(function(){
	var phone = $('#phone').val();
	var checkPhone = $('#checkPhone');
	if(phone!= null	&& phone.length>0){
		var pattern =/[0-9]{2,3}-[0-9]{5,}/;
		flag = pattern.test(phone);	
		if(flag){
		checkPhone.html("<img src=images/yes.gif>"); 	
		$('#submitBtn').prop("disabled", false);	
			}else{
			checkPhone.html("<img src=images/error.png>"+"電話格式錯誤!");
			$('#submitBtn').prop("disabled", true);
				}

		}else{
			checkPhone.html("<img src=images/error.png>"+"不得為空白!");
			$('#submitBtn').prop("disabled", true);
			}
})

$('#cellphone').blur(function(){
	var cellphone = $('#cellphone').val();
	var checkCellphone = $('#checkCellphone');
	if(cellphone!= null	&& cellphone.length>0){
		var pattern = /[0-9]{10,}/;
		flag = pattern.test(cellphone);	
		if(flag){
			checkCellphone.html("<img src=images/yes.gif>"); 	
		$('#submitBtn').prop("disabled", false);	
			}else{
				checkCellphone.html("<img src=images/error.png>"+"電話格式錯誤!");
			$('#submitBtn').prop("disabled", true);
				}

		}else{			
			checkCellphone.html("<img src=images/error.png>"+"不得為空白!");
			$('#submitBtn').prop("disabled", true);
			}
})

$('#address').blur(function(){
	var address = $('#address').val();
	var checkAddress = $('#checkAddress');
	if(address!= null	&& address.length>0){
		checkAddress.html("<img src=images/yes.gif>"); 
	}else{
		checkAddress.html("<img src=images/error.png>"+"不得為空白!");
		$('#submitBtn').prop("disabled", true);
		}
})

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