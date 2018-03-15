<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>牽伴健康諮詢平台</title>
<style type="text/css">
.hotcontent {
	padding-left: 10em;
	width: 90%;
}
.div_right_bottom {
	width:300px;
	height:300px;
	padding:10px;
	float:right;
	position:fixed;
	right:0px;
	bottom:0px;
	z-index:20;
	border:2px solid #69c;
	_position:absolute; /* position fixed for IE6 */
}
</style>
</head>

<body id="page-top">
	<jsp:include page="/fragment/nav2.jsp" />
	<!-- Header -->
	<header>
		<div class="container">
			<div class="row">
				<div class="col-1"></div>
				<div id="myCarousel" class="carousel slide col-12"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
						<li data-target="#myCarousel" data-slide-to="4"></li>
					</ol>
					<div class="carousel-inner"></div>
					<a class="carousel-control-prev" href="#myCarousel" role="button"
						data-slide="prev"> <span class="carousel-control-prev-icon"
						aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#myCarousel" role="button"
						data-slide="next"> <span class="carousel-control-next-icon"
						aria-hidden="true"></span> <span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</header>
	<!-- Introduction -->
	<section id="introduction">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">簡介</h2>
					<h3 class="section-subheading text-muted">Lorem ipsum dolor
						sit amet consectetur.</h3>
					<p>
						Grayscale is a free Bootstrap theme created by Start Bootstrap. It
						can be yours right now, simply download the template on <a
							href="http://startbootstrap.com/template-overviews/grayscale/">the
							preview page</a>. The theme is open source, and you can use it for
						any purpose, personal or commercial.
					</p>
					<p>
						This theme features stock photos by <a
							href="http://gratisography.com/">Gratisography</a> along with a
						custom Google Maps skin courtesy of <a
							href="http://snazzymaps.com/">Snazzy Maps</a>.
					</p>
					<p>Grayscale includes full HTML, CSS, and custom JavaScript
						files along with SASS and LESS files for easy customization!</p>
				</div>
			</div>
		</div>
	</section>
	<!-- Team -->
	<section id="team">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">諮詢團隊</h2>
					<h3 class="section-subheading text-muted">Our Team</h3>
				</div>
			</div>
			<div class="row">
				<div class="w3-row-padding w3-grayscale" style="margin-top: 64px">
					<div class="w3-col l3 m6 w3-margin-bottom">
						<div class="w3-card">
							<img src="<c:url value="/images/team2.jpg "/>" alt="John"
								style="width: 100%">
							<div class="w3-container bg-light">
								<h3>John Doe</h3>
								<p class="w3-opacity">CEO & Founder</p>
								<p>Phasellus eget enim eu lectus faucibus vestibulum.
									Suspendisse sodales pellentesque elementum.</p>
							</div>
						</div>
					</div>
					<div class="w3-col l3 m6 w3-margin-bottom">
						<div class="w3-card">
							<img src="<c:url value="/images/team1.jpg "/>" alt="Jane"
								style="width: 100%">
							<div class="w3-container bg-light">
								<h3>Anja Doe</h3>
								<p class="w3-opacity">Art Director</p>
								<p>Phasellus eget enim eu lectus faucibus vestibulum.
									Suspendisse sodales pellentesque elementum.</p>
							</div>
						</div>
					</div>
					<div class="w3-col l3 m6 w3-margin-bottom">
						<div class="w3-card">
							<img src="<c:url value="/images/team3.jpg "/>" alt="Mike"
								style="width: 100%">
							<div class="w3-container bg-light">
								<h3>Mike Ross</h3>
								<p class="w3-opacity">Web Designer</p>
								<p>Phasellus eget enim eu lectus faucibus vestibulum.
									Suspendisse sodales pellentesque elementum.</p>
							</div>
						</div>
					</div>
					<div class="w3-col l3 m6 w3-margin-bottom">
						<div class="w3-card">
							<img src="<c:url value="/images/team4.jpg "/>" alt="Dan"
								style="width: 100%">
							<div class="w3-container bg-light">
								<h3>Dan Star</h3>
								<p class="w3-opacity">Designer</p>
								<p>Phasellus eget enim eu lectus faucibus vestibulum.
									Suspendisse sodales pellentesque elementum.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Pagination -->
			<div class="w3-center w3-padding-32">
				<div class="w3-bar text-white">
					<a href="#" class="w3-bar-item w3-button w3-hover-white">&laquo;</a>
					<a href="#" class="w3-bar-item w3-white w3-button">1</a> <a
						href="#" class="w3-bar-item w3-button w3-hover-white">2</a> <a
						href="#" class="w3-bar-item w3-button w3-hover-white">3</a> <a
						href="#" class="w3-bar-item w3-button w3-hover-white">4</a> <a
						href="#" class="w3-bar-item w3-button w3-hover-white">&raquo;</a>
				</div>
			</div>
		</div>
	</section>
	<div class="div_right_bottom" style="background: navajowhite;">
		<div style="border-bottom: 1px red solid">
			<span>線上諮詢</span>
		</div>
		<div style="background: navajowhite; height:70%">
			
		</div>
		<div class="row" style="background: navajowhite;">
			<textarea style="border: 1px red solid; width:60%" cols="5" id="inputMsg"></textarea>
			<button style='width:10%'>送出</button>
		</div>
	</div>
	<jsp:include page="/fragment/footer.jsp" />
</body>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$
								.getJSON(
										'/TeleHealth/healthcolumn/hotcontentimg.controller',
										{},
										function(data) {
											console.log(data);
											$('.carousel-inner').empty();
											$
													.each(
															data,
															function(i, data) {
																var img = data.content;
																var imgsrc = img
																		.split(" ")
																var imgurl = imgsrc[2]
																		.split("=");
																console
																		.log(imgurl[1]);
																var doc = $(document
																		.createDocumentFragment());
																var num = [
																		"first",
																		"secound",
																		"third",
																		"fourth",
																		"fifth" ];
																if (i == 0) {
																	var article = $("<a class='heltitle' name="
																			+ data.title
																			+ " href='healthcolumn/article.jsp?title="
																			+ data.title
																			+ "&advisoryCode="
																			+ data.advisoryCode
																			+ "'"
																			+ "target='_blank' ></a>");
																	var divfirst = $('<div class="carousel-item active">');
																	var img = $('<img  class="'
																			+ num[i]
																			+ '-slide hotcontent"'
																			+ 'src='
																			+ decodeURIComponent(imgurl[1])
																			+ 'alt="'
																			+ data.title
																			+ '">');
																	var ptitle = $('<p>'
																			+ data.title
																			+ '</p>');
																	img
																			.append(ptitle);
																	article
																			.append(img);
																	var heldata = divfirst
																			.append(article);
																	$(
																			'.carousel-inner')
																			.append(
																					heldata);
																} else {
																	console
																			.log(data)
																	var article = $("<a class='heltitle' name="
																			+ data.title
																			+ " href='healthcolumn/article.jsp?title="
																			+ data.title
																			+ "&advisoryCode="
																			+ data.advisoryCode
																			+ "'"
																			+ "target='_blank'></a>");
																	var divsecound = $('<div class="carousel-item ">')
																	var img = $('<img class="'
																			+ num[i]
																			+ '-slide hotcontent"'
																			+ 'src='
																			+ decodeURIComponent(imgurl[1])
																			+ 'alt="'
																			+ data.title
																			+ '">');
																	var ptitle = $('<p>'
																			+ data.title
																			+ '</p>');
																	img
																			.append(ptitle);
																	article
																			.append(img);
																	var heldata = divsecound
																			.append(article);
																	$(
																			'.carousel-inner')
																			.append(
																					heldata);
																}

															})
										})
					})
					
</script>
<!--Start of Zendesk Chat Script-->
<!-- <script type="text/javascript"> -->
// window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
// d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
// _.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
// $.src="https://v2.zopim.com/?5YaBt8JJAcDDLMRWkjhB3EUIQfZXywg7";z.t=+new Date;$.
// type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
<!-- </script> -->
<!-- <!--End of Zendesk Chat Script--> -->
<%-- <script src="<c:url value="/js/agency.min.js"/>"></script> --%>
</html>