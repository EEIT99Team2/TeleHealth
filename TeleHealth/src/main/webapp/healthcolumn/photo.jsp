<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/fragment/header.jsp" />
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <div id="myCarousel" class="carousel slide" data-ride="carousel">	
	<ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                 <li data-target="#myCarousel" data-slide-to="3"></li>
                  <li data-target="#myCarousel" data-slide-to="4"></li>
            </ol>
    <div class="carousel-inner">               
            </div>
   			<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
            <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>         
 </div>    
<script type="text/javascript">
$(document).ready(function() {	
	$.getJSON('/TeleHealth/healthcolumn/hotcontentimg.controller',{ }, function(data){
		console.log(data);
		$('.carousel-inner').empty();
		 $.each(data, function (i, data) {			 
			 var img =data.content;
			 var imgsrc=img.split(" ")
			 var imgurl=imgsrc[2].split("=");
			 console.log(imgurl[1]);
			 var doc=$(document.createDocumentFragment());
			 var num=["first","secound","third","fourth","fifth"];
			 if(i==0){
				 var article=$("<a class='heltitle' name="+data.title+" href='article.jsp?title="+data.title+"&advisoryCode="+data.advisoryCode+"'"+"target='_blank'></a>");
				 var divfirst=$('<div class="carousel-item active">');
                 var img=$('<img class="'+num[i]+'-slide"'+'src='+decodeURIComponent(imgurl[1])+'alt="'+data.title+'">');
             	 var ptitle=$('<p>'+data.title+'</p>');	
				 img.append(ptitle);
				 article.append(img);
				 var heldata=divfirst.append(article);				 
				 $('.carousel-inner').append(heldata);
				 }else {
				 console.log(data)	  
				 var article=$("<a class='heltitle' name="+data.title+" href='article.jsp?title="+data.title+"&advisoryCode="+data.advisoryCode+"'"+"target='_blank'></a>");
				 var divsecound=$('<div class="carousel-item ">')
                 var img=$('<img class="'+num[i]+'-slide"'+'src='+decodeURIComponent(imgurl[1])+'alt="'+data.title+'">');
             	 var ptitle=$('<p>'+data.title+'</p>');	
				 img.append(ptitle);
				 article.append(img);
				 var heldata=divsecound.append(article);								 
				 $('.carousel-inner').append(heldata);
				}
						 
		 })			 
	})
})






</script>

</body>
</html>