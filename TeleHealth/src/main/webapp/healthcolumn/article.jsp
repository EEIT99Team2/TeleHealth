<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/w3.css">
<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css" href="../css/index.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</head>
<body>
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
                        <a class="nav-link" href="/TeleHealth/healthcolumn/HealthColumn.jsp">健康專欄 <span class="sr-only">(current)</span></a>
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
    <!-- Page Content -->
    <div class="container">
      <div class="row justify-content-md-center">
        <!-- Post Content Column -->
        <div class="col-lg-10" id="data">        
     <!-- Comments Form -->
          <div class="card my-4">
            <h5 class="card-header">Leave a Comment:</h5>
            <div class="card-body">
              <form>
                <div class="form-group">
                  <textarea class="form-control" rows="3"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
              </form>
            </div>
          </div>        
      <!-- /.row -->
    </div>
    <!-- /.container -->
    </main>
    <!-- Footer -->
    <footer class="w3-center w3-black w3-padding-16">
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">eeit</a></p>
    </footer>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <!-- Just to make our placeholder images work. -->
<!--     <script src="/js/holder.min.js"></script> -->
<!--     <script src="/js/scripts.js"></script> -->

<script type="text/javascript">
    var url = location.href;
    var ary1 = url.split('?');
    var ary2 = ary1[1].split('=');
    var id = ary2[1];
    var titledecode= decodeURIComponent(id);   	  
    $.getJSON('/TeleHealth/healthcolumn/titlecontent.controller', {title:titledecode}, function (data){
		console.log(data);		
 		$('.col-lg-10').empty();	  
         $.each(data, function (i, data) {  
        	var cell0=$("<hr>")      	     	          
            var cell1= $("<h1 class='mt-4'></h1>").text(data[0]);
            var cell2= $("<p class='lead'></p>").text("by  "+data[1]);
            var cell3=$("<p></p>").text(data[3]); 
            var cell4= $("<p class='lead'></p>").html(data[2]);                          
            var row = $(' <div class="col-lg-10"></div>').append([cell1,cell0,cell2,cell3,cell0,cell4]);
             $('.col-lg-10').append(row);
         });        
 	});
    $.getJSON('/TeleHealth/healthcolumn/QAcontent.controller', {title:titledecode}, function (data){               
    	var doc=$(document.createDocumentFragment());    	
    	var insert=$("#data")
    	 $.each(data, function (i, data) {        
        	 console.log(data)
        	 if(data[0]==null){
        		 var cellauthor= $("<h5 class='mt-0'></h5>").text(data[1]); 
        		 var cellcontent=$("<p></p>").text(data[2]);	         		
          		 var celldate=$("<h6></h6>").text(data[3]);
          		 var row2=$("<div class='media-body' style='border-style:dashed'></div>").append([cellauthor,celldate,cellcontent]);
          		doc.append(row2);          		        		         		       		      		
            	 }else{
            	var cellauthor= $("<h5 class='mt-0'>會員:</h5>").text(data[0]);
            	var cellcontent=$("<p></p>").text(data[2]);	         		
         		var celldate=$("<h6></h6>").text(data[3]);
         		var row2=$("<div class='media-body' style='border-style:dashed'></div>").append([cellauthor,celldate,cellcontent]); 
         		doc.append(row2);          	             	            	
               }    	
       	}); 	
    	 insert.append(doc);               
     });
</script>        

</body>

</html>