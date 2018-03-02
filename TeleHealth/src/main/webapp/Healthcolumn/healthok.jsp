<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Document</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/w3.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="../css/index.css" />
    
    <style type="text/css">
        
    </style>
</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Navigation -->
    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top w3-black">
            <a class="navbar-brand" href="#">Carousel</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse w3-center" id="navbarCollapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">健康專欄 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#team">醫師介紹</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#pricing">方案介紹</a>
                    </li>
                </ul>
                <!-- Trigger the modal with a button -->
                <button type="button" class="btn btn-sm btn-outline-secondary" id="myBtn">Login</button>
            </div>
        </nav>
    </header>
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
        <ul class="nav nav-tabs w3-padding-large w3-card" id="myTab" role="tablist">
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
                                <a href="post.html">
                                    <h2 class="post-title">
                                        Man must explore, and this is exploration at its greatest
                                    </h2>                                 
                                </a>
                                <p class="post-meta">Posted by on September 24, 2018</p>
                                <img src="team4.jpg" class="col-5 float-left">
                                <p>Sed non nisi ut quam varius pulvinar sit amet eget enim. Suspendisse fringilla libero id vestibulum porta. Maecenas sed semper dolor. Pellentesque convallis luctus est et rutrum. Sed ac ante in nisi imperdiet facilisis. Praesent et porta lorem, ac sagittis quam. Sed tempus eleifend ex quis scelerisque. Sed pulvinar viverra velit ultrices egestas. Etiam convallis libero auctor feugiat tempor. Integer lectus nisi, convallis eget pellentesque eu, tempor quis erat. Suspendisse potenti.</p>
                                
                            </div>
                            <hr> 
 <script type="text/javascript"> 
	$(document).ready(function() {		
			 
	})
 $('input[type="button"]').click(function() {
	var value=$(this).prop("id");
 	$.getJSON('/TeleHealth/Healthcolumn/healthcolumn.controller', {advisoryCode:value}, function (data){
		console.log(data);		
		$('#title').empty();	  
         $.each(data, function (i, data) {         	     	          
            var cell1= $("<h2 class='post-title'></h2>").text(data.title);
            var cell2=$("<p class='post-meta'></p>").text(data.createDate);
            var cell3 = $("<p></p>").html(data.content.substring(0,300));        
            var row = $('<div class="post-preview"></div>').append([cell1,, cell2,cell3]);
            $('#title').append(row);
         });
         var pager= $('<a href="#" class="previous btn btn-primary float-left w3-padding-large w3-margin-bottom"></a>').text("<Previous");
         var pager2= $('<a href="#" class="next btn btn-primary float-right w3-padding-large w3-margin-bottom"></a>').text("Next>");    
         var row2=$( '<div class="clearfix"></div>').append([pager,pager2]);
		 $('#title').append(row2);
 	});
 });	
 </script>                   
                        </div>
                    </div>
                </div>
            </div>          
        </div>
    </main>
    <!-- Footer -->
    <footer class="w3-center w3-black w3-padding-16">
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">eeit</a></p>
    </footer>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. -->
</body>

</html>