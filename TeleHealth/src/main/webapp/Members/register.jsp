<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
	<!-- Meta tags -->
	<title>Appoint My Doctor Form a Simple Appointment form Responsive Widget :: w3layouts</title>
	<meta name="keywords" content="Appoint My Doctor Form Responsive widget, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- stylesheets -->
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/style.css">
	<!-- google fonts  -->
	<link href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Josefin+Sans:300,400,400i,700" rel="stylesheet">
</head>
<body>

	<div class="w3ls-banner">
	<div class="heading">
<!-- 		<h1>Register Account</h1> -->
	</div>
		<div class="container">
			<div class="heading">
				<h2>歡迎成為牽伴的一份子</h2>
			</div>
			<div class="agile-form">
				<form method="post" enctype="multipart/form-data"
						action="<c:url value="/register.controller" />">
					<ul class="field-list">
					
						<li>
							<label class="form-label"> 
								帳號(同E-Mail) 
								<span class="form-required"> * </span>
							</label>
							<div class="form-input11">
								<input type="text" name="account" id="account" value="${param.account}"  placeholder="myname@example.com" required>
							</div>
							<span id="checkAccountResult" display="inline-block"></span>
						</li>
								
						<li>
							<label class="form-label"> 
								密碼(8~16位英數字)
								<span class="form-required"> * </span>
							</label>
							<div class="form-input11">
								<input type="password" name="pwd" id="pwd" value="${param.pwd}" placeholder="Enter Password" required >
<%-- 								<font color="red" size="-1">${MsgMap.errorPwd}</font> --%>
							</div>	
							<span id="checkPwdResult" display="inline-block"></span>		
					   </li>
					   
					   <li>
							<label class="form-label"> 
								密碼確認
								<span class="form-required"> * </span>
							</label>
							<div class="form-input11">
								<input type="password" name="pwdCheck" id="pwdCheck" value="${param.pwdCheck}" placeholder="Enter Password" required >
								<font color="red" size="-1">${MsgMap.errorPwdCheck}</font>
							</div>	
							<span id="checkPwdCheckResult" display="inline-block"></span>			
					   </li>
					   						
						
						<li>
							<label class="form-label"> 
								姓名 
								<span class="form-required"> * </span>
							</label>
							<div class="form-input11">
								<input type="text" name="memName" id="memName" value="${param.memName}" placeholder="Enter Name" required >
								<font color="red" size="-1">${MsgMap.errormemName}</font>
							</div>
							<span id="checkMemName" display="inline-block"></span>	
						</li> 
						
						<li>
							<label class="form-label">
							   性別
							   <span class="form-required"> * </span>
							</label>
							<div class="form-input11">
								<select class="form-dropdown" name="gender" id="gender" required>
									<option value="" selected="true">請選擇性別</option>
									<option value="M"> 男性 </option>
									<option value="F"> 女性 </option>
								</select>
							<font color="red" size="-1">${MsgMap.errorGender}</font>						
							</div>
							<span id="checkGender" display="inline-block"></span>
						<li>
						
						<li> 
							<label class="form-label">
							  電話
							   <span class="form-required"> * </span>
							</label>
							<div class="form-input11">
								<input type="text" name="phone" id="phone" value="${param.phone}" placeholder="02-12345678" required  > 
								<font color="red" size="-1">${MsgMap.errorPhone}</font>
							</div>
							<span id="checkPhone" display="inline-block"></span>
						</li>
						
						<li> 
							<label class="form-label">
							  行動電話
							   <span class="form-required"> * </span>
							</label>
							<div class="form-input11">
								<input type="text" name="cellphone" id="cellphone" value="${param.cellphone}" placeholder="0912345678" required >
								<font color="red" size="-1">${MsgMap.errorCellphone}</font> 
							</div>
							<span id="checkCellphone" display="inline-block"></span>
						</li>
						
						<li>
							<label class="form-label">
							   生日
							   <span class="form-required"> * </span>
							</label>
							<div class="form-input dob">
								<span class="form-sub-label">
									<select name="day" class="day">
										<option>請選擇</option>
										<option value="1"> 1 </option>
										<option value="2"> 2 </option>
										<option value="3"> 3 </option>
										<option value="4"> 4 </option>
										<option value="5"> 5 </option>
										<option value="6"> 6 </option>
										<option value="7"> 7 </option>
										<option value="8"> 8 </option>
										<option value="9"> 9 </option>
										<option value="10"> 10 </option>
										<option value="11"> 11 </option>
										<option value="12"> 12 </option>
										<option value="13"> 13 </option>
										<option value="14"> 14 </option>
										<option value="15"> 15 </option>
										<option value="16"> 16 </option>
										<option value="17"> 17 </option>
										<option value="18"> 18 </option>
										<option value="19"> 19 </option>
										<option value="20"> 20 </option>
										<option value="21"> 21 </option>
										<option value="22"> 22 </option>
										<option value="23"> 23 </option>
										<option value="24"> 24 </option>
										<option value="25"> 25 </option>
										<option value="26"> 26 </option>
										<option value="27"> 27 </option>
										<option value="28"> 28 </option>
										<option value="29"> 29 </option>
										<option value="30"> 30 </option>
										<option value="31"> 31 </option>
									</select>
									<label class="form-sub-label1"> Day </label>
								</span>
								<span class="form-sub-label">
									<select name="month">
										<option>請選擇</option>
										<option value="1"> January </option>
										<option value="2"> February </option>
										<option value="3"> March </option>
										<option value="4"> April </option>
										<option value="5"> May </option>
										<option value="6"> June </option>
										<option value="7"> July </option>
										<option value="8"> August </option>
										<option value="9"> September </option>
										<option value="10"> October </option>
										<option value="11"> November </option>
										<option value="12"> December </option>
									 </select>
									<label class="form-sub-label1"> Month </label>
								</span>
								<span class="form-sub-label">
									<input type="text" class="year" name="year" id="year" placeholder="yyyy" required>
									<label class="form-sub-label1"> Year </label>
								</span>
							</div>
							<span id="checkYear" display="inline-block"></span>
						</li>
						
						<li> 
							<label class="form-label">
							  身高
							   <span class="form-required"> * </span>
							</label>
							<div class="form-input11">
								<input type="text" name="memHeight" id="memHeight" value="${param.memHeight}"  required >
								<font color="red" size="-1">${MsgMap.errorMemHeight}</font> 
							</div>
							<span id="checkMemHeight" display="inline-block"></span>
						</li>
						
						<li> 
							<label class="form-label">
							  體重
							   <span class="form-required"> * </span>
							</label>
							<div class="form-input11">
								<input type="text" name="memWeight" id="memWeight" value="${param.memWeight}"  required >
								<font color="red" size="-1">${MsgMap.errorMemWeight}</font> 
							</div>
							<span id="checkMemWeight" display="inline-block"></span>
						</li>
						
						<li>
							<label class="form-label">
							   血型
							   <span class="form-required"> * </span>
							</label>
							<div class="form-input11">
								<select class="form-dropdown" name="bloodType" id="bloodType" required>
									<option value=""  selected="true">請選擇血型</option>
									<option value="A">A型</option>
									<option value="B">B型</option>
									<option value="AB">AB型</option>
									<option value="O">O型</option>
								</select>
							<font color="red" size="-1">${MsgMap.errorBloodType}</font>
							</div>
							<span id="checkBloodType" display="inline-block"></span>
						<li>
						
						
<!-- 					=============================================	 -->					
						<li>
							<label class="form-label"> 
								地址
								<span class="form-required"> * </span>
							</label>
							<div class="form-input5566">
								<input type="text" name="address" id="address" value="${param.address}" placeholder="Enter The Address" required >
								<font color="red" size="-1">${MsgMap.errorAddr}</font>
							</div>
							<span id="checkAddress" display="inline-block"></span>
						</li>	
						
						
						<li>
							<label class="form-label"> 
								照片
							</label>
							<div class="form-input">
								<input type="file" name="file1" >
								<font color="red" size="-1">${MsgMap.errorAddr}</font>
								  <img class="preview" style="max-width: 150px; max-height: 150px;">
						        <div class="size"></div>
							</div>
						</li>						
												
						<li> 
							<label class="form-label1">
								藥物過敏
					
							</label>
							<div class="form-input2">
								<textarea rows="5" cols="20" name="medicine" value="${param.medicine}"></textarea>
								 <font color="red" size="-1">${MsgMap.errorMedicine}</font>
							</div>
						</li>
						
						<li> 
							<label class="form-label1">
								過去病史
								
							</label>
							<div class="form-input2">
								<textarea rows="5" cols="20" name="medicalHistory" value="${param.medicalHistory}"></textarea>
								<font color="red" size="-1">${MsgMap.errorMedicalHistory}</font>
							</div>
						</li>
						
						
						<li class="last-type"> 
							<label class="form-label1">
								您如何得知本平台的內容或活動訊息(可複選):							
							</label>
							<div class="form-input2">
								<input type="checkbox" name="test1" ><label class="type-of-test">網站推介</label>
								<input type="checkbox" name="test2" ><label class="type-of-test">報章介紹</label>
								<input type="checkbox" name="test3" ><label class="type-of-test">商業電郵通知</label>
								<input type="checkbox" name="test4" ><label class="type-of-test">雜誌介紹</label>
								<input type="checkbox" name="test5" ><label class="type-of-test">博客 / Blogs</label>
								<input type="checkbox" name="test6" ><label class="type-of-test">網路搜尋器</label>
							</div>
						</li>
					</ul>
					<input type="submit" name="submitBtn" id="submitBtn" value="送出" >
				</form>	
			</div>
		</div>
		<div class="copyright">
			<p>© 2018 牽伴健康諮詢平台 | Design by <a href="<c:url value="../home.jsp"/>">TeleHealth</a></p> 
		</div>
	</div>
	
<!-- 	JavaScript -->
<!-- ====================載入JQuery========================= -->
<script src="<c:url value='/fullCalendar/jquery-3.3.1.min.js'/>"></script>	
<script type="text/javascript">
$('#account').blur(function(){
	var account = $('#account').val();
	$.getJSON('<c:url value="/checkaccount.controller" />',{"account":account}, function(datas) {
		var checkAccountMsg = $('#checkAccountResult');
		checkAccountMsg.empty();
		
		
	if(account !== null && account.length>0){
		if(datas=="此帳號可以使用!") {
			var pattern = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
			flag = pattern.test(account);
			if(flag){
				$('#submitBtn').prop("disabled", false);
				checkAccountMsg.html("<img src=images/yes.gif>"); 
				}else{
					checkAccountMsg.html("<img src=images/error.png>"+"格式錯誤!");
					$('#submitBtn').prop("disabled", true);
					}
		} else {
			checkAccountMsg.html("<img src=images/error.png>"+"已經被註冊過!");
			$('#submitBtn').prop("disabled", true);
		}				
		}else{
			checkAccountMsg.html("<img src=images/error.png>"+"不得為空白!");
			$('#submitBtn').prop("disabled", true);
			}	
	})
});

$('#pwd').blur(function(){
var checkPwdResult = $('#checkPwdResult');
		checkPwdResult.empty();
		var pwd = $('#pwd').val();
		if(pwd!=null&&pwd.length>0){
		checkPwdResult.empty();
		var pattern =/((?=.*\d)(?=.*[a-z]).{8,16})/;
		var pattern2 =/^[\d|a-zA-Z]+$/;
		flag = pattern.test(pwd);	
		if(pattern.test(pwd)&&pattern2.test(pwd)){
			$('#submitBtn').prop("disabled", false);
			checkPwdResult.html("<img src=images/yes.gif>"); 
			}else{
				checkPwdResult.html("<img src=images/error.png>"+"格式錯誤!");
				$('#submitBtn').prop("disabled", true);
				}
		}else{
			checkPwdResult.html("<img src=images/error.png>"+"不得為空白!");
			}
})

$('#pwdCheck').blur(function(){
	var pwdCheck = $('#pwdCheck').val();
	var checkPwdCheckResult = $('#checkPwdCheckResult');
	var pwd = $('#pwd').val();
	if(pwdCheck!=null&&pwdCheck.length>0){
		if(pwdCheck==pwd){
			checkPwdCheckResult.html("<img src=images/yes.gif>"); 
			$('#submitBtn').prop("disabled", false);
			}else{
				checkPwdCheckResult.html("<img src=images/error.png>"+"與密碼不相符!");
				$('#submitBtn').prop("disabled", true);
				}
		}else{
			checkPwdCheckResult.html("<img src=images/error.png>"+"不得為空白!");
			}
})

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
				checkMemName.html("<img src=images/error.png>"+"姓名格式錯誤!");
				$('#submitBtn').prop("disabled", true);
				}	
	}else{
		checkMemName.html("<img src=images/error.png>"+"不得為空白!");
		$('#submitBtn').prop("disabled", true);
		}

})

$('#gender').blur(function(){
	var gender = $('#gender').val();
	var checkGender = $('#checkGender');
	if(gender!==""){
		checkGender.html("<img src=images/yes.gif>"); 
		}else{
			checkGender.html("<img src=images/error.png>"+"不得為空白!");
			}
})

$('#phone').blur(function(){
	var phone = $('#phone').val();
	var checkPhone = $('#checkPhone');
	if(phone!= null	&& phone.length>0){
// 		var pattern =/[0-9]{2,3}-[0-9]{5,}/;	
		var pattern =/^0\d{1,3}-\d{7,8}$/ ; 
		
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
			}
})


$('#cellphone').blur(function(){
	var cellphone = $('#cellphone').val();
	var checkCellphone = $('#checkCellphone');
	if(cellphone!= null	&& cellphone.length>0){
		var pattern = /[0-9]{10,}/;
		flag = pattern.test(cellphone);	
		if(flag && cellphone.length<11){
			checkCellphone.html("<img src=images/yes.gif>"); 	
		$('#submitBtn').prop("disabled", false);	
			}else{
				checkCellphone.html("<img src=images/error.png>"+"電話格式錯誤!");
			$('#submitBtn').prop("disabled", true);
				}

		}else{
			checkCellphone.html("<img src=images/error.png>"+"不得為空白!");
			}
})

$('#year').blur(function(){
	var year = $('#year').val();
	var checkYear = $('#checkYear');
	if(year!= null	&& year.length>0){
		var pattern = /[0-9]{4,}/;
		flag = pattern.test(year);	
		if(flag && year.length<5){
		checkYear.html("<img src=images/yes.gif>"); 
			}else{
			  checkYear.html("<img src=images/error.png>"+"格式錯誤!");
				}
	}else{
		checkYear.html("<img src=images/error.png>"+"不得為空白!");
		}
	
})

$('#memHeight').blur(function(){
	var memHeight = $('#memHeight').val();
	var checkMemHeight = $('#checkMemHeight');
	if(memHeight!= null	&& memHeight.length>0){

		var pattern =/^[0-9]+(\.[0-9]{1,2})?$/;
		flag = pattern.test(memHeight);
		if(flag && memHeight<300 &&memHeight>100){
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
		if(flag  && memWeight<250 && memWeight>20){
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

$('#address').blur(function(){
	var address = $('#address').val();
	var checkAddress = $('#checkAddress');
	if(address!= null	&& address.length>0){
		checkAddress.html("<img src=images/yes.gif>"); 
	}else{
		checkAddress.html("<img src=images/error.png>"+"不得為空白!");
		}
})
</script>
	
</body>
</html>