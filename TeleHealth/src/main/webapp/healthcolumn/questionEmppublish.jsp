<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>     
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的留言</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/TeleHealth/css/fonts/fontstyle.css" />
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="/fragment/nav2.jsp" />
<script src="../forCkeditor/ckeditor/ckeditor.js"></script>
<script src="../forCkeditor/ckfinder/ckfinder.js"></script>
<div class="container">
<div class="row col-12">
	      <div class="card col-12">
			<div class="card-header"><span>${empLoginOK.empName}</span><input type="hidden" id="empId" value="${empLoginOK.empId}">您發佈過的文章<span>${contenterrors.contenterror}${contentOK.contentok}</span>
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
                    <span id='table_page'></span>		  
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
      	<form>	
		<input type="hidden" name="questionId" id="questionId" >
    	<textarea name="contenttext" id="contenttext" rows="10" cols="10"></textarea>       
		<div class="modal-footer">
     	<input type="button" value='送出' onclick=postdata()>      
      	 <input type="reset" id="clean" value="清除"  >
       		<font id="reanswer" color="green" size="-1"></font><font id="reanswererror" color="red" size="-1"></font>
        </div>
		 </form>      
    	  </div>
      </div>
    </div>
  </div>
</div>	
	<script src="<c:url value='/js/jquery-tablepage-1.0.js'/>"></script>
	<script>
	var empIdlogin=$('#empId').val();		
	  var tg=[ {name:'basicstyles',groups:['basicstyles','cleanup']},
          {name:'paragraph',groups:['align']},{name:'styles'},{name:'colors'},
          ];
		$(document).ready(function() {						
			 CKEDITOR.replace('contenttext',
				  {width:400, height:200,toolbarGroups:tg}								 	
		     );				

			    loademp(empIdlogin);			
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
			  
			     //刪除員工發表
			   $('#productTable>tbody').on('click','tr button:nth-child(1)',function(){
				   var empIdlogin=$('#empId').val();		
				   var check=confirm("你確定要刪除此筆資料?");				   
	 			   var Id = $(this).parents('tr').find('td:nth-child(1)').text();	 			   
	 			   if(check==true){
	 				  $.get("<c:url value='/healthcolumn/deleteQAEmp.controller'/>",{Id:Id,EmpId:empIdlogin},function(data){
		 				   alert("您已刪除所po的文");
		 				  loademp(empIdlogin);
		 			   })		 			   
	 			   }else{
	 				  loademp(empIdlogin);
		 		 }
	 			 
			  })
			    
			    //修改CK
	 		   $('#productTable>tbody').on('click','tr button:nth-child(2)',function(){
	 			  document.getElementById("reanswer").innerHTML=' ';
	 			  document.getElementById("reanswererror").innerHTML=' '; 	
	 			  $('#UnReserveItem').modal('show');	
	 			  var Id = $(this).parents('tr').find('td:nth-child(1)').text();
	 			  $.getJSON("<c:url value='/healthcolumn/QAupdateId.controller'/>",{Id:Id},function(datas){
						$.each(datas,function(i,QA){	 				
	 					 CKEDITOR.instances.contenttext.setData(QA[5]); 
	 					 $('#questionId').val(QA[0]);						
		 				})	  
	 					
	 		   })
			   		   
		})
		})
		 //讀取員工發表
			   function loademp(empId){
				   $.getJSON("<c:url value='/healthcolumn/QAEmpublish.controller'/>",{empId:empId},function(datas){
					   console.log(datas)
						var doc=$(document.createDocumentFragment());			    		
			    		var tb = $('#productTable>tbody');
	 			        tb.empty();
			    	$.each(datas,function(i,Emp){	
				    	var cell1=$('<td></td>')
				    	var ID=$('<input type="hidden" id="columnId" name="columnId"/>').text(Emp[0]);		    		
						cell1.append(ID);
						var celldata=$("<a href='article.jsp?title="+Emp[8]+"&advisoryCode="+Emp[4]+"'"+"target='_blank'></a>").text("文章內容");
			    		var article=$("<td></td>")
			    		article.append(celldata);			    		          	     	          
			    		var cell4=$('<td></td>').html(Emp[5]);
			    		var cell3=$('<td></td>').text(Emp[6]);	
			    		var cell5 = $('<td></td>').html('<button class="btn btn-danger" ><i class="fas fa-trash-alt" ></i></button> <button class="btn btn-info"><i class="fas fa-edit"></i></button>');
						var row=$('<tr></tr>').append([cell1,article, cell3, cell4,cell5]);
			    		doc.append(row);			    		
			    	})
			    	  tb.append(doc);
			    	$("#productTable").tablepage($("#table_page"), 5); 
			    }) 
			      		
			} 
		
		function postdata(){
				
			var questionId=$("#questionId").val();			
			var contenttext=CKEDITOR.instances.contenttext.getData();
			if(contenttext==null|| contenttext.length==0){
	    		document.getElementById("reanswer").innerHTML=' ';    		
	    		document.getElementById("reanswererror").innerHTML='內容不能空白';		
	    	}else{ 						
			$.getJSON("<c:url value='/healthcolumn/updatememQA.controller'/>", {questionId:questionId,contenttext:contenttext}, function(datas){
				if(datas="ok"){
					document.getElementById("reanswer").innerHTML=' ';					 
		 			document.getElementById("reanswererror").innerHTML=' '; 	  
					$("#reanswer").text("修改成功!!");
					loademp(empIdlogin);				
				}else{
					document.getElementById("reanswer").innerHTML=' ';					 
		 			document.getElementById("reanswererror").innerHTML=' ';   
					$("#reanswer").text("修改失敗!!");}
				})
	    	}
		   }
	$('#clean').on('click',function(){
			CKEDITOR.instances.contenttext.setData(' ');
			});
			
	</script>
</body>
</html>