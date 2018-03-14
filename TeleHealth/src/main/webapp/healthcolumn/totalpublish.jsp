<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<link rel="stylesheet" type="text/css" href="/TeleHealth/css/fonts/fontstyle.css" />
</head>
<body>
<jsp:include page="/fragment/header.jsp"/>
<main role="main" class="container mt-2">
<div class="row">     	
	      <div class="card">
			<div class="card-header">所有會員發布文章  <input type="text" id="titlememname" placeholder="會員名稱" ><input type="button" value="搜尋" id="search" onclick="search()"><font id="erroeMsg" color="red" size="-1">${searcherrors.error}</font>
				<div class="card-body">
				<!-- 每頁不同的內容從這裡開始 -->
				   <table id="productTable" class="table table-bordered">
                       <thead>
                          <tr>
                          	 <th>會員名稱</th>
                          	 <th>文章標題:</th>                             
                             <th>日期</th>
                             <th>留言內容</th>                             
                             <th>管理</th>
                          </tr>
                       </thead>
                       <tbody>                       
                       </tbody>                                           
                   </table>
                   
				<!-- 每頁不同的內容到這裡結束 -->
			    </div>
		    </div>
		 </div>
     </div>	
	</main>
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
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
						console.log(datas);
		    			var doc=$(document.createDocumentFragment());			    		
			    		var tb = $('#productTable>tbody');
	 			        tb.empty();
			    	$.each(datas,function(i,mem){	
				    	console.log(mem)		    		
				    	var cell1=$('<td></td>')
				    	var ID=$('<p> id="columnId" name="columnId"</p>').text(mem[0]);		    		
						cell1.append(ID);
						var celldata=$("<p></p>").text(mem[1]);
			    		var article=$("<td></td>")
			    		article.append(celldata);			    		          	     	          
			    		var cell4=$('<td></td>').html(mem[3]);
			    		var cell3=$('<td></td>').text(mem[4]);	
			    		var cell5 = $('<td></td>').html('<button class="btn btn-danger" ><i class="fas fa-trash-alt" ></i></button> <button class="btn btn-info"><i class="fas fa-edit"></i></button>');
						var row=$('<tr></tr>').append([cell1,article, cell3, cell4,cell5]);
			    		doc.append(row);			    		
			    	})
			    	  tb.append(doc);
			    }) 
			      		
			} 
			     //刪除會員發表
			   $('#productTable>tbody').on('click','tr button:nth-child(1)',function(){
				   var check=confirm("你確定要刪除此筆資料?");
				   var title = $(this).parents('tr').find('td:nth-child(2)').text();					  
	 			   var Id = $(this).parents('tr').find('td:nth-child(4)').text();	 			  			  
	 			   if(check==true){
	 				  $.get('/TeleHealth/healthcolumn/deleteQAEmp.controller',{Id:Id,title:title},function(data){
		 				   alert("您已刪除所po的文");
		 				  loadall()
		 			   })		 			   
	 			   }else{
	 				  loadall();
		 		 }	 			 
			  })	    
	
		})
	function search(){
		 var memname=$("#titlememname").val().trim();
		 console.log(memname);
		 if(memname.length==0){
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
						if(datas="wrong"){
							$("#erroeMsg").text("查無此人!!");
						}
						var doc=$(document.createDocumentFragment());			    		
			    		var tb = $('#productTable>tbody');
	 			        tb.empty();
			    	$.each(datas,function(i,Mem){	
				    	console.log(Mem)		    		
				    	var cell1=$('<td></td>')
				    	var ID=$('<p> id="columnId" name="columnId"</p>').text(Mem[0]);			    		
						cell1.append(ID);
						var celldata=$("<p></p>").text(Mem[1]);
			    		var article=$("<td></td>")
			    		article.append(celldata);			    		          	     	          
			    		var cell4=$('<td></td>').html(Mem[3]);
			    		var cell3=$('<td></td>').text(Mem[4]);	
			    		var cell5 = $('<td></td>').html('<button class="btn btn-danger"><i class="fas fa-trash-alt" ></i></button> <button class="btn btn-info"><i class="fas fa-edit"></i></button>');
						var row=$('<tr></tr>').append([cell1,article, cell3, cell4,cell5]);
			    		doc.append(row);			    		
			    	})
					
			    	  tb.append(doc);
			    }) 
			      		
			} 	
		
	</script>
</body>
</html>