<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<main role="main" class="container mt-2">
	<div class="row">
	<div class="col-2"></div>
		<div class="card" style="margin-top:80px;">
			<div class="card-header">
				所有會員發布文章 <input type="text" id="titlememname" placeholder="會員名稱"><input
					type="button" value="搜尋" id="search" onclick="search()"><font
					id="erroeMsg" color="red" size="-1">${searcherrors.error}</font>
				<div class="card-body">
					<!-- 每頁不同的內容從這裡開始 -->
					<table id="productTable" class="table table-bordered">
						<thead>
							<tr>
								<th>會員名稱</th>
								<th>文章編號</th>
								<th>文章標題:</th>
								<th>日期</th>
								<th>留言內容</th>
								<th>管理</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					 <span id='table_page'></span>	
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
	</main>
	<script src="../js/jquery-tablepage-1.0.js"></script>
	<script>
	$(document).ready(function() {
			loadall();
		  $('#productTable>tbody').on('click','tr>td>button:nth-child(1)',function(){
					$(this).parents('tr').remove();
				})
			  $('#productTable>tbody').on('click','tr>td>button:nth-child(2)',function(){
				    var value1=($(this).parents('tr').children('td:nth-child(1)').text());				    
					var value2=($(this).parents('tr').children('td:nth-child(2)').text());										
					var value3=($(this).parents('tr').children('td:nth-child(3)').text());
					var value4=($(this).parents('tr').children('td:nth-child(4)').text());
					$('#columnId').val(value1);
					$('#columnTitle').val(value2);					
					$('#count').val(value3);
					$('#date').val(value4);
					
			   })
			   //讀取所有會員發表
			   function loadall(){
				   $.getJSON('/TeleHealth/healthcolumn/allmempublish.controller',{ },function(datas){					 
						var doc=$(document.createDocumentFragment());			    		
			    		var tb = $('#productTable>tbody');
	 			        tb.empty();
			    	$.each(datas,function(i,mem){				    		    		
				    	var cell1=$('<td></td>');
				    	var titleID=$('<td id="titleId"></td>').text(mem[5]);
				    	var ID=$('<p> id="columnId" name="columnId"</p>').text(mem[0]);		    		
						cell1.append(ID);
						var celldata=$("<p></p>").text(mem[1]);
			    		var article=$("<td></td>")
			    		article.append(celldata);			    		          	     	          
			    		var cell4=$('<td></td>').html(mem[3]);
			    		var cell3=$('<td></td>').text(mem[4]);	
			    		var cell5 = $('<td></td>').html('<button class="btn btn-danger" ><i class="fas fa-trash-alt" ></i></button>');
						var row=$('<tr></tr>').append([cell1,titleID,article, cell3, cell4,cell5]);
			    		doc.append(row);			    		
			    	})
			    	  tb.append(doc);
			    	$("#productTable").tablepage($("#table_page"), 5); 
			    }) 
			      		
			} 
			     //刪除會員發表
			   $('#productTable>tbody').on('click','tr button:nth-child(1)',function(){
				   var check=confirm("你確定要刪除此筆資料?");
				   var title = $(this).parents('tr').find('td:nth-child(2)').text();				   					  
	 			   var Id = $(this).parents('tr').find('td:nth-child(4)').text();	 			  			  
	 			   if(check==true){
	 				  $.getJSON('/TeleHealth/healthcolumn/deleteQAmemonepublish.controller',{Id:title},function(data){
						if(data=="OK"){
		 				  alert("您已刪除所po的文");
		 				  loadall();
						}else{
							alert("刪除失敗!!");
							loadall();
							}
			 			   })		 			   
	 			   }else{
	 				  loadall();
		 		 }	 			 
			  })	    
	
		})
	function search(){
		 var memname=$("#titlememname").val().trim();		 
		 if(memname==null || memname == undefined || memname ==""){
				$("#erroeMsg").text("不能搜尋空白");
				$('#productTable>tbody').empty();	  
			 }else
				 {
				 	loadmember(memname);
				 }
		}
	
	  function loadmember(memname){
		  		$('#productTable>tbody').empty();	  
				   $.getJSON('/TeleHealth/healthcolumn/QAMemonepublish.controller',{memname:memname},function(datas){
						if(datas=="wrong"){
							$("#erroeMsg").text("查無此人!!");
						}else{
							$("#erroeMsg").text("");
						var doc=$(document.createDocumentFragment());			    		
			    		var tb = $('#productTable>tbody');
	 			        tb.empty();
			    	$.each(datas,function(i,Mem){				    	    		
				    	var cell1=$('<td></td>')
				    	var titleID=$('<td id="titleId"></td>').text(mem[5]);
				    	var ID=$('<p> id="columnId" name="columnId"</p>').text(Mem[0]);			    		
						cell1.append(ID);
						var celldata=$("<p></p>").text(Mem[1]);
			    		var article=$("<td></td>")
			    		article.append(celldata);			    		          	     	          
			    		var cell4=$('<td></td>').html(Mem[3]);
			    		var cell3=$('<td></td>').text(Mem[4]);	
			    		var cell5 = $('<td></td>').html('<button class="btn btn-danger"><i class="fas fa-trash-alt" ></i></button> <button class="btn btn-info"><i class="fas fa-edit"></i></button>');
						var row=$('<tr></tr>').append([cell1,titleID,article, cell3, cell4,cell5]);
			    		doc.append(row);			    		
			    	})					
			    	  tb.append(doc);
							}
			    }) 			      		
			} 	
		
	</script>