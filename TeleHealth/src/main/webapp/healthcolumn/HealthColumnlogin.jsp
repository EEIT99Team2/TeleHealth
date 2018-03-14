<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Document</title> 
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script> 
    <link rel="stylesheet" type="text/css" href="/TeleHealth/css/fonts/fontstyle.css" />
</head>

<body>
<jsp:include page="/fragment/nav2.jsp" /> 
    <main>
        <ul class="nav nav-tabs justify-content-center w3-padding-large w3-card " id="myTab" role="tablist">
            <li class="nav-item">
                <input type="button" class="nav-link active" id="BOD" data-toggle="tab" role="tab"  value="塑身健康"/>
            </li>
             <li class="nav-item">
                <input type="button" class="nav-link active" id="FOO" data-toggle="tab" role="tab"  value="飲食資訊"/>
            </li>
             <li class="nav-item">
                <input type="button" class="nav-link active" id="CHR" data-toggle="tab" role="tab"  value="慢性疾病"/>
            </li>
             <li class="nav-item">
                <input type="button" class="nav-link active" id="EYE" data-toggle="tab" role="tab"  value="眼睛保健"/>
            </li>
             <li class="nav-item">
                <input type="button" class="nav-link active" id="OLD" data-toggle="tab" role="tab"  value="銀髮照護"/>
            </li>
             <li class="nav-item">
                <input type="button" class="nav-link active" id="VID" data-toggle="tab" role="tab"  value="影音專區"/>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <!-- Main Content -->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-10 mx-auto" id="title">
                            <div class="post-preview">                               
                            </div>
                            <hr> 
 <script type="text/javascript"> 
	$(document).ready(function() {	
		$.getJSON('/TeleHealth/healthcolumn/hotcontent.controller',{ }, function(data){
			console
			$('#title').empty();
			 $.each(data, function (i, data) {
				 var article=$("<a class='heltitle' name="+data.title+" href='article.jsp?title="+data.title+"&advisoryCode="+data.advisoryCode+"'"+"target='_blank'></a>");          	     	          
		            var cell1= $("<h2 class='post-title'></h2>").text(data.title);
		            article.append(cell1)
		            var cell2=$("<p class='post-meta'></p>").text(data.createDate);
		            var cell3 = $("<p></p>").html(data.content.substring(0,200));        
		            var row = $('<div class="post-preview"></div>').append([article, cell2,cell3]);
		            $('#title').append(row);
		         });
		         var pager= $('<a href="#" class="previous btn btn-primary float-left w3-padding-large w3-margin-bottom"></a>').text("<Previous");
		         var pager2= $('<a href="#" class="next btn btn-primary float-right w3-padding-large w3-margin-bottom"></a>').text("Next>");    
		         var row2=$( '<div class="clearfix"></div>').append([pager,pager2]);
				 $('#title').append(row2);
		 	});			 
	});
 $('input[type="button"]').click(function() {
	var value=$(this).prop("id");
	if(value!="VID"){		
	$.getJSON('/TeleHealth/healthcolumn/healthcolumn.controller', {advisoryCode:value}, function (data){
		console.log(data);				
		$('#title').empty();	  
         $.each(data, function (i, data) {
            var article=$("<a class='heltitle' name="+data.title+" href='article.jsp?title="+data.title+"&advisoryCode="+data.advisoryCode+"'"+"target='_blank'></a>");          	     	          
            var cell1= $("<h2 class='post-title' ></h2>").text(data.title);
            article.append(cell1);
            var cell2=$("<p class='post-meta'></p>").text(data.createDate);
            var cell3 = $("<p></p>").html(data.content.substring(0,300));        
            var row = $('<div class="post-preview"></div>').append([article, cell2,cell3]);
            $('#title').append(row);
         });
         var pager= $('<a href="#" class="previous btn btn-primary float-left w3-padding-large w3-margin-bottom"></a>').text("<Previous");
         var pager2= $('<a href="#" class="next btn btn-primary float-right w3-padding-large w3-margin-bottom"></a>').text("Next>");    
         var row2=$( '<div class="clearfix"></div>').append([pager,pager2]);
		 $('#title').append(row2);
 	});
	}else{
		$.getJSON('/TeleHealth/healthcolumn/healthcolumn.controller', {advisoryCode:value}, function (data){
			console.log(data);				
			$('#title').empty();	  
	         $.each(data, function (i, data) {
	            var article=$("<a class='heltitle' name="+data.title+" href='article.jsp?title="+data.title+"&advisoryCode="+data.advisoryCode+"'"+"target='_blank'></a>");          	     	          
	            var cell1= $("<h2 class='post-title' ></h2>").text(data.title);
	            article.append(cell1);
	            var cell2=$("<p class='post-meta'></p>").text(data.createDate);	           
				var vid=$( '<video width="300" height="200" controls><source src="http://localhost:8090/TeleHealth/video/'+decodeURIComponent(data.fileName)+'" type="video/mp4"></video>')
	            var cell3 = $("<p></p>").html(data.content.substring(0,100));        
	            var row = $('<div class="post-preview"></div>').append([article,cell2,cell3,vid]);
	            $('#title').append(row);
	         });
	         var pager= $('<a href="#" class="previous btn btn-primary float-left w3-padding-large w3-margin-bottom"></a>').text("<Previous");
	         var pager2= $('<a href="#" class="next btn btn-primary float-right w3-padding-large w3-margin-bottom"></a>').text("Next>");    
	         var row2=$( '<div class="clearfix"></div>').append([pager,pager2]);
			 $('#title').append(row2);
	 	});
	}
	 });
	$('#title').on('click','.heltitle',function(){
		var title=($(this).attr('name'));
		console.log(title);
		$.post('/TeleHealth/healthcolumn/countarticle.controller', {title:title}, function (data){
		});		
	})
 </script>                   
                        </div>
                    </div>
                </div>
            </div>          
        </div>
    </main> 
 <jsp:include page="/fragment/footer.jsp" />  
</body>
</html>