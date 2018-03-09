<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation"> <!-- 上下左右都有padding -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle='collapse'
			data-target='.navbar-ex1-collapse'>
			<!-- 那個點很重要 -->
			<span class="sr-only">選單切換</span> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">TeleHealth</a>
	</div>
	<!-- 刪除預設padding margin -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a href="Members02.jsp">會員專區</a></li>
			<li><a href="Members02.jsp">修改會員資料</a></li>
			<li><a href="Members03.jsp">修改會員密碼</a></li>
			<li><a href="Members04.jsp">會員</a></li>
		</ul>
		<!--上下margin左右padding  / 被float right推過去 -->
		<form class="navbar-form navbar-left" role="search">
			<!-- 使用inline-block -->
			<div class="form-group">
				<!-- 文字欄位 -->
				<input type="text" class="form-control" placeholder="請輸入關鍵字">
			</div>
			<!-- 顏色白色 -->
			<button type="submit" class="btn btn-default">搜尋</button>
		</form>
		<!-- 被float right推過去 -->
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#">會員 您好</a></li>
			<li><a href="#">登出</a></li>
			<li><a href="Members05.jsp">個人設定</a></li>
			<!-- li裡面還有ul !!! -->
			<!-- 按下後，增加class open -->
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">繁體中文 <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#">繁體中文</a></li>
					<li><a href="#">English</a></li>
					<li><a href="#">日本語</a></li>
				</ul></li>
		</ul>
	</div>
	</nav>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>


	<form method="post" enctype="multipart/form-data"
		action="<c:url value="/Members02.controller" />">
		<!-- 主區塊 -->
		<div id="main">
					<table id="Table1" border="0" cellspacing="0" cellpadding="4"
						width="500" align="center">
						<tr>
							<td>
								<p>
									<span class="notice">標有＊為必須填寫資料</span>
								</p>
								<table id="Table7" class="Collapse" border="0" cellspacing="0"
									cellpadding="0" width="100%" frame="box">
									<tr>
										<td class="TableHeading" width="100">＊姓&nbsp;&nbsp;&nbsp;名
										</td>
										<td class="TableData"><input type="text" name="memName"
											value="${LoginOK.memName}" style="width: 320px;"> <font
											color="red" size="-1">${MsgMap.errormemName}</font>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊身&nbsp;&nbsp;&nbsp;高
										</td>
										<td class="TableData"><input type="text" name="memHeight"
											value="${LoginOK.memHeight}" style="width: 120px;"> <font
											color="red" size="-1">${MsgMap.errorMemHeight}</font>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊體&nbsp;&nbsp;&nbsp;重
										</td>
										<td class="TableData"><input type="text" name="memWeight"
											value="${LoginOK.memWeight}" style="width: 120px;"> <font
											color="red" size="-1">${MsgMap.errorMemWeight}</font>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊血型</td>
										<td class="TableData"><select name="bloodType"
											id="bloodType" style="width: 120px; height: 20px;">
												<option value="">請選擇血型</option>
												<option value="A">A型</option>
												<option value="B">B型</option>
												<option value="AB">AB型</option>
												<option value="O">O型</option>
										</select><font color="red" size="-1">${MsgMap.errorBloodType}</font> <input
											type="hidden" id="hiddenBlood" value="${LoginOK.bloodType}">
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊藥物過敏</td>
										<td class="TableData"><input type="text" name="medicine"
											value="${LoginOK.medicine}" style="width: 320px;"> <font
											color="red" size="-1">${MsgMap.errorMedicine}</font>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊過去病史</td>
										<td class="TableData"><input type="text"
											name="medicalHistory" value="${LoginOK.medicalHistory}"
											style="width: 320px;"> <font color="red" size="-1">${MsgMap.errorMedicalHistory}</font>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊電話</td>
										<td class="TableData"><input type="text" name="phone"
											value="${LoginOK.phone}" style="width: 320px;"> <font
											color="red" size="-1">${MsgMap.errorPhone}</font>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊行動電話</td>
										<td class="TableData"><input type="text" name="cellphone"
											value="${LoginOK.cellphone}" style="width: 320px;"> <font
											color="red" size="-1">${MsgMap.errorCellphone}</font>
									</tr>
									<tr>
										<td class="TableHeading" width="100">＊居住地</td>
										<td class="TableData"><input type="text" name="address"
											value="${LoginOK.address}" style="width: 320px;"> <font
											color="red" size="-1">${MsgMap.errorAddr}</font>
									</tr>
									<tr>
										<td class="TableHeading" width="100">&nbsp;&nbsp;&nbsp;&nbsp;照&nbsp;&nbsp;&nbsp;片
										</td>
										<td class="TableData"><input type="file" id="ff"
											onchange="aa()" name="fileout" />

											<div id="msg"></div>
											<div
												style="width: 150px; height: 150px; border: 0.5px black solid">
												<img id="xx"
													src="<c:url value='/getImage.controller?account=${LoginOK.account}' />"
													style="max-width: 149px; max-height: 149px;" />
											</div>
									</tr>
								</table>

								<div style="width: 100%; background-color: rgb(235, 235, 235)">
									<div
										style="margin-left: 30%; padding-top: 10px; padding-bottom: 10px;">

										<button type="submit" class="btn-primary">確定</button>
										<button type="submit"
											style="background-color: #f58200; border: 1px solid #da7d00; font-size: 14px; color: #fff; text-shadow: 1px 1px 1px #666; padding: 5px 10px; border-radius: 4px; box-shadow: 1px 1px 3px #aaa; font-weight: bold; text-align: center; cursor: pointer;">取消</button>
										<input type="button" class="btn-primary" value="回主頁"
											onclick="location.href='../index.jsp'">
									</div>
								</div>
							</td>
						</tr>
					</table>
	</form>

	</div>

	<script>
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
	</script>

</body>
</html>