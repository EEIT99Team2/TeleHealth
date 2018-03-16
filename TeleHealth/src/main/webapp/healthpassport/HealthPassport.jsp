<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>健康護照</title>
<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/index.css"/>" />

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
	<jsp:include page="/fragment/nav2.jsp" />
	<div class="container">
		<h2>健康數據指標</h2><input type="hidden" id="gender" value="${LoginOK.gender}"><input type="hidden" id="realage" value="${LoginOK.birth}">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-6">
				<h3>BMI</h3>
			</div>
			<div class="col-4 text-right">
				<button class="btn btn-outline-info" id="insertBMI"
					data-toggle="modal" data-target="#mybmi">
					<img class="insertBtn" src="<c:url value='/images/modify.jpg' />">
				</button>
				<button id='bmiselect' class="btn btn-outline-dark" type="button"
					data-toggle="collapse" data-target="#collapseExample"
					aria-expanded="false" aria-controls="collapseExample">查詢紀錄
				</button>
			</div>

			<!-- Modal -->
			<div class="modal fade " id="mybmi" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content ">
						<div class="modal-header">
							<h4 class="modal-title">BMI</h4>
						</div>
						<div class="modal-body">
							<label for="insert_height" class="col-2">身高</label> <input
								type="text" id="insert_height" name="height" class="col-4">公分<span
								id="heiMsg"></span> <br> <label for="insert_weight"
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
						<h1 id="showHeight"></h1>
						<h2>
							<small>公分</small>
						</h2>
					</div>
					<div class="col-4 text-center">
						<h1 id="showWeight"></h1>
						<h2>
							<small>公斤</small>
						</h2>
					</div>
					<div class="col-4 text-center">
						<h4 id="showTime"></h4>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-12 text-center">
						<span id='bmiResult'></span>
					</div>
				</div>
				<div class="row">
					<div class="col-12 text-center">
						<div class="collapse container" id="collapseExample">
							<div class="card card-body table-responsive">
								<div>
									<button type="button" id='bmiweek'
										class="btn btn-outline-primary">一星期</button>
									<button type="button" id='bmimonth'
										class="btn btn-outline-primary">一個月</button>
									<button type="button" id='bmithreemonth'
										class="btn btn-outline-primary">三個月</button>
								</div>
								<div id="mychart1div">
								<!-- 圖表 -->
								<canvas id="mychart1" height="200" width="400"></canvas>
								</div>
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
				<button id='bpselect' class="btn btn-outline-dark" type="button"
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
						<h1 id="showBloodPressure"></h1>
						<h2>
							<small>mmHg</small>
						</h2>
					</div>
					<div class="col-4 text-center">
						<h1 id="showHeartBeat"></h1>
						<h2>
							<small>次/分</small>
						</h2>
					</div>
					<div class="col-4 text-center">
						<h4 id="showbpTime"></h4>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-12 text-center">
						<span id='bpResult'></span>
					</div>
				</div>

				<div class="row">
					<div class="col-12 text-center">
						<div class="collapse container" id="bp">
							<div class="card card-body">
								<div>
									<button type="button" id='bpweek'
										class="btn btn-outline-primary">一星期</button>
									<button type="button" id='bpmonth'
										class="btn btn-outline-primary">一個月</button>
									<button type="button" id='bpthreemonth'
										class="btn btn-outline-primary">三個月</button>
								</div>
								<div id="mychart2div">
								<!-- 圖表 -->
								<canvas id="mychart2" height="200" width="400"></canvas>
								</div>
								<hr>
								<table id='bpTable' width="100%"
									class="table table-bordered table-striped table-hover ">
									<thead class="table-dark">
										<tr>
											<th scope="col">收縮壓</th>
											<th scope="col">舒張壓</th>
											<th scope="col">脈搏</th>
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
				<button id='bsrecords' class="btn btn-outline-dark" type="button"
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
						<h1 id="showBloodSugar"></h1>
						<h2>
							<small>mmHg</small>
						</h2>
					</div>
					<div class="col-4 text-center">
						<h4></h4>
					</div>
					<div class="col-4 text-center">
						<h4 id="showbsTime"></h4>
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
								<div>
									<button type="button" id='bsweek'
										class="btn btn-outline-primary">一星期</button>
									<button type="button" id='bsmonth'
										class="btn btn-outline-primary">一個月</button>
									<button type="button" id='bsthreemonth'
										class="btn btn-outline-primary">三個月</button>
								</div>
								<div id="mychart3div">								
								<canvas id="mychart3" height="200" width="400"></canvas>
								</div>
								<hr>
								<table id='bsTable' width="100%"
									class="table table-bordered table-striped table-hover ">
									<thead class="table-dark">
										<tr>
											<th scope="col">血糖值</th>
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
	<jsp:include page="/fragment/footer.jsp" />
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
	<script
		src="https://cdn.datatables.net/v/bs4/dt-1.10.16/datatables.min.js"></script>
	<script src="<c:url value='/fullCalendar/moment.min.js'/>"></script>
	<!--  計算BMI -->
	<script type="text/javascript">
	var memberid=$('#memberId').val();
		$(document).ready(function() {
			var weight;
			var height;
			var BMI;					
			$.getJSON("<c:url value='/healthpassport/bmitopRecord.controller'/>",{'memberid':memberid},function(oneData){
	 			 			
	  		 	$('#showHeight').empty();
	 	       	$('#showWeight').empty();
	 	       	$('#showTime').empty();
	 	       	$('#bmiResult').empty();
	            $.each(oneData,function(i,value){               
	         	var height = value[0].h;   	       			
	    		var weight = value[0].w;
	    		var bmi = value[0].b;
	    		var result = value[0].rs;
	    		var time = value[0].t;   			
	    		 	$('#showHeight').prepend(height);
	    	       	$('#showWeight').prepend(weight);
	    	       	$('#showTime').prepend(time);
	    	       	$('#bmiResult').prepend('<h4><small>'+'BMI --> '+bmi+'\|'+result+'</small></h4>');
	                })
	           });
			
	 		$.getJSON("<c:url value='/healthpassport/bptopRecord.controller'/>",{'memberid':memberid},function(oneData){
	 						
	            $.each(oneData,function(i,value){               
	         	var sysbp = value[0].maxbp;   	       			
	    		var diabp = value[0].minbp;
	    		var hb = value[0].hb;
	    		var result = value[0].rs;
	    		var time = value[0].t;   			
	    		$('#showBloodPressure').prepend(sysbp+'\/'+diabp);
		       	$('#showHeartBeat').prepend(hb);
		       	$('#showbpTime').prepend(time);
		       	$('#bpResult').prepend('<h4><small>'+'血壓結果 --> '+result+'</small></h4>');
	                })
	           });
	 		$.getJSON("<c:url value='/healthpassport/bstopRecord.controller'/>",{'memberid':memberid},function(data){
	 					 			
	 			$.each(data,function(i,value){
	 			 	
	 			$('#showBloodSugar').empty();
		 	    $('#bsResult').empty();		 	    
	         	$('#showBloodSugar').prepend(value[0].getbs);	    	      
	 	       	$('#showbsTime').prepend(value[0].t);
	 	       	$('#bsResult').prepend('<h4><small>'+'血糖結果 --> '+value[0].getbs+'\|'+value[0].getbsresult+'</small></h4>');
	 	       	$('#insert_bloodsugar').val("");				
				$('#bloodsugarMsg').empty();		
	 			})
	           });
			$('#calBMI').click(calBMI);
			function calBMI() {
			     try {
			         if ($('#insert_height').val() == "") { alert('請輸入身高'); return; }
			         if ($('#insert_weight').val() == "") { alert('請輸入體重'); return; }
			        	
			         weight = $('#insert_weight').val();
			         height = $('#insert_height').val() / 100;
			         BMI = Math.round((weight /Math.pow(height,2)) *100)/100;
			         $('#insert_bmi').val(Math.round(BMI * 100) / 100);
			         if(BMI<10 || BMI>=100 || isNaN(BMI)){
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
	                	
	                	$('#showHeight').empty();
			 	       	$('#showWeight').empty();
			 	       	$('#showTime').empty();
			 	       	$('#bmiResult').empty()
	                	$('#showHeight').prepend(data.hei);
		    	       	$('#showWeight').prepend(data.wei);
		    	       	$('#showTime').prepend(data.time);
		    	       	$('#bmiResult').prepend('<h4><small>'+'BMI --> '+data.bmi+'\|'+data.bmiresult+'</small></h4>');
		    	       	$('#insert_height').val("");
						$('#insert_weight').val("");
						$('#insert_bmi').val("");
						$('#heiMsg').empty();
						$('#weiMsg').empty();												
	             })	            
			});

			$('#bmiselect').click(bmitable());
			$('#miselect').click(bmiview());
			
//bmi載入會員記錄
			function bmitable(){
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
			};	

	//bmi圖表
	var dates=[];
    var datas=[];
 function bmiview(){
		$.getJSON('/TeleHealth/healthpassport/bmirecords.controller',{memberid:memberid},function(result){
			$.each(result.data,function(index,value) {
				var date = moment(value.createTime).format('MM/DD HH:mm');
				dates.push(date);
				var bmiresult = value.bmi;
				datas.push(bmiresult);
			});
			var ctx = $("#mychart1")
			var myChart = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: dates,
			        datasets: [{
			            label: '2018',
			            data: datas,
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            order:[dates,'desc'],
			            order:[datas,'desc'],
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
		});
			
 	 }
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
				if(systole==null || diastole==null || heartBeat==null){
					alert("三個欄位都要輸入")
					$('#insertBP').prop("disabled", true);
				}else{
				 $.get("<c:url value='/healthpassport/queryBloodPressure.controller' />",{'memberid':memberid,'systoleData':systole,'diastoleData':diastole,'heartBeatData': heartBeat}, function(data){
					 
					 	$('#showBloodPressure').empty();
				       	$('#showHeartBeat').empty();
				       	$('#showbpTime').empty();
				       	$('#bpResult').empty();
					 	$('#showBloodPressure').prepend(data.maxBloodPressure+'\/'+data.minBloodPressure);
				       	$('#showHeartBeat').prepend(data.heartBeat);
				       	$('#showbpTime').prepend(data.createTime);
				       	$('#bpResult').prepend('<h4><small>'+'血壓結果 --> '+data.result+'</small></h4>');
				    	$('#insert_systole').val("");
	                	$('#insert_diastole').val("");
	                	$('#insert_heartBeat').val("");
	                	$('#systoleMsg').empty();
	                	$('#diastoleMsg').empty();
	                	$('#heartBeatMsg').empty();
	                	
	             });                
	         }
			});
			$('#bpselect').click(bpTable());
			$('#bpselect').click(bpview());			
//血壓載入會員記錄
			function bpTable(){
				$('#bpTable').dataTable().fnDestroy(); 
				$('#bpTable').DataTable({
				    "ajax": '/TeleHealth/healthpassport/bloodPressureRecords.controller?memberid='+memberid,
				    "columns": [
				        { "data": "systole"},
				        { "data": "diastole"},
				        { "data": "heartBeat"},
				        { "data": "bpResult"},
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
			};	

//血壓圖表
	var bpdate=[];
    var sysdatas=[];
    var diadatas=[];
    var heartBeatdatas=[];
	 function bpview(){
		$.getJSON('/TeleHealth/healthpassport/bloodPressureRecords.controller',{memberid:memberid},function(result){
			$.each(result.data,function(index,value) {				
				var date = moment(value.createTime).format('MM/DD HH:mm');				
				bpdate.push(date);
				var systoleresult = value.systole;
				sysdatas.push(systoleresult);
				var diastoleresult = value.diastole;
				diadatas.push(diastoleresult);
				var heartBeatresult = value.heartBeat;
				heartBeatdatas.push(heartBeatresult);				
			});
			var ctx = $("#mychart2")
			var myChart = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: bpdate,
			        datasets: [{
			            label: '收縮壓',
			            data: sysdatas,
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            order:[dates,'desc'],

			            borderColor: [
			                'rgba(255,99,132,1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            borderWidth: 1
			        },{
			        	label: '舒張壓',
			            data: diadatas,
			            backgroundColor: [
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 159, 64, 1)'
			            ],
			            borderWidth: 1
			         },{
				        	label: '脈搏',
				            data: heartBeatdatas,
				            backgroundColor: [
				            	'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)'
				            ],
				            borderColor: [
				            	'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)'
				            ],
				            borderWidth: 1
				     },{	
				        type:'line',
				        label:'標準值',
				        data:[10, 20, 30]				        
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

		});
			
	 }


	<!--  血糖 -->
		$('#bsrecords').click(bstable());
		$('#bsrecords').click(bsview());

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
	               
	                $('#showBloodSugar').empty();
		 	       	$('#bsResult').empty();		 	    
                	$('#showBloodSugar').prepend(data.bloodSugar);	    	      
	    	       	$('#showbsTime').prepend(data.createTime);
	    	       	$('#bsResult').prepend('<h4><small>'+'BloodSugar --> '+data.bloodSugar+'\|'+data.result+'</small></h4>');
	    	       	$('#insert_bloodsugar').val("");				
					$('#bloodsugarMsg').empty(); 
					               
	             })	             
	             bsview();
	 			});	
			
//bs載入會員記錄
			function bstable(){
				$('#bsTable').dataTable().fnDestroy(); 
				$('#bsTable').DataTable({
				    "ajax": '/TeleHealth/healthpassport/bloodSugarRecords.controller?memberid='+memberid,
				    "columns": [				        
				        { "data": "bloodSugar" },
				        { "data": "bsResult" },
				        { "data": "createTime" }
				    ],
				    "order": [[ 2, 'desc' ]],
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
			};	
	//bs圖表
	var bsdates=[];
	var bsdatas=[];
function bsview(){	
		$.getJSON('/TeleHealth/healthpassport/bloodSugarRecords.controller',{memberid:memberid},function(result){
			
			$.each(result.data,function(index,value) {
				
				var date = moment(value.createTime).format('MM/DD HH:mm');
				bsdates.push(date);
				var bloodSugar = value.bloodSugar;
				bsdatas.push(bloodSugar);
			});			
		});
	  var ctx = $("#mychart3")
	  var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels: bsdates,
	        datasets: [{
	            label: '2018',
	            data: bsdatas,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            order:[dates,'desc'],
	            order:[datas,'desc'],
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
	 }
	});
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$("#bmiweek").on('click',function(){			
	$.getJSON('/TeleHealth/healthpassport/bmirecordsseven.controller',{memberid:memberid},function(datas){
		console.log(datas)
		var datesbmi=[];
		var datasbmi=[];
		var datasmax=[];
		var datasmin=[];			
		$.each(datas.data,function(i,value) {			
				var date = moment(value.createTime).format('MM/DD HH:mm');
				datesbmi.push(date);
				var bmiresult = value.bmi;
				datasbmi.push(bmiresult);
				var checkmax=24;
				var checkmin=18.5;
				datasmax.push(checkmax);
				datasmin.push(checkmin);				
			});
			$('#mychart1').remove(); 
			$('#mychart1div').append('<canvas id="mychart1" height="200" width="400"></canvas>');
			var ctx = $("#mychart1")								
			var myChart = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: datesbmi,
			        datasets: [{
			            label: '一星期測量圖',
			            data: datasbmi,
			            backgroundColor: [
			                'rgba(255, 99, 132, 0)',			             
			            ],
			            order:[datesbmi,'desc'],
			            order:[datasbmi,'desc'],
			            borderColor: [
			                '#32cd32',
			             
			            ],
			            borderWidth: 1
			        },{label: '以下過輕',
			            data: datasmin,
			            backgroundColor: [
			            	'rgba(255, 99, 132, 0)',
			                		                
			            ],
			            borderColor: [
			                '#0000cd'
			            ],
			            borderWidth: 1
				        },{label: '以上過重',
				            data: datasmax,
				            backgroundColor: [
				            	'rgba(54, 162, 235, 0)',				              
				            ],
				            borderColor: [
				            	'#ff0000',
				               
				            ],
				            borderWidth: 1}]
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


		})
});
$("#bmimonth").on('click',function(){
	var height=$('#showHeight').text();
	var weight=$('#showWeight').text();
	var ok=$('#bmiResult').text();
	var check=ok.split(" ");
	var data=check[2].split("|");
	var bmi=data[0];		
	$.getJSON('/TeleHealth/healthpassport/bmirecordsthirty.controller',{memberid:memberid},function(datas){		
		var datesbmi=[];
		var datasbmi=[];
		var datasmax=[];
		var datasmin=[];			
		$.each(datas.data,function(i,value) {			
				var date = moment(value.createTime).format('MM/DD HH:mm');
				datesbmi.push(date);
				var bmiresult = value.bmi;
				datasbmi.push(bmiresult);
				var checkmax=24;
				var checkmin=18.5;
				datasmax.push(checkmax);
				datasmin.push(checkmin);				
			});
			$('#mychart1').remove(); 
			$('#mychart1div').append('<canvas id="mychart1" height="200" width="400"></canvas>');
			var ctx = $("#mychart1")								
			var myChart = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: datesbmi,
			        datasets: [{
			            label: '一星期測量圖',
			            data: datasbmi,
			            backgroundColor: [
			                'rgba(255, 99, 132, 0)',
			               
			            ],
			            order:[datesbmi,'desc'],
			            order:[datasbmi,'desc'],
			            borderColor: [
			                '#32cd32',			              
			            ],
			            borderWidth: 1
			        },{label: '以下過輕',
			            data: datasmin,
			            backgroundColor: [
			            	'rgba(255, 99, 132, 0)',
			                			                
			            ],
			            borderColor: [
			                '#0000cd'
			            ],
			            borderWidth: 1
				        },{label: '以上過重',
				            data: datasmax,
				            backgroundColor: [
				            	'rgba(54, 162, 235, 0)',				                
				            ],
				            borderColor: [
				            	'#ff0000',				                
				            ],
				            borderWidth: 1}]
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

		})
});
$("#bmithreemonth").on('click',function(){		
	$.getJSON('/TeleHealth/healthpassport/bmirecordsthreemon.controller',{memberid:memberid},function(datas){
		var datesbmi=[];
		var datasbmi=[];
		var datasmax=[];
		var datasmin=[];			
		$.each(datas.data,function(i,value) {			
				var date = moment(value.createTime).format('MM/DD HH:mm');
				datesbmi.push(date);
				var bmiresult = value.bmi;
				datasbmi.push(bmiresult);
				var checkmax=24;
				var checkmin=18.5;
				datasmax.push(checkmax);
				datasmin.push(checkmin);				
			});
			$('#mychart1').remove(); 
			$('#mychart1div').append('<canvas id="mychart1" height="200" width="400"></canvas>');
			var ctx = $("#mychart1")								
			var myChart = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: datesbmi,
			        datasets: [{
			            label: '一星期測量圖',
			            data: datasbmi,
			            backgroundColor: [
			                'rgba(255, 99, 132, 0)',			              
			            ],
			            order:[datesbmi,'desc'],
			            order:[datasbmi,'desc'],
			            borderColor: [
			                '#32cd32',			               
			            ],
			            borderWidth: 1
			        },{label: '以下過輕',
			            data: datasmin,
			            backgroundColor: [
			            	'rgba(255, 99, 132, 0)',			                			                
			            ],
			            borderColor: [
			                '#0000cd'
			            ],
			            borderWidth: 1
				        },{label: '以上過重',
				            data: datasmax,
				            backgroundColor: [
				            	'rgba(54, 162, 235, 0)',				                
				            ],
				            borderColor: [
				            	'#ff0000',				              
				            ],
				            borderWidth: 1}]
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
		})
});
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////				     
// 血壓
var bpdate=[];
var sysdatas=[];
var diadatas=[];
var sysMeandatas=[];
var diaMeandatas=[];
var gender=$("#gender").val();
var dateyear=$("#realage").val();
var today = new Date();
var birthDate = new Date(dateyear);
var age = today.getFullYear() - birthDate.getFullYear();
var m = today.getMonth() - birthDate.getMonth();
if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
    age--;
}
$("#bpweek").on('click',function(){		
	$.getJSON('/TeleHealth//healthpassport/bloodPressureRecordsseven.controller',{memberid:memberid,gender:gender,age:age},function(result){
			$.each(result.data,function(index,value) {				
			var date = moment(value.createTime).format('MM/DD HH:mm');				
			bpdate.push(date);
			var systoleresult = value.systole;
			sysdatas.push(systoleresult);
			var diastoleresult = value.diastole;
			diadatas.push(diastoleresult);
			var systoleMean = ((parseInt(value.systolecheckmax)+parseInt(value.systolecheckmin))/2);			
			sysMeandatas.push(systoleMean);			
			var diastoleMean = ((parseInt(value.diastolecheckmax)+parseInt(value.diastolecheckmin))/2);
			diaMeandatas.push(diastoleMean);						
		});
		$('#mychart2').remove(); 
		$('#mychart2div').append('<canvas id="mychart2" height="200" width="400"></canvas>');
		var ctx = $("#mychart2")
		var myChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		        labels: bpdate,
		        datasets: [{
		            label: '收縮壓',
		            data: sysdatas,
		            backgroundColor: [
			            'rgba(255, 99, 132, 0)',		               
		            ],
		            order:[bpdate,'desc'],

		            borderColor: [		           
		                '#0000cd'
		            ],
		            borderWidth: 1
		        },{
		        	label: '舒張壓',
		            data: diadatas,
		            backgroundColor: [
		                'rgba(255, 159, 64,0)'
		            ],
		            borderColor: [
		                '#d2691e'
		            ],
		            borderWidth: 1
		         },{
			        	label: '收縮壓平均標準',
			            data: sysMeandatas,
			            backgroundColor: [
			            	'rgba(54, 162, 235, 0)',			                
			            ],
			            borderColor: [                
			                '#228b22'
			            ],
			            borderWidth: 1
			     },{	

			        	label: '舒張壓平均標準',
			            data: diaMeandatas,
			            backgroundColor: [
			            	'rgba(54, 162, 235, 0)',			                
			            ],
			            borderColor: [
				            '#c71585',			                
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
	$('#bpTable').dataTable().fnDestroy(); 
	$('#bpTable').DataTable({
		"ajax": '/TeleHealth/healthpassport/bloodPressureRecords.controller?memberid='+memberid,
		 "columns": [
		        { "data": "systole"},
		        { "data": "diastole"},
		        { "data": "heartBeat"},
		        { "data": "bpResult"},
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

	});	
});
$("#bpmonth").on('click',function(){		
	$.getJSON('/TeleHealth/healthpassport/bloodPressureRecordsseven.controller',{memberid:memberid,gender:gender,age:age},function(result){
			$.each(result.data,function(index,value) {				
			var date = moment(value.createTime).format('MM/DD HH:mm');				
			bpdate.push(date);
			var systoleresult = value.systole;
			sysdatas.push(systoleresult);
			var diastoleresult = value.diastole;
			diadatas.push(diastoleresult);
			var systoleMean = ((parseInt(value.systolecheckmax)+parseInt(value.systolecheckmin))/2);			
			sysMeandatas.push(systoleMean);			
			var diastoleMean = ((parseInt(value.diastolecheckmax)+parseInt(value.diastolecheckmin))/2);
			diaMeandatas.push(diastoleMean);						
		});
		$('#mychart2').remove(); 
		$('#mychart2div').append('<canvas id="mychart2" height="200" width="400"></canvas>');
		var ctx = $("#mychart2")
		var myChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		        labels: bpdate,
		        datasets: [{
		            label: '收縮壓',
		            data: sysdatas,
		            backgroundColor: [
			            'rgba(255, 99, 132, 0)',		               
		            ],
		            order:[bpdate,'desc'],
		            borderColor: [		           
		                '#0000cd'
		            ],
		            borderWidth: 1
		        },{
		        	label: '舒張壓',
		            data: diadatas,
		            backgroundColor: [
		                'rgba(255, 159, 64,0)'
		            ],
		            borderColor: [
		                '#d2691e'
		            ],
		            borderWidth: 1
		         },{
			        	label: '收縮壓平均標準',
			            data: sysMeandatas,
			            backgroundColor: [
			            	'rgba(54, 162, 235, 0)',			                
			            ],
			            borderColor: [                
			                '#228b22'
			            ],
			            borderWidth: 1
			     },{	

			        	label: '舒張壓平均標準',
			            data: diaMeandatas,
			            backgroundColor: [
			            	'rgba(54, 162, 235, 0)',			                
			            ],
			            borderColor: [
				            '#c71585',			                
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
	$('#bpTable').dataTable().fnDestroy(); 
	$('#bpTable').DataTable({
		"ajax": '/TeleHealth/healthpassport/bloodPressureRecords.controller?memberid='+memberid,
		 "columns": [
		        { "data": "systole"},
		        { "data": "diastole"},
		        { "data": "heartBeat"},
		        { "data": "bpResult"},
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

	});	
});
$("#bpthreemonth").on('click',function(){		
	$.getJSON('/TeleHealth/healthpassport/bloodPressureRecordsthreemon.controller',{memberid:memberid,gender:gender,age:age},function(result){
			$.each(result.data,function(index,value) {				
			var date = moment(value.createTime).format('MM/DD HH:mm');				
			bpdate.push(date);
			var systoleresult = value.systole;
			sysdatas.push(systoleresult);
			var diastoleresult = value.diastole;
			diadatas.push(diastoleresult);
			var systoleMean = ((parseInt(value.systolecheckmax)+parseInt(value.systolecheckmin))/2);			
			sysMeandatas.push(systoleMean);			
			var diastoleMean = ((parseInt(value.diastolecheckmax)+parseInt(value.diastolecheckmin))/2);
			diaMeandatas.push(diastoleMean);						
		});
		$('#mychart2').remove(); 
		$('#mychart2div').append('<canvas id="mychart2" height="200" width="400"></canvas>');
		var ctx = $("#mychart2")
		var myChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		        labels: bpdate,
		        datasets: [{
		            label: '收縮壓',
		            data: sysdatas,
		            backgroundColor: [
			            'rgba(255, 99, 132, 0)',		               
		            ],
		            order:[bpdate,'desc'],
		            borderColor: [		           
		                '#0000cd'
		            ],
		            borderWidth: 1
		        },{
		        	label: '舒張壓',
		            data: diadatas,
		            backgroundColor: [
		                'rgba(255, 159, 64,0)'
		            ],
		            borderColor: [
		                '#d2691e'
		            ],
		            borderWidth: 1
		         },{
			        	label: '收縮壓平均標準',
			            data: sysMeandatas,
			            backgroundColor: [
			            	'rgba(54, 162, 235, 0)',			                
			            ],
			            borderColor: [                
			                '#228b22'
			            ],
			            borderWidth: 1
			     },{	
			        	label: '舒張壓平均標準',
			            data: diaMeandatas,
			            backgroundColor: [
			            	'rgba(54, 162, 235, 0)',			                
			            ],
			            borderColor: [
				            '#c71585',			                
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
	$('#bpTable').dataTable().fnDestroy(); 
	$('#bpTable').DataTable({
		"ajax": '/TeleHealth/healthpassport/bloodPressureRecords.controller?memberid='+memberid,
		 "columns": [
		        { "data": "systole"},
		        { "data": "diastole"},
		        { "data": "heartBeat"},
		        { "data": "bpResult"},
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

	});	
});
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
//血糖
var bsdates=[];
var bsdatas=[];
var bsmaxdatas=[];
var bsmindatas=[];
$("#bsweek").on('click',function(){		
	$.getJSON('/TeleHealth/healthpassport/bloodSugarRecordsseven.controller',{memberid:memberid,gender:gender},function(result){		
		console.log(result);
		$.each(result.data,function(index,value) {			
			var date = moment(value.createTime).format('MM/DD HH:mm');
			bsdates.push(date);
			var bloodSugar = value.bloodSugar;
			bsdatas.push(bloodSugar);
			var bloodSugarmax = value.bloodSugarmax;
			bsmaxdatas.push(bloodSugarmax);
			var bloodSugarmin = value.bloodSugarmin;
			bsmindatas.push(bloodSugarmin);
		});
		$('#mychart3').remove(); 
		$('#mychart3div').append('<canvas id="mychart3" height="200" width="400"></canvas>');
		 var ctx = $("#mychart3")
		  var myChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		        labels: bsdates,
		        datasets: [{
		            label: '一星期',
		            data: bsdatas,
		            backgroundColor: [
		                'rgba(255, 99, 132, 0)',		                
		            ],
		            order:[bsdates,'desc'],
		            order:[bsdatas,'desc'],
		            borderColor: [
		                '#0000cd',		                
		            ],
		            borderWidth: 1
		        },{	
		        	label: '血糖標準最高',
		            data: bsmaxdatas,
		            backgroundColor: [
		            	'rgba(54, 162, 235, 0)',			                
		            ],
		            borderColor: [
			            '#ff0000',		                
		            ],
		            borderWidth: 1				        
		      },{	
		        	label: '血糖標準最低',
		            data: bsmindatas,
		            backgroundColor: [
		            	'rgba(54, 162, 235, 0)',			                
		            ],
		            borderColor: [
			            '#00ff00',		                
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
		$('#bsTable').dataTable().fnDestroy(); 
		$('#bsTable').DataTable({
		    "ajax": '/TeleHealth/healthpassport/bloodSugarRecords.controller?memberid='+memberid,
		    "columns": [				        
		        { "data": "bloodSugar" },
		        { "data": "bsResult" },
		        { "data": "createTime" }
		    ],
		    "order": [[ 2, 'desc' ]],
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
 		
});
$("#bsmonth").on('click',function(){		
	$.getJSON('/TeleHealth/healthpassport/bloodSugarRecordsthirty.controller',{memberid:memberid,gender:gender},function(result){		
		console.log(result);
		$.each(result.data,function(index,value) {			
			var date = moment(value.createTime).format('MM/DD HH:mm');
			bsdates.push(date);
			var bloodSugar = value.bloodSugar;
			bsdatas.push(bloodSugar);
			var bloodSugarmax = value.bloodSugarmax;
			bsmaxdatas.push(bloodSugarmax);
			var bloodSugarmin = value.bloodSugarmin;
			bsmindatas.push(bloodSugarmin);
		});
		$('#mychart3').remove(); 
		$('#mychart3div').append('<canvas id="mychart3" height="200" width="400"></canvas>');
		 var ctx = $("#mychart3")
		  var myChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		        labels: bsdates,
		        datasets: [{
		            label: '一個月',
		            data: bsdatas,
		            backgroundColor: [
		                'rgba(255, 99, 132, 0)',		                
		            ],
		            order:[bsdates,'desc'],
		            order:[bsdatas,'desc'],
		            borderColor: [
		                '#0000cd',		                
		            ],
		            borderWidth: 1
		        },{	
		        	label: '血糖標準最高',
		            data: bsmaxdatas,
		            backgroundColor: [
		            	'rgba(54, 162, 235, 0)',			                
		            ],
		            borderColor: [
			            '#ff0000',		                
		            ],
		            borderWidth: 1				        
		      },{	
		        	label: '血糖標準最低',
		            data: bsmindatas,
		            backgroundColor: [
		            	'rgba(54, 162, 235, 0)',			                
		            ],
		            borderColor: [
			            '#00ff00',		                
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
		$('#bsTable').dataTable().fnDestroy(); 
		$('#bsTable').DataTable({
		    "ajax": '/TeleHealth/healthpassport/bloodSugarRecords.controller?memberid='+memberid,
		    "columns": [				        
		        { "data": "bloodSugar" },
		        { "data": "bsResult" },
		        { "data": "createTime" }
		    ],
		    "order": [[ 2, 'desc' ]],
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
 		
});
$("#bsthreemonth").on('click',function(){		
	$.getJSON('/TeleHealth/healthpassport/bloodSugarRecordsthreemon.controller',{memberid:memberid,gender:gender},function(result){		
		console.log(result);
		$.each(result.data,function(index,value) {			
			var date = moment(value.createTime).format('MM/DD HH:mm');
			bsdates.push(date);
			var bloodSugar = value.bloodSugar;
			bsdatas.push(bloodSugar);
			var bloodSugarmax = value.bloodSugarmax;
			bsmaxdatas.push(bloodSugarmax);
			var bloodSugarmin = value.bloodSugarmin;
			bsmindatas.push(bloodSugarmin);
		});
		$('#mychart3').remove(); 
		$('#mychart3div').append('<canvas id="mychart3" height="200" width="400"></canvas>');
		 var ctx = $("#mychart3")
		  var myChart = new Chart(ctx, {
		    type: 'line',
		    data: {
		        labels: bsdates,
		        datasets: [{
		            label: '三個月',
		            data: bsdatas,
		            backgroundColor: [
		                'rgba(255, 99, 132, 0)',		                
		            ],
		            order:[bsdates,'desc'],
		            order:[bsdatas,'desc'],
		            borderColor: [
		                '#0000cd',		                
		            ],
		            borderWidth: 1
		        },{	
		        	label: '血糖標準最高',
		            data: bsmaxdatas,
		            backgroundColor: [
		            	'rgba(54, 162, 235, 0)',			                
		            ],
		            borderColor: [
			            '#ff0000',		                
		            ],
		            borderWidth: 1				        
		      },{	
		        	label: '血糖標準最低',
		            data: bsmindatas,
		            backgroundColor: [
		            	'rgba(54, 162, 235, 0)',			                
		            ],
		            borderColor: [
			            '#00ff00',		                
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
		$('#bsTable').dataTable().fnDestroy(); 
		$('#bsTable').DataTable({
		    "ajax": '/TeleHealth/healthpassport/bloodSugarRecords.controller?memberid='+memberid,
		    "columns": [				        
		        { "data": "bloodSugar" },
		        { "data": "bsResult" },
		        { "data": "createTime" }
		    ],
		    "order": [[ 2, 'desc' ]],
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
 		
});


	</script>

</body>
</html>