<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>健康護照</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/w3.css"/>">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/index.css"/>" />

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
	<input type="hidden" id="member" value="${LoginOK.memberId}" />
	<div class="container">
		<h2>健康數據指標</h2>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-6">
				<h3>BMI</h3>
			</div>
			<div class="col-4 text-right">
				<button class="btn btn-outline-info" id="insertBMI"
					data-toggle="modal" data-target="#myModal">
					<img class="insertBtn" src="<c:url value='/images/modify.jpg' />">
				</button>
				<button class="btn btn-outline-dark" type="button"
					data-toggle="collapse" data-target="#collapseExample"
					aria-expanded="false" aria-controls="collapseExample">查詢紀錄
				</button>
			</div>

			<!-- Modal -->
			<div class="modal fade " id="myModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content ">
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
						<h2 id="showBMI"></h2>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-12 text-center">
						<span id='bmiResult'>這是查詢結果!!</span>
					</div>
				</div>

				<div class="row">
					<div class="col-12 text-center">
						<div class="collapse container" id="collapseExample">
							<div class="card card-body table-responsive">
<!-- 圖表 -->
<canvas id="mybmi" height="200" width="400"></canvas>
<hr>
								<table id='bmiTable' width="100%"
									class="table table-bordered table-striped table-hover ">
									<thead class="table-dark">
										<tr>
											<th scope="col">身高</th>
											<th scope="col">體重</th>
											<th scope="col">BMI</th>
											<th scope="col">結果</th>
											<th scope="col">輸入時間</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
</table>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<br>
	<br>
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
				<button class="btn btn-outline-dark" type="button"
					data-toggle="collapse" data-target="#bp" aria-expanded="false"
					aria-controls="collapseExample">查詢紀錄</button>
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
							<small id='showbp'>mmHg</small>
						</h2>
					</div>
					<div class="col-4 text-center">
						<h2 id="showHeartBeat">
							<small id='showhb'>次/分</small>
						</h2>
					</div>

				</div>
				<hr />
				<div class="row">
					<div class="col-12 text-center">
						<span id='bpResult'>這是查詢結果!!</span>
					</div>
				</div>

				<div class="row">
					<div class="col-12 text-center">
						<div class="collapse container" id="bp">
							<div class="card card-body">
<!-- 放圖表與表格 -->



<!-- 放圖表與表格 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
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
				<button class="btn btn-outline-dark" type="button"
					data-toggle="collapse" data-target="#bs" aria-expanded="false"
					aria-controls="collapseExample">查詢紀錄</button>
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
				<img src="<c:url value='/images/sugar.JPG' />" alt="血糖">
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

				<div class="row">
					<div class="col-12 text-center">
						<div class="collapse container" id="bs">
							<div class="card card-body">
<!-- 放圖表與表格 -->



<!-- 放圖表與表格 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	

	
	<script src="<c:url  value='/js/jquery-3.3.1.min.js'/>"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
	<script src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script>
	<!--  計算BMI -->
	<script type="text/javascript">
		$(document).ready(function() {

			$('#member').val();
			var memberid='B0041CB5-09F1-4E5B-8D57-1F0406019143';
			var weight;
			var height;
			var BMI;

			$('#calBMI').click(calBMI);
			function calBMI() {
			     try {
			         if ($('#insert_height').val() == "") { alert('請輸入身高'); return; }
			         if ($('#insert_weight').val() == "") { alert('請輸入體重'); return; }
			        	
			         weight = $('#insert_weight').val();
			         height = $('#insert_height').val() / 100;
			         BMI = Math.round((weight /  Math.pow(height, 2)) *100) /100;
			         $('#insert_bmi').val(Math.round(BMI * 100) / 100);
			         if(BMI<10 || BMI>=100){
			        	 alert('請確認後再輸入喔!');
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
				if(isNaN(height) || height.length == 0 || height>280 ) {					
					document.getElementById("heiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>可能超出預期請輸入正確身高!</span>";
					$('#insert').prop("disabled", true);
				} else {
					document.getElementById("heiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
				}
			});
			$('#insert_weight').blur(function() {
				var weight = $.trim($('#insert_weight').val());
				if(isNaN(weight) || weight.length == 0 || weight>240) {
					document.getElementById("weiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>可能超出預期請輸入正確體重!</span>";
					$('#insert').prop("disabled", true);
					} else {
					document.getElementById("weiMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
				}
			});
			$('#insert').click(function(){
				 $.get("<c:url value='/healthpassport/querybmi.controller' />",{'memberid':memberid,'height':height*100,'weight':weight, 'bmi': BMI}, function(data){
	                	//data就是Server回傳的結果
// 	                	JSON.parse(data);
	             })
	             
			});

	//把傳來值塞進頁面			
		$.get("<c:url value='/healthpassport/newOneRecords.controller'/>",{'memberid':memberid},function(oneData){
			console.log(oneData);
// 	       	$('#showHeight').prepend("topbmi":"h");
// 	       	$('#showWeight').prepend("topbmi":"w");
// 	       	$('#showBMI').prepend("topbmi":"b");
		});
		
		
			

//載入會員記錄
$('#bmiTable').dataTable().fnDestroy(); 
$('#bmiTable').DataTable({
    "ajax": '/TeleHealth/healthpassport/bmirecords.controller?memberid='+memberid,
    "columns": [
        { "data": "height" },
        { "data": "weight" },
        { "data": "bmi" },
        { "data": "bmiResult" },
        { "data": "createTime" }
    ],
    "order": [[ 4, 'desc' ]],
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
	
//圖表

var dates = ["Red", "Blue", "Yellow", "Green", "Purple", "Orange","xxx","ooo" , "YYY"];
var datas = [12, 19, 3, 5, 2, 3, 99, 88 ,66]
//	$.each() {
//		dates.add(xxx);
//	}

var ctx = $("#mybmi")
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: dates,
        datasets: [{
            label: '# of Votes',
            data: datas,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});


							             
		

<!-- 血壓 -->

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

				 $.get("<c:url value='/healthpassport/queryBloodPressure.controller' />",{'memberid':memberid,'systole':bps,'diastole':bpd, 'heartBeat': hb , 'systoleData':systole,'diastoleData':diastole,'heartBeatData': heartBeat}, function(data){
	                	//data就是Server回傳的結果
// 	                	JSON.parse(data);
	             });
// 				 $('#showBloodPressure').empty();

// 				 $('#showHeartBeat').empty();
	             
	                	$('#showBloodPressure').prepend('<small>'+systole+'\/'+diastole+'</small>');
	                	$('#showHeartBeat').prepend('<small>'+heartBeat+'</small>');

	                	$('#insert_systole').val("");
	                	$('#insert_diastole').val("");
	                	$('#insert_heartBeat').val("");

	                	$('#systoleMsg').empty();
	                	$('#diastoleMsg').empty();
	                	$('#heartBeatMsg').empty();
	         }
			});

	<!--  血糖 -->

			var bloodsugar;
			var re = /^[0-9]+$/;
			$('#insert_bloodsugar').blur(function() {
				 bloodsugar = $.trim($('#insert_bloodsugar').val());
				if(isNaN(bloodsugar) || bloodsugar.length == 0 || !re.test(bloodsugar) || bloodsugar>200) {
					document.getElementById("bloodsugarMsg").innerHTML = "<img class='chk' src='<c:url value='/images/error.jpg' />' /><span>請輸入數字!</span>";
					$('#insertBS').prop("disabled", true);
				} else {
					document.getElementById("bloodsugarMsg").innerHTML = "<img class='chk' src='<c:url value='/images/check.jpg' />' />";
					$('#insertBS').prop("disabled", false);
				}
			});
			
			$('#insertBS').click(function(){
				 $.get("<c:url value='/healthpassport/queryBloodSugar.controller' />",{'memberid':memberid,'bloodsugar':bloodsugar}, function(data){
	                	//data就是Server回傳的結果
// 	                	JSON.parse(data);
	             })
			});


			
	});
		
	</script>

</body>
</html>