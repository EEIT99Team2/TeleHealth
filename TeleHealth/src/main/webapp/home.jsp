<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<title>牽伴遠距健康諮詢平台</title>
<style type="text/css">

.hotcontent {
	padding-left: 10em;
	width: 90%;
}
p{font-size:20px;
margin-bottom:50px;}
dt{font-size:30px;
	padding-bottom:15px;}
dd{font-size:20px;}
.introduction{
height:250px}
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
					<h2 class="section-heading text-uppercase text-center">關於 牽伴</h2>
					<h3 class="section-subheading text-muted">About
						TeleHealthSystem</h3>
					<p class="text-justify">本平台為了打造個人化的遠距健康諮詢平台，結合遠距視訊健康諮詢網路與各項健康數據分析，由牽伴醫護團隊協助分析各項生理數據，
						更進一步提供相關預防保健管理建議
						，對於自身生理數值有任何疑問，皆可隨時預約諮詢個案管理師，個案管理師亦會針對每日量測的數值主動進行監測及相關照護，此項服務可讓個案在家就能獲得立即且持續的照護與諮詢，
						減少疾病復發或嚴重併發症，提升生活品質。</p>
						<br/>
						<br/>
					<h2 class="tsection-heading text-uppercase text-center">使命</h2>
					<h3 class="section-subheading text-muted">Business Mission</h3>
					<dl>
						<dd class="text-left">資訊通訊技術的蓬勃發展，帶動許多產業的服務模式轉變，醫療服務領域與高度科技化的相關專業結合，應用在醫療儀器開發、照顧服務工具輔助等，影響層面涵括診斷技術科技化、服務品質精緻化、異業結合更趨向全面化。</dd>
						<dd class="text-left">在資訊輔助醫療的研創下，顛覆了傳統的機構內床邊照護思維，個案被服務的時空限制打破了，需求由特殊急症傷、疾轉變成一般健康促進，不再滿足於傳統就醫模式。於是，創造了遠距健康照護的市場。然而，這個產業的建置成本與效益的平衡，是成功的關鍵，也是永續發展的最大挑戰。</dd>
						<dd class="text-left">牽伴遠距健康諮詢平台的主要任務，就是要整合相關醫療照護產業單位，協同合作提供第一線的照護者、家屬或個案本身適切的服務，達成即時照護作業支援與疾病預防健康管理的目的。</dd>
					</dl>
					<br/>
						<br/>
					<h2 class="tsection-heading text-uppercase text-center">遠距健康數據分析</h2>
					<h3 class="section-subheading text-muted">Remote Health Data Analysis</h3>
					<dl>
						<dd class="text-left">居家血壓、血糖、BMI等監測及其過往紀錄值分析。將量測紀錄輸入至平台，可隨時查看過往紀錄，供個案管理師及諮詢團隊作為協助個案之依據，持續掌握健康狀況。</dd>
					</dl>
					<h2 class="tsection-heading text-uppercase text-center">遠距健康視訊諮詢</h2>
					<h3 class="section-subheading text-muted">Health Video Consultation</h3>
					<dl>
						<dd class="text-left">透過手機、平板、電腦等各項能夠使用瀏覽器的裝置，即可進行預約諮詢，與牽伴的專業醫護團隊進行視訊對談，讓您不需出門即能快速獲得最完整的保健新知與慢性疾病監控。</dd>
					</dl>
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
							<img src="<c:url value="/images/doctor1.jpg"/>" alt="John"
								style="width: 100%;background-color:#33CCFF;">
							<div class="w3-container bg-light introduction">
								<h3>Dr.Doe</h3>
								<p class="w3-opacity">醫師</p>
								<p>專長:高血壓、一般醫學、臨床藥理學、臨床試驗</p>
							</div>
						</div>
					</div>
					<div class="w3-col l3 m6 w3-margin-bottom">
						<div class="w3-card">
							<img src="<c:url value="/images/doctor2	.png"/>" alt="Jane"
								style="width: 100%;background-color:#33CCFF;">
							<div class="w3-container bg-light introduction">
								<h3>Dr.Wu</h3>
								<p class="w3-opacity">營養師</p>
								<p>減重營養、慢性病營養、雲端營養服務、營養教育</p>
							</div>
						</div>
					</div>
					<div class="w3-col l3 m6 w3-margin-bottom">
						<div class="w3-card">
							<img src="<c:url value="/images/doctor3.jpg"/>" alt="Mike"
								style="width: 100%; background-color:#33CCFF;">
							<div class="w3-container bg-light introduction">
								<h3>Dr.Ross</h3>
								<p class="w3-opacity">護理師</p>
								<p>腫瘤護理、安寧緩和、醫療護理、慢性病護理及健康行為研究</p>
							</div>
						</div>
					</div>
					<div class="w3-col l3 m6 w3-margin-bottom">
						<div class="w3-card">
							<img src="<c:url value="/images/doctor4.png"/>" alt="Dan"
								style="width: 100%;background-color:#FFFFFF;">
							<div class="w3-container bg-light introduction">
								<h3>Dr.Lu</h3>
								<p class="w3-opacity">物理治療師</p>
								<p>骨骼肌肉神經病變、肩頸酸痛及腰部疼痛關節疼痛、中風(頭部外傷)、發展遲緩</p>
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
	
	<jsp:include page="/fragment/footer.jsp" />
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$.getJSON('/TeleHealth/healthcolumn/hotcontentimg.controller',{}, function(data) {	
				$('.carousel-inner').empty();
				$.each(data, function(i, data) {
					if(data.content)
					var img = data.content;
					var imgsrc = img.split(" ");
					var imgurl = imgsrc[2].split("=");					
					var doc = $(document.createDocumentFragment());
					var num = ["first","secound","third","fourth","fifth" ];
					if (i == 0) {
						var article = $("<a class='heltitle' name=" + data.title 
								+ " href='healthcolumn/article.jsp?title=" + data.title
								+ "&advisoryCode=" + data.advisoryCode + "'target='_blank' ></a>");
						var divfirst = $('<div class="carousel-item active">');
						var img = $('<img  class="'+ num[i]+ '-slide hotcontent"'+ 'src='+ decodeURIComponent(imgurl[1])
								+ 'alt="'+ data.title+ '">');
						var ptitle = $('<p>'+ data.title+ '</p>');
						img.append(ptitle);
						article.append(img);
						var heldata = divfirst.append(article);
						$('.carousel-inner').append(heldata);
					} else {						
						var article = $("<a class='heltitle' name="
								+ data.title
								+ " href='healthcolumn/article.jsp?title="
								+ data.title
								+ "&advisoryCode="
								+ data.advisoryCode
								+ "'"
								+ "target='_blank'></a>");
						var divsecound = $('<div class="carousel-item ">')
						var img = $('<img class="'+ num[i]+ '-slide hotcontent" src='+ decodeURIComponent(imgurl[1])
								+ 'alt="'+ data.title+ '">');
						var ptitle = $('<p>'+ data.title+ '</p>');
						img.append(ptitle);
						article.append(img);
						var heldata = divsecound.append(article);
						$('.carousel-inner').append(heldata);
				}
			});
		});

		var errorMsg = $('#errorMsg').val();
		if(errorMsg != "" && errorMsg != null) {
			 $(function(){
		        $('#myModal').modal({
		        show:true,
		        backdrop:true
		        })
			 });
		}
	})
</script>

<%-- <script src="<c:url value="/js/agency.min.js"/>"></script> --%>
</html>