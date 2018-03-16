var memberid=$('#memberId').val();
$("#bmiweek").on('click',function(){			
	$.getJSON('/TeleHealth/healthpassport/bmirecordsseven.controller',{memberid:memberid},function(datas){
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
