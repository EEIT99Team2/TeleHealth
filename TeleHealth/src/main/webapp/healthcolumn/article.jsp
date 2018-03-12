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
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="../forCkeditor/ckeditor/ckeditor.js"></script>
<script src="../forCkeditor/ckfinder/ckfinder.js"></script>
<link rel="stylesheet" href="../forCkeditor/ckeditor/contents.css">
</head>
<body>
   <jsp:include page="/fragment/header.jsp" />
    
    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="padding:35px 50px;">
                        <h4 class="modal-title">Login</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="padding:40px 50px;">
                        <form role="form">
                            <div class="form-group">
                                <label for="usrname">Username</label>
                                <input type="text" class="form-control" id="usrname" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="psw">
                                    </span> Password</label>
                                <input type="text" class="form-control" id="psw" placeholder="Enter password">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" value="" checked /> Remember me
                                </label>
                            </div>
                           
                            <button type="submit" class="btn btn-success btn-block">Login</button>
                            <button type="submit" class="btn btn-danger btn-block">Cancel</button>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <p>Not a member? <a href="#">Sign Up</a></p>
                        <p>Forgot <a href="#">Password?</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <main>
    <!-- Page Content -->
    <div class="container">
      <div class="row justify-content-md-center">       
        <div class="col-lg-10" id='body'>            
     </div>
     <div class="col-lg-10" id='QAcontent'>                         
     </div>              
      <div class="col-lg-10" id='foot'> 
           <c:if test="${ empty LoginOK}">
      <h5 class="card-header">留言:</h5><h5 size="-1" color="#FF0000" id="errorMsg"><h5>
      	<div class="form-group">
      		<form id="Msg" action="/TeleHealth/healthcolumn/insQA.controller" method="post" >
      		<input type="hidden" id="advisorycode" name="advisorycode" >
      		<input type="hidden" id="title" name="title" >
      		<input type="hidden" id="MemId"name="MemId" value="B0041CB5-09F1-4E5B-8D57-1F0406019143">
      		<textarea class="form-control" id="textt" name="textmem" rows="3"></textarea>
      		<input type="button" value="送出" onclick=insert()>      		
      		<input type='button' id='clean' value='清除'><font id="successMsg" color="green" size="-1"></font><font id="erroeMsg" color="red" size="-1"></font>
      		</form>      	
      	</div>
      
      </div>
     </c:if>
    </div>                                                                                                                 
 </div>
 </main>
 <jsp:include page="/fragment/footer.jsp" />
   
<script type="text/javascript">
function check(){
	var content=$.trim($('#textt').text());
	if(content==null|| content.length()==0){
		document.getElementById("error").innerHTML='內容不能空白';		
		}else{
            document.Msg.submit();
        }
	
}

$(document).ready(function() {     
	 var tg=[ {name:'basicstyles',groups:['basicstyles','cleanup']},
         {name:'paragraph',groups:['align']},{name:'styles'},{name:'colors'},
         ];
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
    $.getJSON('/TeleHealth/healthcolumn/titlecontent.controller', {title:titledecode}, function (data){		
		 $.each(data, function (i, data) {
			console.log(data)
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
	            var video=$( '<video controls crossorigin="anonymous" width="600" height="500" controls><source src="http://localhost:8090/TeleHealth/video/'+decodeURIComponent(data[4])+'" type="video/mp4"></video>')
	            var cell4= $("<p class='lead'></p>").html(data[2]);                          
	            var row = $(' <div class="col-lg-10" id="data"></div>').append([cell1,cell0,cell2,cell3,video,cell0,cell4]);
	             $('#body').append(row);
			}	
         });        
 	});   
    $.getJSON('/TeleHealth/healthcolumn/QAcontent.controller', {title:titledecode}, function (data){               
    	var doc=$(document.createDocumentFragment());   	
    	var div=$('<div class="col-lg-10" ></div>');
    	 $.each(data, function (i, data) {          	 
        	 if(data[0]==null){
        		 var cellauthor= $("<h6 class='mt-0'></h6>").text("會員:"+data[1]); 
        		 var cellcontent=$("<p></p>").html(data[2]);
        		 if (data[4]==null){
        			 var celldate=$("<small></small>").text(data[3]);
            	}else{
                	var celldate=$("<small></small>").text(data[4]);
                	}	
          		 var row2=$("<div class='media-body' style='border-style:dashed'></div>").append([cellauthor,celldate,cellcontent]);
          		doc.append(row2);          		        		         		       		      		
            	 }else{
            	var cellauthor= $("<h5 class='mt-0'></h5>").text(data[0]);
            	var cellcontent=$("<p></p>").html(data[2]);	         		
            	if (data[4]==null){
       			 var celldate=$("<small></small>").text(data[3]);
           		}else{
               	var celldate=$("<small></small>").text(data[4]);
               	}	
         		var row2=$("<div class='media-body' style='border-style:dashed'></div>").append([cellauthor,celldate,cellcontent]); 
         		doc.append(row2);          	             	            	
               }    	
       	}); 	
    	 $('#QAcontent').append(doc);               
     })
     function insert(){
    	var url = location.href;
	    var ary1 = url.split('?');	   
	    var ary2 = ary1[1].split('=');
	    var aryid=ary2[1].split('&');	    		       
		var title = aryid[0];		    
	    var atype=ary2[2];	    
	    var MemId=$("#MemId").val();	    
	    var content= CKEDITOR.instances.textt.getData();
        $.getJSON("/TeleHealth/healthcolumn/insQA.controller",{advisorycode:atype,title:title,MemId:MemId,textmem:content},function(datas){
			if(datas=="ok"){
				$("#QAcontent").empty();
			 $.getJSON('/TeleHealth/healthcolumn/QAcontent.controller', {title:titledecode}, function (data){               
			    	var doc=$(document.createDocumentFragment());   	
			    	var div=$('<div class="col-lg-10"></div>');
			    	 $.each(data, function (i, data) {          	 
			        	 if(data[0]==null){
			        		 var cellauthor= $("<h5 class='mt-0'></h5>").text("會員:"+data[1]); 
			        		 var cellcontent=$("<p></p>").html(data[2]);
			        		 if (data[4]==null){
			        			 var celldate=$("<h6></h6>").text(data[3]);
			            	}else{
			                	var celldate=$("<h6></h6>").text(data[4]);
			                	}	
			          		 var row2=$("<div class='media-body' style='border-style:dashed'></div>").append([cellauthor,celldate,cellcontent]);
			          		doc.append(row2);          		        		         		       		      		
			            	 }else{
			            	var cellauthor= $("<h5 class='mt-0'></h5>").text(data[0]);
			            	var cellcontent=$("<p></p>").html(data[2]);	         		
			            	if (data[4]==null){
			       			 var celldate=$("<h6></h6>").text(data[3]);
			           		}else{
			               	var celldate=$("<h6></h6>").text(data[4]);
			               	}	
			         		var row2=$("<div class='media-body' style='border-style:dashed'></div>").append([cellauthor,celldate,cellcontent]); 
			         		doc.append(row2);          	             	            	
			               }    	
			       	}); 	
			    	 $('#QAcontent').append(doc);
			    	 $("#successMsg").text("po文成功");               
			     })
			}else{
				$("#erroeMsg").text("po文失敗");
				}
            });
   }
      
    </script>        

</body>

</html>