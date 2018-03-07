<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>健康護照</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<style type="text/css">
.insertBtn {
	width: 16px;
}

.chk {
	width: 16px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>健康數據指標</h2>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-6">
				<h3>BMI</h3>
			</div>
			<div class="col-4 text-right">
				<button id="insertBMI" data-toggle="modal" data-target="#myModal">
					<img class="insertBtn" src="<c:url value='/images/modify.jpg' />">
				</button>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">BMI</h4>
						</div>
						<div class="modal-body">
							<label for="insert_height" class="col-2">身高</label>
							<input type="text" id="insert_height" name="height" class="col-4">公分 <span id="heiMsg"></span>
							<br>
							<label for="insert_weight" class="col-2">體重</label>
							<input type="text" id="insert_weight" name="weight" class="col-4">公斤 <span id="weiMsg"></span>
							<br>
							<label for="height" class="col-2">BMI</label>
							<input type="text" id="insert_bmi" name="bmi" class="col-4" disabled="disabled">
							<button type="button" id="calBMI" class="btn btn-info">計算BMI</button>
						</div>
						<div class="modal-footer">
							<button type="button" id="insert" class="btn btn-default" disabled="disabled"
								data-dismiss="modal">新增</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">關閉</button>
						</div>
					</div>
				</div>
			</div>

			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-3 text-center align-middle">
				<img src="<c:url value='/images/weight.jpg' />" alt="BMI">
			</div>
			<div class="col-9">
				<div class="row">
					<div class="col-4 text-center">
						<h2 id="showHeight"><small>公分</small></h2>
					</div>
					<div class="col-4 text-center">
						<h2 id="showWeight"><small>公斤</small></h2>
					</div>
					<div class="col-4 text-center">
						<h2 id="showBMI"></h2>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-12 text-center">
						<span>這是查詢的結果!!</span>
					</div>
				</div>
			</div>
		
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var weight;
			var height;
			var BMI;
			$('#calBMI').click(calBMI);
			function calBMI() {
			     try {
			         if ($('#insert_height').val() == "") { alert('請輸入身高'); return; }
			         if ($('#insert_weight').val() == "") { alert('請輸入體重'); return; }
			        	
			         weight = $('#insert_weight').val();
			         height = Math.pow($('#insert_height').val() / 100 , 2);
			         BMI = Math.round((weight / height) *100) /100;
			         $('#insert_bmi').val(Math.round(BMI * 100) / 100);
			         $('#insert').prop("disabled", false);
			     }catch(e){
			    	 $('#insert').prop("disabled", true);}
			}

			$('#insert_height').blur(function() {
				var height = $.trim($('#insert_height').val());
				if(isNaN(height) || height.length == 0) {
					document.getElementById("heiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>請輸入數字!</span>";
				} else {
					document.getElementById("heiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
				}
			});
			$('#insert_weight').blur(function() {
				var weight = $.trim($('#insert_weight').val());
				if(isNaN(weight) || weight.length == 0) {
					document.getElementById("weiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>請輸入數字!</span>";
				} else {
					document.getElementById("weiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
				}
			});
			$('#insert').click(function(){
				 $.get("<c:url value='/healthpassport/querybmi.controller' />",{'height':height*100,'weight':weight, 'bmi': BMI}, function(data){
	                	//data就是Server回傳的結果
	                	JSON.parse(data);
	                	
	             })
				 
			});
		});
	 
	</script>	
</body>
</html>