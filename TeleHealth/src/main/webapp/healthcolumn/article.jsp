<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>     
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文章</title>
<style type="text/css">
.contenttype{
background-color: #CCEEFF;
width: 500px;
}
.contenttypedoctor{
background-color: #FFAA33;
width: 500px;
}
.imgsize{
width:32px;
hieght:32px; 
}
c:
</style>
</head>
<body>
    <jsp:include page="/fragment/nav2.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="<c:url value='/forCkeditor/ckeditor/ckeditor.js'/>"></script>
	<script src="<c:url value='/forCkeditor/ckfinder/ckfinder.js'/>"></script>

     <main>
    <!-- Page Content -->
    <div class="container">
      <div class="row justify-content-md-center">       
        <div class="col-lg-10" id='body'>            
     </div>
     <div class="col-lg-10" id='QAcontent'> 
     </div>   
     <c:if test="${not empty LoginOK}">           
      <div class="col-lg-10" id='foot'>  
      <h5 class="card-header">留言:</h5><h5 size="-1" color="#FF0000" id="errorMsg"></h5>
      	<div class="form-group">
      		<form id="Msg" >
      		<input type="hidden" id="advisorycode" name="advisorycode" >
      		<input type="hidden" id="title" name="title" >
      		<input type="hidden" id="MemId"name="MemId" value="${LoginOK.memberId}">
      		<textarea class="form-control" id="textt" name="textmem" rows="3"></textarea>
      		<input type="button" value="送出" onclick=insert()><input type='button' id='clean' value='清除'><font id="successMsg" color="green" size="-1"></font><font id="erroeMsg" color="red" size="-1"></font>
      		</form>      	
      	</div>      
      </div>
     </c:if>     
        <c:if test="${not empty empLoginOK}">
          <div class="col-lg-10" id='foot'>  
      <h5 class="card-header">留言:</h5><h5 size="-1" color="#FF0000" id="errorMsg"></h5>
      	<div class="form-group">
      		<form id="Msg"  >
      		<input type="hidden" id="advisorycode" name="advisorycode" >
      		<input type="hidden" id="title" name="title" >
      		<input type="hidden" id="empId"name="empId" value="${empLoginOK.empId}">
      		<textarea class="form-control" id="textt" name="textemp" rows="3"></textarea>
      		<input type="button" value="送出" onclick=insertemp()><input type='button' id='clean' value='清除'><font id="successMsg" color="green" size="-1"></font><font id="erroeMsg" color="red" size="-1"></font>
      		</form>      	
      	</div>      
      </div>
     </c:if>
    </div>                                                                                                                 
 </div>
 </main>
 <jsp:include page="/fragment/footer.jsp" />
   
<script type="text/javascript">
$(document).ready(function() {     
	 var tg=[ {name:'basicstyles',groups:['basicstyles','cleanup']},
         {name:'paragraph',groups:['align']},{name:'styles'},
         {name:'colors'},];
		var url = location.href;
	    var ary1 = url.split('?');	   
	    var ary2 = ary1[1].split('=');
	    var aryid=ary2[1].split('&');	    		       
		var title = aryid[0];		
		var titleok=$('#title').val(title);    
	    var atype=ary2[2];
	    var adok=$('#advisorycode').val(atype); 		
		CKEDITOR.replace('textt',
				 {width:800, height:100,toolbarGroups:tg})
		$('#clean').on('click',function(){
				CKEDITOR.instances.textt.setData(' ');
				})		 
  		 
		});
	var url = location.href;
	var ary1 = url.split('?');	
	var ary2 = ary1[1].split('=');
	var type=ary2[2];	
	var ary3=ary2[1].split('&');			       
	var id = ary3[0];	   
    var titledecode= decodeURIComponent(id);   	  
    $.getJSON("<c:url value='/healthcolumn/titlecontent.controller'/>", {title:titledecode}, function (data){		
		 $.each(data, function (i, data) {			
			if(data[5]!="VID"){  
        	var cell0=$("<hr>")      	     	          
            var cell1= $("<h1 class='mt-4'></h1>").text(data[0]);
            var cell2= $("<p class='lead'></p>").text("by  "+data[1]);
            var cell3=$("<p></p>").text(data[3]); 
            var cell4= $("<p class='lead'></p>").html(data[2]);                          
            var row = $(' <div class="col-lg-10" id="data"></div>').append([cell1,cell0,cell2,cell3,cell0,cell4]);
             $('#body').append(row);
			}else
			{
				var cell0=$("<hr>")      	     	          
	            var cell1= $("<h1 class='mt-4'></h1>").text(data[0]);
	            var cell2= $("<p class='lead'></p>").text("by  "+data[1]);
	            var cell3=$("<p></p>").text(data[3]);
	            var video=$( '<video controls crossorigin="anonymous" width="600" height="500" controls><source src="https://localhost:8443/TeleHealth/video/'+decodeURIComponent(data[4])+'" type="video/mp4"></video>')
	            var cell4= $("<p class='lead'></p>").html(data[2]);                          
	            var row = $(' <div class="col-lg-10" id="data"></div>').append([cell1,cell0,cell2,cell3,video,cell0,cell4]);
	             $('#body').append(row);
			}	
         });        
 	});   
    $.getJSON("<c:url value='/healthcolumn/QAcontent.controller'/>", {title:titledecode}, function (data){    
        console.log(data);           
    	var doc=$(document.createDocumentFragment());   	
    	var div=$('<div class="col-lg-10" ></div>');
    	 $.each(data, function (i, data) {         	          	 
        	 if(data[0]==null){
         		 var memberimg=$("<img src='/TeleHealth/getimagebyid.controller?id="+data[3] +"' class='imgsize'/>") 
        		 var cellauthor= $("<h6 class='mt-0'></h6>").text("會員:"+data[1]); 
        		 cellauthor.prepend(memberimg);       		 
        		 var cellcontent=$("<p></p>").html(data[4]);
        		 if (data[6]==null){
        			 var celldate=$("<small></small>").text(data[5]);
            	}else{
                	var celldate=$("<small></small>").text(data[6]);
                	}	
          		 var row2=$("<div class='media-body contenttype' ></div>").append([cellauthor,celldate,cellcontent]);
          		doc.append(row2);          		        		         		       		      		
            	 }else{
                var cellauthor= $("<h5 class='mt-0'></h5>").text("牽絆:"+data[0]);      	 
            	var empimg=$("<img src='/TeleHealth/getimagebyid.controller?id="+data[9] +"' class='imgsize'/>")
            	cellauthor.prepend(empimg);             	      	
            	var cellcontent=$("<p></p>").html(data[4]);	         		
            	if (data[6]==null){
       			 var celldate=$("<small></small>").text(data[5]);
           		}else{
               	var celldate=$("<small></small>").text(data[6]);
               	}	
         		var row2=$("<div class='media-body contenttypedoctor'></div>").append([cellauthor,celldate,cellcontent]); 
         		doc.append(row2);          	             	            	
               }    	
       	}); 	
    	 $('#QAcontent').append(doc);               
     })
     function insert(){
    	var content= CKEDITOR.instances.textt.getData()    	
    	if(content==null|| content.length==0){
    		document.getElementById("erroeMsg").innerHTML=' ';
    		document.getElementById("successMsg").innerHTML=' ';
    		document.getElementById("erroeMsg").innerHTML='內容不能空白';		
    	}else{ 	
    	var url = location.href;
	    var ary1 = url.split('?');	   
	    var ary2 = ary1[1].split('=');
	    var aryid=ary2[1].split('&');	    		       
		var title = aryid[0];		    
	    var atype=ary2[2];	    
	    var MemId=$("#MemId").val();	    
	    var content= CKEDITOR.instances.textt.getData();
        $.getJSON("<c:url value='/healthcolumn/insQA.controller'/>",{advisorycode:atype,title:title,MemId:MemId,textmem:content},function(datas){
			if(datas=="ok"){
				$("#QAcontent").empty();
			 $.getJSON('/TeleHealth/healthcolumn/QAcontent.controller', {title:titledecode}, function (data){               
			    	var doc=$(document.createDocumentFragment());   	
			    	var div=$('<div class="col-lg-10"></div>');
			    	 $.each(data, function (i, data) {          	 
			        	 if(data[0]==null){
			        		 var cellauthor= $("<h6 class='mt-0'></h6>").text("會員:"+data[1]); 
			        		 var cellcontent=$("<p class='typecon'></p>").html(data[2]);
			        		 if (data[4]==null){
			        			 var celldate=$("<h6></h6>").text(data[3]);
			            	}else{
			                	var celldate=$("<h6></h6>").text(data[4]);
			                	}	
			          		 var row2=$("<div class='media-body contenttype' ></div>").append([cellauthor,celldate,cellcontent]);
			          		doc.append(row2);          		        		         		       		      		
			            	 }else{
			            	var cellauthor= $("<h6 class='mt-0'></h6>").text("牽絆:"+data[0]);
			            	var cellcontent=$("<p></p>").html(data[2]);	         		
			            	if (data[4]==null){
			       			 var celldate=$("<h6></h6>").text(data[3]);
			           		}else{
			               	var celldate=$("<h6></h6>").text(data[4]);
			               	}	
			         		var row2=$("<div class='media-body contenttypedoctor' style='border-style:dashed'></div>").append([cellauthor,celldate,cellcontent]); 
			         		doc.append(row2);          	             	            	
			               }    	
			       	}); 	
			    	 $('#QAcontent').append(doc);
			    	 document.getElementById("erroeMsg").innerHTML=' ';
			    	 document.getElementById("successMsg").innerHTML=' ';
			    	 $("#successMsg").text("po文成功"); 
			    	 window.location.reload();              
			     })
			}else{
				document.getElementById("erroeMsg").innerHTML=' ';
	    		document.getElementById("successMsg").innerHTML=' ';
				$("#erroeMsg").text("po文失敗");
				}
            });
   }
    }  
    function insertemp(){
    	var content= CKEDITOR.instances.textt.getData()    	
    	if(content==null|| content.length==0){
    		document.getElementById("erroeMsg").innerHTML=' ';
    		document.getElementById("successMsg").innerHTML=' ';
    		document.getElementById("erroeMsg").innerHTML='內容不能空白';		
    	}else{ 	
    	var url = location.href;
	    var ary1 = url.split('?');	   
	    var ary2 = ary1[1].split('=');
	    var aryid=ary2[1].split('&');	    		       
		var title = aryid[0];		    
	    var atype=ary2[2];	    
	    var MemId=$("#empId").val();	    
	    var content= CKEDITOR.instances.textt.getData();
	    console.log(content);
        $.getJSON("<c:url value='/healthcolumn/insQAdoctor.controller'/>",{advisorycode:atype,title:title,empId:empId,textemp:content},function(datas){
			if(datas=="ok"){
				$("#QAcontent").empty();
			 $.getJSON('/TeleHealth/healthcolumn/QAcontent.controller', {title:titledecode}, function (data){               
			    	var doc=$(document.createDocumentFragment());   	
			    	var div=$('<div class="col-lg-10"></div>');
			    	 $.each(data, function (i, data) {          	 
			        	 if(data[0]==null){
			        		 var cellauthor= $("<h6 class='mt-0'></h6>").text("會員:"+data[1]); 
			        		 var cellcontent=$("<p class='typecon'></p>").html(data[2]);
			        		 if (data[4]==null){
			        			 var celldate=$("<h6></h6>").text(data[3]);
			            	}else{
			                	var celldate=$("<h6></h6>").text(data[4]);
			                	}	
			          		 var row2=$("<div class='media-body contenttype' ></div>").append([cellauthor,celldate,cellcontent]);
			          		doc.append(row2);          		        		         		       		      		
			            	 }else{
			            	var cellauthor= $("<h6 class='mt-0'></h6>").text("牽絆:"+data[0]);
			            	var cellcontent=$("<p></p>").html(data[2]);	         		
			            	if (data[4]==null){
			       			 var celldate=$("<h6></h6>").text(data[3]);
			           		}else{
			               	var celldate=$("<h6></h6>").text(data[4]);
			               	}	
			         		var row2=$("<div class='media-body contenttypedoctor' style='border-style:dashed'></div>").append([cellauthor,celldate,cellcontent]); 
			         		doc.append(row2);          	             	            	
			               }    	
			       	}); 	
			    	 $('#QAcontent').append(doc);
			    	 document.getElementById("erroeMsg").innerHTML=' ';
			    	 document.getElementById("successMsg").innerHTML=' ';
			    	 $("#successMsg").text("po文成功"); 
			    	 window.location.reload();              
			     })
			}else{
				document.getElementById("erroeMsg").innerHTML=' ';
	    		document.getElementById("successMsg").innerHTML=' ';
				$("#erroeMsg").text("po文失敗");
				}
            });
   }
    }
      
    </script>        

</body>

</html>