<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
			id="CHR" data-toggle="tab" role="tab" value="儲值點數"
			onclick="location.href='ChangePwd.jsp'" /></li>
		
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

<div class="container">
		<div style="text-align:center;"><h3 class="title">修改密碼</h3></div>
					<div style="text-align:center;"><p>請輸入舊的會員密碼及希望更改的新密碼</p></div>
		
		<div class="row">
			<div class="col-3"></div>
				<div class="col-6">
					<div class="from-group">
						<form method="post" action='<c:url value="/ModifyPwd.controller" />' >
							<div class="row">
								<label for="oldpwd">請輸入原密碼：</label>
								<input type="password" name="oldpwd" id="oldpwd" value="${param.oldpwd}" class="fieldWidth" style="width: 320px;" required>
								<span id="checkOldpwd"></span>
							</div>
							<div class="row"><p> </p></div>
							<div class="row">
								<label for="Newpwd">請輸入新密碼：</label>
								<input type="password" name="Newpwd" id="Newpwd" value="${param.Newpwd}" class="fieldWidth" style="width: 320px;" required>
								<span id="checkNewpwd"></span>
							</div>
							<div class="row"><p> </p></div>
							<div class="row">
								<label for="pwdCheck">請再輸入一次：</label>
								<input type="password" name="pwdCheck" id="pwdCheck" value="${param.pwdCheck}" class="fieldWidth" style="width: 320px;" required>
								<span id="passwordCheck"></span>
							</div>
							<div class="row"><p> </p></div>
								<div style="text-align:center;">
								<input class="btn btn-primary" type="submit"name="submitBtn" id="submitBtn" value="送出">
								</div>
						</form>		
					</div>
				</div>
			<div class="col-3"></div>
		</div>	
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

<script type="text/javascript">
$(document).ready(function() {

	var memberId = $('#memberId').val();
$('#oldpwd').blur(function(){
	var oldpwd = $('#oldpwd').val();
	
	$.getJSON('<c:url value="/checkPassword.controller" />',{"oldpwd":oldpwd,"memberId":memberId}, function(datas) {
		var checkOldpwd = $('#checkOldpwd');
		checkOldpwd.empty();
		
	if(oldpwd !==null && oldpwd.length>0){	
		if(datas=="此密碼正確!"){
			checkOldpwd.html("<img src=images/yes.gif>"); 
			}else{		
				checkOldpwd.html("<img src=images/error.png>"+"密碼錯誤!");
				$('#submitBtn').prop("disabled", true);
			}
		}else{
			checkOldpwd.html("<img src=images/error.png>"+"不得為空白!");
			$('#submitBtn').prop("disabled", true);
			}
	})
});

$('#Newpwd').blur(function(){
	var Newpwd = $('#Newpwd').val();
	var checkNewpwd = $('#checkNewpwd');
	if(Newpwd !==null && Newpwd.length>0){
		checkNewpwd.empty();
		var pattern =/((?=.*\d)(?=.*[a-z]).{8,16})/;
		var pattern2 =/^[\d|a-zA-Z]+$/;
		flag = pattern.test(Newpwd);	
		if(pattern.test(Newpwd)&&pattern2.test(Newpwd)){
			$('#submitBtn').prop("disabled", false);
			checkNewpwd.html("<img src=images/yes.gif>"); 
			}else{
				checkNewpwd.html("<img src=images/error.png>"+"格式錯誤!");
				$('#submitBtn').prop("disabled", true);
				}
		}else{
			checkNewpwd.html("<img src=images/error.png>"+"不得為空白!");
			}
	
});

$('#pwdCheck').blur(function(){
	var pwdCheck = $('#pwdCheck').val();
	var passwordCheck = $('#passwordCheck');
	var Newpwd = $('#Newpwd').val();

	if(pwdCheck!=null&&pwdCheck.length>0){
		if(pwdCheck==Newpwd){
			passwordCheck.html("<img src=images/yes.gif>"); 
			$('#submitBtn').prop("disabled", false);
			}else{
				passwordCheck.html("<img src=images/error.png>"+"與新密碼不相符!");
				$('#submitBtn').prop("disabled", true);
				}
		}else{
			passwordCheck.html("<img src=images/error.png>"+"不得為空白!");
			}
	

});


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