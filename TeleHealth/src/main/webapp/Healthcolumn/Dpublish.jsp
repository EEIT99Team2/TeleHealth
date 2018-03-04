<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<main role="main" class="container mt-2">
    <div class="row">
       <div class="col-lg-3">
       
       <div class="col-lg-9">
     
		<div class="card">
			<div class="card-header">jQuery 練習</div>
			<div class="card-body">
				<!-- 每頁不同的內容從這裡開始 -->
				 <table id="productTable" class="table table-bordered">
                       <thead>
                          <tr>
                             <th>標題</th>
                             <th>內容</th>
                             <th>日期</th>
                             <th>點擊量</th>
                             <th>管理</th>
                          </tr>
                       </thead>
                   
                       <tfoot>
                       <tr>
                       <form name="myForm">
                        <td><input type="hidden" id="title" name="title"><span></span></td>
                        <td><input type="text" class="form-control" id="content" name="content" placeholder="內容"></td>
                        <td><input type="text" style="width:100px" class="form-control" id="date" name="date" placeholder="日期"></td>
                        <td><input type="text" style="width:100px" class="form-control" id="UnitsInStock" name="UnitsInStock" placeholder="庫存量"></td>
                        <td><button id="buttonAdd" type="button" class="btn btn-primary"><i class="fas fa-plus"></i></button>
                          <button id="buttonUpdate" type="button" class="btn btn-success"><i class="fas fa-pencil-alt"></i></button></td>
                       </tr>
                       </form>
                       </tfoot>
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
//			  $('#productTable>tbody').on('click','tr>td>button:nth-child(1)',function(){
// 					$(this).parents('tr').remove();
// 				})
// 			  $('#productTable>tbody').on('click','tr>td>button:nth-child(2)',function(){
// 					var value1=($(this).parents('tr').children('td:nth-child(1)').text());
// 					var value2=($(this).parents('tr').children('td:nth-child(2)').text());
// 					var value3=($(this).parents('tr').children('td:nth-child(3)').text());
// 					var value4=($(this).parents('tr').children('td:nth-child(4)').text());
// 					$('#ProductID').val(value1);
// 					$('#ProductName').val(value2);
// 					$('#UnitPrice').val(value3);
// 					$('#UnitsInStock').val(value4);
				
// 			   })  			   
			    //讀取產品
			   function loadProduct(id){
			    $.getJSON('Products',{'categoryID':id},function(datas){
			    		var doc=$(document.createDocumentFragment());
			    		var tb = $('#productTable>tbody');
	 			        tb.empty();
			    	$.each(datas,function(idx,product){
			    		var cell1=$('<td></td>').text(product.ProductID);
			    		var cell2=$('<td></td>').text(product.ProductName);
			    		var cell3=$('<td></td>').text(product.UnitPrice);
			    		var cell4=$('<td></td>').text(product.UnitsInStock);	
			    		var cell5 = $('<td></td>').html('<button class="btn btn-danger"><i class="fas fa-trash-alt"></i></button> <button class="btn btn-info"><i class="fas fa-edit"></i></button>');
			    		var row=$('<tr></tr>').append([cell1, cell2, cell3, cell4,cell5]);
			    		doc.append(row);
			    	})
			    	  tb.append(doc);
			    })
			    	
			    	
			    	
			    	
			    	
			    	
			    	
// 	 		    	 $.getJSON('Products', { 'categoryID': id }, function (datas) {			          
// 	 			           var docFrag = $(document.createDocumentFragment());
// 	 			           var tb = $('#productTable>tbody');
// 	 			           tb.empty();
// 	 			           $.each(datas, function (idx,product) {
// 	 			               var cell1 = $('<td></td>').text(product.ProductID);
// 	 			               var cell2 = $('<td></td>').text(product.ProductName);
// 	 			               var cell3 = $('<td></td>').text(product.UnitPrice);
// 	 			               var cell4 = $('<td></td>').text(product.UnitsInStock);
// 	 			               var cell5 = $('<td></td>').html('<button class="btn btn-danger"><i class="fas fa-trash-alt"></i></button> <button class="btn btn-info"><i class="fas fa-edit"></i></button>');

// 	 			               var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4,cell5]);
// 	 			               docFrag.append(row);
// 	 			           })
// 	 			           tb.append(docFrag);
// 	 			       })	   
			   }			   
			    
			     //刪除產品
			   $('#productTable>tbody').on('click','tr button:nth-child(1)',function(){
	 			   var id = $(this).parents('tr').find('td:nth-child(1)').text();
	 			   $.get('ProductsDelete',{ProductID:id},function(data){
	 				   alert(data);
	 				   loadProduct(1);
	 			   })
			  })
			    
			    //修改產品
	 		   $('#productTable>tbody').on('click','tr button:nth-child(2)',function(){
	 			   var ProductID = $(this).parents('tr').find('td:nth-child(1)').text();
	 			   var ProductName = $(this).parents('tr').find('td:nth-child(2)').text();
	 			   var UnitPrice = $(this).parents('tr').find('td:nth-child(3)').text();
	 			   var UnitsInStock = $(this).parents('tr').find('td:nth-child(4)').text();
				  
	 			   $('#ProductID').val(ProductID).next('span').text(ProductID);
	 			   $('#ProductName').val(ProductName);
	 			   $('#UnitPrice').val(UnitPrice);
	 			   $('#UnitsInStock').val(UnitsInStock);
	 		   })
			   
			   
			   //更新產品
			   $('#buttonUpdate').click(function(){  
	 			   var datas = $('form[name="myForm"]').serialize();
	 		    	$.post('ProductsUpdate',datas,function(data){
	 		    		alert(data);
	 		    		loadProduct(1);
	 		    		 $('#ProductID').val('').next('span').text('');
	 					   $('#ProductName').val('');
	 					   $('#UnitPrice').val('');
	 					   $('#UnitsInStock').val('');
	 		    	});
			   });
		})
	</script>
</body>
</html>