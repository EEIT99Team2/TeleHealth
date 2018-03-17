<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>     
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>牽伴遠距健康諮詢平台</title>
<link rel="stylesheet" href="<c:url value='/forCkeditor/ckeditor/contents.css'/>">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<link rel="stylesheet" type="text/css" href="/TeleHealth/css/fonts/fontstyle.css" />
</head>
<body>
<jsp:include page="/fragment/nav2.jsp" />
<script src="<c:url value='/forCkeditor/ckeditor/ckeditor.js'/>"></script>
<script src="<c:url value='/forCkeditor/ckfinder/ckfinder.js'/>"></script>
<ul
		class="nav nav-tabs justify-content-center w3-padding-large w3-card "
		id="myTab" role="tablist">

		<li class="nav-item"><input type="button" class="nav-link active"
			id="BOD" data-toggle="tab" role="tab" value="修改資料"
			onclick="location.href='ModifyData.jsp'" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="修改密碼"
			onclick="location.href='ChangePwd.jsp'" /></li>			
			<li class="nav-item"><input type="button" class="nav-link active"
			id="checkPoint" data-toggle="tab" role="tab" value="點數查詢" /></li>		
		<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="儲值紀錄"
			onclick="location.href='Point.jsp'" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="我的留言"
			onclick="location.href='questionMempublish.jsp'" /></li>
	</ul>
<br>	
<div class="container">
<div class="row col-12">     	
	      <div class="col-2"></div>
	      <div class="card col-8">
			<div class="card-header"><span>${LoginOK.memName}</span><input type="hidden" id="memId" value="${LoginOK.memberId}">您發佈過的文章<span>${contenterrors.contenterror}${contentOK.contentok}</span>
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
</div>
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
	<script src="../js/jquery-tablepage-1.0.js"></script>
	<script>
	  var memIdlogin=$('#memId').val();
	  var tg=[ {name:'basicstyles',groups:['basicstyles','cleanup']},
          {name:'paragraph',groups:['align']},{name:'styles'},{name:'colors'},
          ];
		$(document).ready(function() {			
			 CKEDITOR.replace('contenttext',
				  {width:400, height:200,toolbarGroups:tg}								 	
		     );		 
		    loadmember(memIdlogin)					
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
		   
			     //刪除會員發表
			   $('#productTable>tbody').on('click','tr button:nth-child(1)',function(){
				   var check=confirm("你確定要刪除此筆資料?");
				   var Memname=$('#title').text();
	 			   var Id = $(this).parents('tr').find('td:nth-child(1)').text();	 			  		  
	 			   if(check==true){
	 				  $.get('/TeleHealth/healthcolumn/deleteQAMem.controller',{Id:Id,memberId:Memname},function(data){
		 				   alert("您已刪除所po的文");
		 				  loadmember(memIdlogin);
		 			   })		 			   
	 			   }else{
	 				  loadmember(memIdlogin);
		 		 }
	 			 
			  })
			    
			    //修改文章灌入ck	    
	 		   $('#productTable>tbody').on('click','tr button:nth-child(2)',function(){
	 			  $('#UnReserveItem').modal('show');	
	 			  var Id = $(this).parents('tr').find('td:nth-child(1)').text();	 			  
	 			 $.getJSON('/TeleHealth/healthcolumn/QAupdateId.controller',{Id:Id},function(datas){						
		 				$.each(datas,function(i,QA){	 				
	 					 CKEDITOR.instances.contenttext.setData(QA[5]);
	 					 $('#questionId').val(QA[0]);	 								 
		 				}) 					
	 		   })
			   		   
		})	
		
		})
		 //讀取會員發表	
			   function loadmember(memId){		    			
				   $.getJSON('/TeleHealth/healthcolumn/QAMempublish.controller',{memId:memId},function(datas){
						var doc=$(document.createDocumentFragment());			    		
			    		var tb = $('#productTable>tbody');
	 			        tb.empty();
			    	$.each(datas,function(i,Mem){					    			    		
				    	var cell1=$('<td></td>')
				    	var ID=$('<input type="hidden" id="columnId" name="columnId"/>').text(Mem[0]);		    		
						cell1.append(ID);
						var celldata=$("<a href='/TeleHealth/healthcolumn/article.jsp?title="+Mem[8]+"&advisoryCode="+Mem[4]+"'"+"target='_blank'></a>").text("文章內容");
			    		var article=$("<td></td>")
			    		article.append(celldata);			    		          	     	          
			    		var cell4=$('<td></td>').html(Mem[5]);
			    		var cell3=$('<td></td>').text(Mem[6]);	
			    		var cell5 = $('<td></td>').html('<button class="btn btn-danger" ><i class="fas fa-trash-alt" ></i></button> <button class="btn btn-info"	><i class="fas fa-edit"></i></button>');
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
		$.getJSON("/TeleHealth/healthcolumn/updatememQA.controller", {questionId:questionId,contenttext:contenttext}, function(datas){
			if(datas="ok"){
				document.getElementById("reanswer").innerHTML=' ';   
				$("#reanswer").text("修改成功!!");
				loadmember(memIdlogin);				
			}else{
				document.getElementById("reanswer").innerHTML=' ';   
				$("#reanswer").text("修改失敗!!");}
			})
    	}
	   }
		$('#clean').on('click',function(){
			CKEDITOR.instances.contenttext.setData(' ');
			});
	</script>
<div id="iframeck"></div>		
</body>
</html>