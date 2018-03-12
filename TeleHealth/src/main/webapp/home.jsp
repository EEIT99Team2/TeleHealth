<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page ="/fragment/nav.jsp" />
    <!-- Header -->
    <header>
      <div>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img class="d-block w-100" src="https://static.runoob.com/images/mix/img_fjords_wide.jpg" alt="First slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="https://static.runoob.com/images/mix/img_nature_wide.jpg" alt="Second slide">
		    </div>
		    <div class="carousel-item">
		      <img class="d-block w-100" src="https://static.runoob.com/images/mix/img_mountains_wide.jpg" alt="Third slide">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		</div>
    </header>
    
    <!-- Introduction -->
    <section id="introduction">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">簡介</h2>
            <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
            <p>Grayscale is a free Bootstrap theme created by Start Bootstrap. It can be yours right now, simply download the template on
              <a href="http://startbootstrap.com/template-overviews/grayscale/">the preview page</a>. The theme is open source, and you can use it for any purpose, personal or commercial.</p>
            <p>This theme features stock photos by
              <a href="http://gratisography.com/">Gratisography</a>
              along with a custom Google Maps skin courtesy of
              <a href="http://snazzymaps.com/">Snazzy Maps</a>.</p>
            <p>Grayscale includes full HTML, CSS, and custom JavaScript files along with SASS and LESS files for easy customization!</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Team -->
    <section id="team">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Team</h2>
            <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
          </div>
        </div>
        <div class="row">
  <div class="w3-row-padding w3-grayscale" style="margin-top:64px">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="img/team2.jpg" alt="John" style="width:100%">
        <div class="w3-container bg-light">
          <h3>John Doe</h3>
          <p class="w3-opacity">CEO & Founder</p>
          <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="img/team1.jpg" alt="Jane" style="width:100%">
        <div class="w3-container bg-light">
          <h3>Anja Doe</h3>
          <p class="w3-opacity">Art Director</p>
          <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="img/team3.jpg" alt="Mike" style="width:100%">
        <div class="w3-container bg-light">
          <h3>Mike Ross</h3>
          <p class="w3-opacity">Web Designer</p>
          <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
        </div>
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-card">
        <img src="img/team4.jpg" alt="Dan" style="width:100%">
        <div class="w3-container bg-light">
          <h3>Dan Star</h3>
          <p class="w3-opacity">Designer</p>
          <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
        </div>
      </div>
    </div>
  </div>
        </div>
        	<!-- Pagination -->
            <div class="w3-center w3-padding-32">
                <div class="w3-bar text-white">
                    <a href="#" class="w3-bar-item w3-button w3-hover-white">&laquo;</a>
                    <a href="#" class="w3-bar-item w3-white w3-button">1</a>
                    <a href="#" class="w3-bar-item w3-button w3-hover-white">2</a>
                    <a href="#" class="w3-bar-item w3-button w3-hover-white">3</a>
                    <a href="#" class="w3-bar-item w3-button w3-hover-white">4</a>
                    <a href="#" class="w3-bar-item w3-button w3-hover-white">&raquo;</a>
                </div>
            </div>
      </div>
    </section>

    <!-- Temp1 -->
    <section id="temp1">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Temp1</h2>
            <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
          </div>
        </div>
        <div class="row">
        
        </div>
      </div>
    </section>

    <!-- Temp2 -->
    <section id="temp2">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Temp2</h2>
            <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
          </div>
        </div>
        <div class="row">
        
        </div>
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p>
          </div>
        </div>
      </div>
    </section>
	<jsp:include page = "/fragment/footer.jsp" />

	</body>
</html>