<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>加入會員</title>
<style type="text/css">
<!--
body {
	background-attachment: fixed;
	background-color: #EBFFEB;
	background-repeat: no-repeat;
	background-position: 20px 50px;
}

.myBorder {
	color: #FFFF99;
	border: thin dotted #FFFFFF;
}

h1 {
	font-family: "標楷體", "新細明體", sans-serif;
	font-size: 24px;
}

.formBkgnd {
	color: #FFFFFF;
	background-color: #666666;
}

label {
	float: left;
	width: 8em;
	font-weight: bold;
	color: #000000;
	margin-top: 10px;
	margin-bottom: 2px;
	margin-right: 10px;
	text-align: right;
}

br {
	clear: both;
}

.fieldWidth {
	margin-top: 10px;
	margin-bottom: 2px;
	width: 200px;
	background: #F6E497;
	font-size: 1.1em;
}
/* 設定字體大小 */
.fontSize {
	font-size: 1.1em;
}

#main {
	position: relative;
	left: 70px;
	width: 600px;
	height: 543px;
	top: 0px;
	z-index: 2;
	font-size: 0.9em;
}
/* 主要內容的區塊 */
#content {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}
/* 設定傳送鈕的樣式 */
#submit {
	width: 64px;
	height: 30px;
	font-size: 1.2em color:#FFFFFF;
	margin-right: 1.5em;
	border-width: 2px;
	border-color: #FFEDAF #B2A268 #B2A268 #FFEDAF;
	background: #A9A9A9;
}
/* 設定取消鈕的樣式 */
#cancel {
	width: 64px;
	height: 30px;
	font-size: 1.2em color:#ffffff;
	border-width: 2px;
	border-color: #FFEDAF #B2A268 #B2A268 #FFEDAF;
	background: #a9a9a9;
}

#errorMsg {
	position: relative;
	top: 0px;
	left: 0px;
	color: #FF0000;
	font-size: 0.8em;
}
-->
</style>

</head>
<body>
	<c:set var="funcName" value="REG" />
	<!-- 引入共同的頁首 -->
	<%-- <jsp:include page="/fragment/top.jsp" /> --%>
	<div id="content">
		<Table width="700" border='2' cellspacing="0" bgColor='#E7CDFF'>
			<TR height="60">
				<TD>
					<TABLE cellspacing="1">
						<TR>
							<TD width="680" colspan='3' align="center"><Font
								color="#006600" size='5' face="標楷體">${AppName}</Font></TD>
							</TD>
						</TR>
						<TR>
							<TD width="240"></TD>
							<TD width="200" align="center"><Font color="#006600"
								size='4' face="標楷體">加入會員</Font></TD>
							<!-- 此區塊顯示程式執行後的訊息 -->
							<TD width="240" aligh="left"><font size="-1" color="#FF0000">
									${MsgMap.InsertNG}${MsgMap.errorSaveData}</font></TD>
						</TR>
					</TABLE>
				</TD>
			</TR>
			<TR>
				<TD colspan="3">
					<form method="post" enctype="multipart/form-data"
						action="<c:url value="/register.controller" />">
						<label class="fontSize">帳號(同E-Mail)：</label> 
						<input type="text"
							name="account" value="${param.account}" class="fieldWidth"
							style="width: 320px;">
						<!--  注意value屬性的內容以及顯示錯誤訊息的寫法 -->
						<font size="-1" color="#FF0000">${MsgMap.errorAccount}</font> <br />

						<label class="fontSize">姓名：</label> 
						<input type="text"
							name="memName" value="${param.memName}" class="fieldWidth"
							style="width: 320px;"> <font color="red" size="-1">${MsgMap.errormemName}</font>
						
						<br /> <label class="fontSize">電話：</label> 
						<input type="text"
							name="phone1" value="${param.phone1}" class="fieldWidth"
							style="width: 60px;"> ─ <input type="text"
							name="phone" value="${param.phone}" class="fieldWidth"
							style="width: 180px;"> <font color="red" size="-1">${MsgMap.errorPhone}</font>
							
						
						<br /> <label class="fontSize">行動電話：</label> 
						<input type="text"
							name="cellphone" value="${param.cellphone}" class="fieldWidth"
							style="width: 320px;"> <font color="red" size="-1">${MsgMap.errorCellphone}</font>
			
						<br /> <label class="fontSize">性別：</label> 
						<input type="radio" name="gender"  class="fieldWidth" required="required" data-msg-required="請填寫你的性別。" value="M" style="width:20px;" />男性
          				<input type="radio" name="gender" class="gender" required="required" data-msg-required="請填寫你的性別。" value="F" />女性
									
						<br /> <label class="fontSize">生日：</label> 
						<input type="date" step="2" min="1950-10-01" max="2018-03-23"
							name="birth" value="${param.birth}" class="fieldWidth"
							style="width: 150px;"> <font color="red" size="-1">${MsgMap.errorBirth}</font>						
						
						<br /> <label class="fontSize">身高：</label> 
						<input type="text"
							name="memHeight" value="${param.memHeight}" class="fieldWidth"
							style="width: 120px;"> <font color="red" size="-1">${MsgMap.errorMemHeight}</font>
						
						<br /> <label class="fontSize">體重：</label> 
						<input type="text"
							name="memWeight" value="${param.memWeight}" class="fieldWidth"
							style="width: 120px;"> <font color="red" size="-1">${MsgMap.errorMemWeight}</font>
						
						<br /> <label class="fontSize">血型：</label> 
							<select name="bloodType" style="width:120px;height:20px;">
							<option value="" selected="true">請選擇血型</option>
							　<option value="A">A型</option>
							　<option value="B">B型</option>
							　<option value="AB">AB型</option>
							　<option value="O">O型</option>
							</select><font color="red" size="-1">${MsgMap.errorBloodType}</font>

							
						
						<br /> <label class="fontSize">地址：</label> 
						<input type="text"
							name="address" value="${param.address}" class="fieldWidth"
							style="width: 320px;"> <font color="red" size="-1">${MsgMap.errorAddr}</font>
						
						<br /> <label class="fontSize">密碼(8~16位英數字混合)：</label> 
						<input type="password"
							name="pwd" value="${param.pwd}" class="fieldWidth"
							style="width: 320px;"> <font color="red" size="-1">${MsgMap.errorPwd}</font>					
						
						<br /> <label class="fontSize">密碼確認：</label>			
							<input name="pwdCheck" type="password" value="${param.pwdCheck}" tabindex="5" class="fieldWidth"
							style="width: 320px;"/><font color="red" size="-1">${MsgMap.errorPwdCheck}</font>
					
												
						<br /> <label class="fontSize">藥物過敏：</label> 
						<input type="text"
							name="medicine" value="${param.medicine}" class="fieldWidth"
							style="width: 320px;"> <font color="red" size="-1">${MsgMap.errorMedicine}</font>
						<br /> <label class="fontSize">過去病史：</label> 
						<input type="text"
							name="medicalHistory" value="${param.medicalHistory}"
							class="fieldWidth" style="width: 320px;"> <font
							color="red" size="-1">${MsgMap.errorMedicalHistory}</font> <br />
							
<!-- 						<label class="fontSize">照片：</label>  -->
<!-- 						<Input Type="file" size="40" -->
<!-- 							class="fieldWidth" style="width: 325px;" name="file1"><BR> -->
<%-- 						<font color="red" size="-1">${MsgMap.errorPhoto}</font> <br /> --%>
						
						<label class="fontSize">照片：</label> 
						   <Input Type="file" size="40"
							class="fieldWidth" style="width: 325px;" name="file1"><BR>
						    <div>
						        <img class="preview" style="max-width: 150px; max-height: 150px;">
						        <div class="size"></div>
						    </div>
					


						<div id="btnArea" align="center">
							<input type="submit" name="submit" id="submit" value="儲存" /> <input
								type="reset" name="cancel" id="cancel" value="重填">
						</div>
						<br />
					</form>
				</TD>
			</TR>
		</Table>
	</div>
</body>
</html>