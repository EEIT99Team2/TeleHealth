<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>     
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="../fullCalendar/w3.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script src="../forCkeditor/ckeditor/ckeditor.js"></script>
<script src="../forCkeditor/ckfinder/ckfinder.js"></script>
<link rel="stylesheet" href="../forCkeditor/ckeditor/contents.css">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</head>
<body>
<main role="main" class="container mt-2">
<div class="row">     	
	      <div class="card">
			<div class="card-header">您發佈過的文章<span>${contenterrors.contenterror}${contentOK.contentok}</span>
				<div class="card-body">
				<!-- 每頁不同的內容從這裡開始 -->
				   <table id="productTable" class="table table-bordered">
                       <thead>
                          <tr>
                          	 <th>編號</th>
                             <th>內容</th>                             
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
<div class="modal fade" id="UnReserveItem" tabindex="-1" role="form" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="UnReserveItemTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form action="/TeleHealth/healthcolumn/updatehealthcolumn.controller" method="post" >
	<input type="text" name="name" id="title" value="d43b1906-f319-40dc-9e11-4da09a2558af"> 
    <textarea name="contenttext" id="contenttext" rows="10" cols="10"></textarea>       
	</form>      
    </div>
    <div class="modal-footer">
     <input type="submit" value='送出' onclick="return(confirm('確認要送出本表單嗎？'))">      
       <input type="reset" id="clean" value="清除重選" onclick='clean()' >
       <p style="color:green">${msgOK.uploadok}${errors.uploaderror}</p>
      </div>
    </div>
  </div>
</div>
	
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
	  var tg=[ {name:'basicstyles',groups:['basicstyles','cleanup']},
          {name:'paragraph',groups:['align']},{name:'styles'},{name:'colors'},
          ];
		$(document).ready(function() {
			 CKEDITOR.replace('contenttext',
				  {width:200, height:100,toolbarGroups:tg}								 	
		     );		    			
			loademp();			
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
			   //讀取員工發表
			   function loademp(empId){
			    $.getJSON('/TeleHealth/healthcolumn/QAEmpublish.controller',{empId:empId},function(datas){
						console.log(datas);
		    			var doc=$(document.createDocumentFragment());			    		
			    		var tb = $('#productTable>tbody');
	 			        tb.empty();
			    	$.each(datas,function(i,Emp){			    		
				    	var cell1=$('<td></td>')
				    	var ID=$('<input type="hidden" id="columnId" name="columnId"/>').text(Emp[0]);		    		
						cell1.append(ID);
						var celldata=$("<a href='article.jsp?title="+Emp[1]+"'"+"target='_blank'></a>").text("文章內容");
			    		var article=$("<td></td>")
			    		article.append(celldata);			    		          	     	          
			    		var cell4=$('<td></td>').text(Emp[2]);
			    		var cell3=$('<td></td>').text(Emp[3]);	
			    		var cell5 = $('<td></td>').html('<button class="btn btn-danger" ><i class="fas fa-trash-alt" ></i></button> <button class="btn btn-info"	><i class="fas fa-edit"></i></button>');
						var row=$('<tr></tr>').append([cell1,article, cell3, cell4,cell5]);
			    		doc.append(row);			    		
			    	})
			    	  tb.append(doc);
			    }) 
		      }			    
			     //刪除產品
			   $('#productTable>tbody').on('click','tr button:nth-child(1)',function(){
				   var check=confirm("你確定要刪除此筆資料?");
				   console.log(check);
	 			   var id = $(this).parents('tr').find('td:nth-child(1)').text();
	 			   console.log(id);
	 			   if(check==true){
	 				  $.post('/TeleHealth/healthcolumn/deletehealthcolumn.controller',{columnId:id,empId:empId},function(data){
		 				   alert("您已刪除所選的文章");
		 				   loadProduct("D43B1906-F319-40DC-9E11-4DA09A2558AF");
		 			   })		 			   
	 			   }else{
	 				  loadProduct("D43B1906-F319-40DC-9E11-4DA09A2558AF")
		 		 }
	 			 
			  })
			    
			    //修改產品
	 		   $('#productTable>tbody').on('click','tr button:nth-child(2)',function(){
	 			  $('#UnReserveItem').modal('show');	
	 			  var id = $(this).parents('tr').find('td:nth-child(2)').text();
	 			  console.log(id);
	 			 $.getJSON('/TeleHealth/healthcolumn/titlecontent.controller',{title:id},function(datas){
						console.log(datas);
		 				$.each(datas,function(i,product){	 				
	 					 CKEDITOR.instances.contenttext.setData(product[2]);	 					
	 					 $("#title1").val(product[0]);

		 				})	 
	 			  
	 					
	 		   })
			   		   
		})
		})
	</script>
<div id="iframeck"></div>		
</body>
</html>