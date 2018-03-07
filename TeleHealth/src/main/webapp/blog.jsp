<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Document</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="w3.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="index.css" />
    <style type="text/css">
        
    </style>
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
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">Contact</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <!-- Main Content -->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-10 mx-auto">

                            <div class="post-preview">
                                <a href="post.html">
                                    <h2 class="post-title">
                                        Man must explore, and this is exploration at its greatest
                                    </h2>
                                </a>
                                <img src="team4.jpg" class="col-5 float-left">
                                <p>Sed non nisi ut quam varius pulvinar sit amet eget enim. Suspendisse fringilla libero id vestibulum porta. Maecenas sed semper dolor. Pellentesque convallis luctus est et rutrum. Sed ac ante in nisi imperdiet facilisis. Praesent et porta lorem, ac sagittis quam. Sed tempus eleifend ex quis scelerisque. Sed pulvinar viverra velit ultrices egestas. Etiam convallis libero auctor feugiat tempor. Integer lectus nisi, convallis eget pellentesque eu, tempor quis erat. Suspendisse potenti.</p>
                                <p class="post-meta">Posted by
                                    <a href="#">Start Bootstrap</a> on September 24, 2018</p>
                            </div>
                            <hr>
                            <div class="post-preview">
                                <a href="post.html">
                                    <h2 class="post-title">
                                        I believe every human has a finite number of heartbeats. I don't intend to waste any of mine.
                                    </h2>
                                </a>
                                <img src="team4.jpg" class="col-5 float-left">
                                <p>Sed non nisi ut quam varius pulvinar sit amet eget enim. Suspendisse fringilla libero id vestibulum porta. Maecenas sed semper dolor. Pellentesque convallis luctus est et rutrum. Sed ac ante in nisi imperdiet facilisis. Praesent et porta lorem, ac sagittis quam. Sed tempus eleifend ex quis scelerisque. Sed pulvinar viverra velit ultrices egestas. Etiam convallis libero auctor feugiat tempor. Integer lectus nisi, convallis eget pellentesque eu, tempor quis erat. Suspendisse potenti.</p>
                                <p class="post-meta">Posted by
                                    <a href="#">Start Bootstrap</a> on September 18, 2018</p>
                            </div>
                            <hr>
                            <div class="post-preview">
                                <a href="post.html">
                                    <h2 class="post-title">
                                        Science has not yet mastered prophecy
                                    </h2>
                                </a>
                                <img src="team4.jpg" class="col-5 float-left">
                                <p>Sed non nisi ut quam varius pulvinar sit amet eget enim. Suspendisse fringilla libero id vestibulum porta. Maecenas sed semper dolor. Pellentesque convallis luctus est et rutrum. Sed ac ante in nisi imperdiet facilisis. Praesent et porta lorem, ac sagittis quam. Sed tempus eleifend ex quis scelerisque. Sed pulvinar viverra velit ultrices egestas. Etiam convallis libero auctor feugiat tempor. Integer lectus nisi, convallis eget pellentesque eu, tempor quis erat. Suspendisse potenti.</p>
                                <p class="post-meta">Posted by
                                    <a href="#">Start Bootstrap</a> on August 24, 2018</p>
                            </div>
                            <hr>
                            <div class="post-preview">
                                <a href="post.html">
                                    <h2 class="post-title">
                                        Failure is not an option
                                    </h2>
                                </a>
                                <img src="team4.jpg" class="col-5 float-left">
                                <p>Sed non nisi ut quam varius pulvinar sit amet eget enim. Suspendisse fringilla libero id vestibulum porta. Maecenas sed semper dolor. Pellentesque convallis luctus est et rutrum. Sed ac ante in nisi imperdiet facilisis. Praesent et porta lorem, ac sagittis quam. Sed tempus eleifend ex quis scelerisque. Sed pulvinar viverra velit ultrices egestas. Etiam convallis libero auctor feugiat tempor. Integer lectus nisi, convallis eget pellentesque eu, tempor quis erat. Suspendisse potenti.</p>
                                <p class="post-meta">Posted by
                                    <a href="#">Start Bootstrap</a> on July 8, 2018</p>
                            </div>
                            <hr>
                            <!-- Pager -->
                            <div class="clearfix">
                                <a href="#" class="previous btn btn-primary float-left w3-padding-large w3-margin-bottom">&laquo; Previous</a>
                                <a href="#" class="next btn btn-primary float-right w3-padding-large w3-margin-bottom">Next &raquo;</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>
            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
        </div>
    </main>
    <!-- Footer -->
    <footer class="w3-center w3-black w3-padding-16">
        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-text-green">eeit</a></p>
    </footer>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. -->
    <script src="scripts.js"></script>
</body>

</html>