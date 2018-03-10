<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 <title>Document</title>  
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
                      
                       <form method="post" enctype="multipart/form-data" 
						action="<c:url value="/login.controller"/>">
                            <div class="form-group">
                                <label for="usrname">Username</label>
                                <input type="text" class="form-control" name="usrname" id="usrname" placeholder="Enter email" value="${param.usrname}">
                                <font color="red" size="-1">${MsgMap.errorUsrName}</font>                              
                            </div>
                            <div class="form-group">
                                <label for="psw">
                                    </span> Password</label>
                                <input type="password" class="form-control" name="psw" id="psw" placeholder="Enter password">
                            </div>
                            <font color="red" size="-1">${MsgMap.errorPsw}</font>
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
                        <p>Not a member? <a href="Members/register.jsp">Sign Up</a></p>
                        <p>Forgot <a href="Members/ForgetPwd.jsp">Password?</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <main role="main">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>               
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="first-slide" src="https://static.runoob.com/images/mix/img_fjords_wide.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="second-slide" src="https://static.runoob.com/images/mix/img_nature_wide.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="third-slide" src="https://static.runoob.com/images/mix/img_mountains_wide.jpg" alt="Third slide">
                </div>                
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
        <!-- Team Section -->
        <div class="w3-container marketing" style="padding:128px 16px" id="team">
            <h3 class="w3-center">THE TEAM</h3>
            <p class="w3-center w3-large">The ones who runs this company</p>
            <div class="w3-row-padding w3-grayscale" style="margin-top:64px">
                <div class="w3-col l3 m6 w3-margin-bottom">
                    <div class="w3-card">
                        <img src="team2.jpg" alt="John" style="width:100%">
                        <div class="w3-container">
                            <h3>John Doe</h3>
                            <p class="w3-opacity">CEO & Founder</p>
                            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                            <p>
                                <button class="w3-button w3-light-grey w3-block"><i class="fa fa-envelope"></i> 預約</button>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="w3-col l3 m6 w3-margin-bottom">
                    <div class="w3-card">
                        <img src="team1.jpg" alt="Jane" style="width:100%">
                        <div class="w3-container">
                            <h3>Anja Doe</h3>
                            <p class="w3-opacity">Art Director</p>
                            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                            <p>
                                <button class="w3-button w3-light-grey w3-block"><i class="fa fa-envelope"></i> 預約</button>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="w3-col l3 m6 w3-margin-bottom">
                    <div class="w3-card">
                        <img src="team3.jpg" alt="Mike" style="width:100%">
                        <div class="w3-container">
                            <h3>Mike Ross</h3>
                            <p class="w3-opacity">Web Designer</p>
                            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                            <p>
                                <button class="w3-button w3-light-grey w3-block"><i class="fa fa-envelope"></i> 預約</button>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="w3-col l3 m6 w3-margin-bottom">
                    <div class="w3-card">
                        <img src="team4.jpg" alt="Dan" style="width:100%">
                        <div class="w3-container">
                            <h3>Dan Star</h3>
                            <p class="w3-opacity">Designer</p>
                            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
                            <p>
                                <button class="w3-button w3-light-grey w3-block"><i class="fa fa-envelope"></i> 預約</button>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Pagination -->
            <div class="w3-center w3-padding-32">
                <div class="w3-bar">
                    <a href="#" class="w3-bar-item w3-button w3-hover-black">&laquo;</a>
                    <a href="#" class="w3-bar-item w3-black w3-button">1</a>
                    <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
                    <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
                    <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
                    <a href="#" class="w3-bar-item w3-button w3-hover-black">&raquo;</a>
                </div>
            </div>
        </div>
        <!-- Pricing Section -->
        <div class="w3-container w3-center w3-dark-grey" style="padding:128px 16px" id="pricing">
            <h3>PRICING</h3>
            <p class="w3-large">Choose a pricing plan that fits your needs.</p>
            <div class="w3-row-padding" style="margin-top:64px">
                <div class="w3-third w3-section">
                    <ul class="w3-ul w3-white w3-hover-shadow">
                        <li class="w3-black w3-xlarge w3-padding-32">Basic</li>
                        <li class="w3-padding-16"><b>10GB</b> Storage</li>
                        <li class="w3-padding-16"><b>10</b> Emails</li>
                        <li class="w3-padding-16"><b>10</b> Domains</li>
                        <li class="w3-padding-16"><b>Endless</b> Support</li>
                        <li class="w3-padding-16">
                            <h2 class="w3-wide">$ 10</h2>
                            <span class="w3-opacity">per month</span>
                        </li>
                        <li class="w3-light-grey w3-padding-24">
                            <button class="w3-button w3-black w3-padding-large">Sign Up</button>
                        </li>
                    </ul>
                </div>
                <div class="w3-third">
                    <ul class="w3-ul w3-white w3-hover-shadow">
                        <li class="w3-red w3-xlarge w3-padding-48">Pro</li>
                        <li class="w3-padding-16"><b>25GB</b> Storage</li>
                        <li class="w3-padding-16"><b>25</b> Emails</li>
                        <li class="w3-padding-16"><b>25</b> Domains</li>
                        <li class="w3-padding-16"><b>Endless</b> Support</li>
                        <li class="w3-padding-16">
                            <h2 class="w3-wide">$ 25</h2>
                            <span class="w3-opacity">per month</span>
                        </li>
                        <li class="w3-light-grey w3-padding-24">
                            <button class="w3-button w3-black w3-padding-large">Sign Up</button>
                        </li>
                    </ul>
                </div>
                <div class="w3-third w3-section">
                    <ul class="w3-ul w3-white w3-hover-shadow">
                        <li class="w3-black w3-xlarge w3-padding-32">Premium</li>
                        <li class="w3-padding-16"><b>50GB</b> Storage</li>
                        <li class="w3-padding-16"><b>50</b> Emails</li>
                        <li class="w3-padding-16"><b>50</b> Domains</li>
                        <li class="w3-padding-16"><b>Endless</b> Support</li>
                        <li class="w3-padding-16">
                            <h2 class="w3-wide">$ 50</h2>
                            <span class="w3-opacity">per month</span>
                        </li>
                        <li class="w3-light-grey w3-padding-24">
                            <button class="w3-button w3-black w3-padding-large">Sign Up</button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </main>
    <!-- Footer -->
	<jsp:include page="/fragment/footer.jsp" />
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. -->
    <script src="<c:url  value='/holder.min.js' />"></script>
    <script src="<c:url  value='/scripts.js' />" ></script>
    
    
</body>

</html>