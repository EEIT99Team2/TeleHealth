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
				<button id="bmiSelect" data-toggle="collapse"
					data-target="#collapseExample" aria-expanded="false"
					aria-controls="collapseExample">
					<img class="insertBtn" src="<c:url value='/images/open.png' />">
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
							<label for="insert_height" class="col-2">身高</label> <input
								type="text" id="insert_height" name="height" class="col-4">公分
							<span id="heiMsg"></span> <br> <label for="insert_weight"
								class="col-2">體重</label> <input type="text" id="insert_weight"
								name="weight" class="col-4">公斤 <span id="weiMsg"></span>
							<br> <label for="height" class="col-2">BMI</label> <input
								type="text" id="insert_bmi" name="bmi" class="col-4"
								disabled="disabled">
							<button type="button" id="calBMI" class="btn btn-info">計算BMI</button>
						</div>
						<div class="modal-footer">
							<button type="button" id="insert" class="btn btn-default"
								disabled="disabled" data-dismiss="modal">新增</button>
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
						<h2 id="showHeight">
							<small>公分</small>
						</h2>
					</div>
					<div class="col-4 text-center">
						<h2 id="showWeight">
							<small>公斤</small>
						</h2>
					</div>
					<div class="col-4 text-center">
						<h2 id="showBMI">
							<small></small>
						</h2>
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

	<div class="collapse" id="collapseExample">
		<div class="card card-body">hihi</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			var weight;
			var height;
			var BMI;
			var re = /^[0-9]+$/;
			$('#calBMI').click(calBMI);
			function calBMI() {
			     try {
			         if ($('#insert_height').val() == "") { alert('請輸入身高'); return; }
			         if ($('#insert_weight').val() == "") { alert('請輸入體重'); return; }
			        	
			         weight = $('#insert_weight').val();
			         height = $('#insert_height').val() / 100;
			         BMI = Math.round((weight / Math.pow(height, 2)) *100) /100;
			         $('#insert_bmi').val(Math.round(BMI * 100) / 100);
			         if(BMI<10 || BMI>=100){
			        	 document.getElementById("heiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>請確認後再輸入喔!</span>";
				     }else{
			     	    $('#insert').prop("disabled", false);
			       	 }
			     }catch(e){
			    	 $('#insert').prop("disabled", true);}
			}

				$('#insert_height').focus(function() {
					$('#insert_bmi').val("");
		       		$('#insert').prop("disabled", true);
				})
				$('#insert_weight').focus(function() {
					$('#insert_bmi').val("");
		       		$('#insert').prop("disabled", true);
				})

			$('#insert_height').blur(function() {
				var height = $.trim($('#insert_height').val());
				if(isNaN(height) || height.length == 0 || height>250 || !re.test(height)) {					
					document.getElementById("heiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>可能超出預期請輸入正確身高!</span>";
					$('#insert').prop("disabled", true);
				} else {
					document.getElementById("heiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
				}
			});
			$('#insert_weight').blur(function() {
				var weight = $.trim($('#insert_weight').val());
				if(isNaN(weight) || weight.length == 0 || weight>200 || !re.test(weight)) {
					document.getElementById("weiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>可能超出預期請輸入正確體重!</span>";
					$('#insert').prop("disabled", true);
					} else {
					document.getElementById("weiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
				}
			});
			$('#insert').click(function(){
				 $.get("<c:url value='/healthpassport/querybmi.controller' />",{'height':height*100,'weight':weight, 'bmi': BMI}, function(data){
	                	//data就是Server回傳的結果
	                	JSON.parse(data);
	                	//清除元素紀錄
	                	$('#showHeight').empty();
	                	$('#showWeight').empty();
	                	$('#showBMI').empty();

	                	$('#showHeight').prepend("<small>"+(Math.floor(height*100))+"</small><small>公分</small>");
	                	$('#showWeight').prepend("<small>"+weight+"</small><small>公斤</small>");
	                	$('#showBMI').prepend("<small>"+'BMI-> '+BMI+"</small>");
	             })
			});
			$('#bmiSelect').click(function(){
// 				$.get()
			});

			
		});
	</script>

	<!--血壓-->
	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-6">
				<h3>血壓</h3>
			</div>
			<div class="col-4 text-right">
				<button id="insertBloodPressureRecords" data-toggle="modal"
					data-target="#myModalBloodPressure">
					<img class="insertBtn" src="<c:url value='/images/modify.jpg' />">
				</button>
				<button id="滑入滑出" data-toggle="滑入滑出" data-target="滑入滑出">
					<img class="insertBtn" src="<c:url value='/images/open.png' />">
				</button>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="myModalBloodPressure" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">血壓</h4>
						</div>
						<div class="modal-body">
							<label for="insert_systole" class="col-2">收縮壓</label> <input
								type="text" id="insert_systole" name="systole" class="col-4">mmHg(輸入格式範例:110)
							<span id="systoleMsg"></span> <br> <label
								for="insert_diastole" class="col-2">舒張壓</label> <input
								type="text" id="insert_diastole" name="diastole" class="col-4">mmHg(輸入格式範例:80)
							<span id="diastoleMsg"></span> <br> <label
								for="insert_heartBeat" class="col-2">脈搏</label> <input
								type="text" id="insert_heartBeat" name="heartBeat" class="col-4">次/分鐘(輸入格式範例:72)
							<span id="heartBeatMsg"></span> <br>
						</div>
						<div class="modal-footer">
							<button type="button" id="insertBP" class="btn btn-default"
								disabled="disabled" data-dismiss="modal">新增</button>
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
				<img src="<c:url value='/images/heart.JPG' />" alt="血壓">
			</div>
			<div class="col-9">
				<div class="row">
					<div class="col-4 text-center">
						<h2 id="showBloodPressure">
							<small>mmHg</small>
						</h2>
					</div>
					<div class="col-4 text-center">
						<h2 id="showHeartBeat">
							<small>次/分</small>
						</h2>
					</div>

				</div>
				<hr />
				<div class="row">
					<div class="col-12 text-center">
						<span id='bpResult'>這是查詢結果!!</span>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var systole;
			var diastole;
			var heartBeat;
			var re = /^[0-9]+$/;
			var a =0;
			var b =0;
			var c =0;
			$('#insert_systole').blur(function() {
				 systole = $.trim($('#insert_systole').val());
				if(isNaN(systole) || systole.length == 0 || !re.test(systole) || systole>250) {
					document.getElementById("systoleMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>請輸入正確血壓!</span>";
					a=1;

				} else{
					document.getElementById("systoleMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
					a=0;
				}
				if(a==1 ||b==1 ||c==1){
					$('#insertBP').prop("disabled", true);
				}else{
					$('#insertBP').prop("disabled", false);
				}
			});
			$('#insert_diastole').blur(function() {
				 diastole = $.trim($('#insert_diastole').val());
				if(isNaN(diastole) || diastole.length == 0 || !re.test(diastole) || diastole>200) {
					document.getElementById("diastoleMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>請輸入正確數字!</span>";
					b=1;
				} else {
					document.getElementById("diastoleMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
					b=0;
				}
				if(a==1 ||b==1 ||c==1){
					$('#insertBP').prop("disabled", true);
				}else{
					$('#insertBP').prop("disabled", false);
				}
			});
			$('#insert_heartBeat').blur(function() {
				 heartBeat = $.trim($('#insert_heartBeat').val());
				if(isNaN(heartBeat) || heartBeat.length == 0 || !re.test(heartBeat) || heartBeat>250) {
					document.getElementById("heartBeatMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>請輸入正確數字!</span>";
					c=1;
				} else {
					document.getElementById("heartBeatMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
					c=0;
				}
				if(a==1 ||b==1 ||c==1){
					$('#insertBP').prop("disabled", true);
				}else{
					$('#insertBP').prop("disabled", false);
				}
			});
			
			
			$('#insertBP').click(function(){
				var bps='BloodPressureSystole';
				var bpd='BloodPressureDiastole';
				var hb = 'HeartBeat';
				if(systole==null || diastole==null || heartBeat==null){
					alert("三個欄位都要輸入")
					$('#insertBP').prop("disabled", true);
				}else{

				 $.get("<c:url value='/healthpassport/queryBloodPressure.controller' />",{'systole':bps,'diastole':bpd, 'heartBeat': hb , 'systoleData':systole,'diastoleData':diastole,'heartBeatData': heartBeat}, function(data){
	                	//data就是Server回傳的結果
// 	                	JSON.parse(data);
	                	$('#showBloodPressure').prepend('<h1>'+systole/diastole+'<h1>');
	                	$('#showHeartBeat').prepend('<h1>'+heartBeat+'<h1>');
	             })
				}
			});
		});
	</script>


	<!--血糖-->
	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-6">
				<h3>血糖</h3>
			</div>
			<div class="col-4 text-right">
				<button id="insertBloodSugar" data-toggle="modal"
					data-target="#myModalBloodSugar">
					<img class="insertBtn" src="<c:url value='/images/modify.jpg' />">
				</button>
				<button id="滑入滑出" data-toggle="滑入滑出" data-target="滑入滑出">
					<img class="insertBtn" src="<c:url value='/images/open.png' />">
				</button>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="myModalBloodSugar" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">血糖</h4>
						</div>
						<div class="modal-body">
							<label for="insert_bloodsugar" class="col-2">血糖</label> <input
								type="text" id="insert_bloodsugar" name="bloodsugar"
								class="col-4">mg/dL(輸入格式範例:120) <span id="bloodsugarMsg"></span>

						</div>
						<div class="modal-footer">
							<button type="button" id="insertBS" class="btn btn-default"
								disabled="disabled" data-dismiss="modal">新增</button>
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
				<img src="<c:url value='/images/sugar.JPG' />" alt="血壓">
			</div>
			<div class="col-9">
				<div class="row">
					<div class="col-4 text-center">
						<h2 id="showBloodSugar">
							<small>mmHg</small>
						</h2>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-12 text-center">
						<span id="bsResult">這是查詢結果!!</span>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var bloodsugar
			var re = /^[0-9]+$/;
			$('#insert_bloodsugar').blur(function() {
				 bloodsugar = $.trim($('#insert_bloodsugar').val());
				if(isNaN(bloodsugar) || bloodsugar.length == 0 || !re.test(bloodsugar) bloodsugar>200) {
					document.getElementById("bloodsugarMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>請輸入數字!</span>";
					$('#insertBS').prop("disabled", true);
				} else {
					document.getElementById("bloodsugarMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
					$('#insertBS').prop("disabled", false);
				}
			});
			
			$('#insertBS').click(function(){
				 $.get("<c:url value='/healthpassport/queryBloodSugar.controller' />",{'bloodsugar':bloodsugar}, function(data){
	                	//data就是Server回傳的結果
// 	                	JSON.parse(data);
	             })
			});
		});
	</script>

</body>
</html>