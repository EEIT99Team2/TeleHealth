<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>健康專欄</title>
<style type="text/css">
.contentdescrip {
	font-size: 12px
}
</style>

</head>

<body>
	<jsp:include page="/fragment/nav2.jsp" />
	<main>
	<ul
		class="nav nav-tabs justify-content-center w3-padding-large w3-card "
		id="myTab" role="tablist">
		<li class="nav-item"><input type="button" class="nav-link active"
			id="BOD" data-toggle="tab" role="tab" value="塑身健康" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="飲食資訊" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="CHR" data-toggle="tab" role="tab" value="慢性疾病" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="EYE" data-toggle="tab" role="tab" value="眼睛保健" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="OLD" data-toggle="tab" role="tab" value="銀髮照護" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="VID" data-toggle="tab" role="tab" value="影音專區" /></li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel"
			aria-labelledby="home-tab">
			<!-- Main Content -->
			<div class="container">
				<div class="row">
					<table class="col-lg-6 col-md-10 mx-auto" id="title">
					<thead>
					<tr>
					<th></th>
					</tr>
					</thead>
						<tbody id="tbody">
							<tr class="post-preview">
							</tr>							
						</tbody>
					</table>
				</div>				
				<div class="container">
					<div class="row">
						<span id='table_page' class='col-lg-2 col-md-10 mx-auto'></span>
					</div>						
				</div>
			</div>
		</div>
	</div>

	</main>
	<script src="../js/jquery-tablepage-1.0.js"></script>
	<script type="text/javascript">
		$(document).ready(
		function() {
			$.getJSON("<c:url value='/healthcolumn/hotcontent.controller'/>",{}, function(data) {
			var doc = $(document.createDocumentFragment());
						$('#tbody').empty();
			$.each(data, function(i, data) {
			var article = $("<a class='heltitle' name="+ data.title	+ " href='article.jsp?title="+ data.title + "&advisoryCode="
					+ data.advisoryCode + "'"+ "target='_blank'></a>");
			var cell1 = $("<h2 class='post-title'></h2>").text(data.title);
			article.append(cell1);
			var cell2 = $("<p class='post-meta'></p>").text(data.createDate);
			var cell3 = $("<p class='contentdescrip'></p>")	.html(data.content.substring(0,	200));
			var row = $('<tr class="post-preview"></tr>').append([ article, cell2, cell3 ]);
			doc.append(row);
		});
		$('#tbody').append(doc);
		$("#title").tablepage($("#table_page"),5);
		});
		});
		$('input[type="button"]').click(
	    function() {	   	
		var value = $(this).prop("id");
		if (value != "VID"){
		$.getJSON("<c:url value='/healthcolumn/healthcolumn.controller'/>",{advisoryCode : value},function(data) {
		var doc = $(document.createDocumentFragment());
		$('#tbody').empty();
		$.each(data,function(i,data) {
			var article = $("<a class='heltitle' name="+ data.title+" href='article.jsp?title="+ data.title+ "&advisoryCode="
				 			+ data.advisoryCode	+ "'"+ "target='_blank'></a>");
			var cell1 = $("<h2 class='post-title' ></h2>").text(data.title);
						article.append(cell1);
			var cell2 = $("<p class='post-meta'></p>").text(data.createDate);
		    var cell3 = $("<p></p>").html(data.content.substring(0,200));
			var row = $('<tr class="post-preview"></tr>').append([article,cell2,cell3 ]);
			doc.append(row);
			});
		    $('#tbody').append(doc);
		    $("#title").tablepage($("#table_page"),5);			
			});
		}		 
	    else {$.getJSON("<c:url value='/healthcolumn/healthcolumn.controller'/>",{advisoryCode : value},function(data) {
		    var doc = $(document.createDocumentFragment());
		    $('#tbody').empty();
			$.each(data,function(i,data) {
			var article = $("<a class='heltitle' name="+ data.title+ " href='article.jsp?title="+ data.title+ "&advisoryCode="+ data.advisoryCode+ "'"
							 + "target='_blank'></a>");
		    var cell1 = $("<h2 class='post-title' ></h2>").text(data.title);
		    article.append(cell1);
		    var cell2 = $("<p class='post-meta'></p>").text(data.createDate);
			var vid = $('<video width="300" height="200" controls><source src="http://tzeing.asuscomm.com/video/'
			        	+ decodeURIComponent(data.fileName)	+ '" type="video/mp4"></video>')
	       	var cell3 = $("<p></p>").html(data.content.substring(0,100));
			var row = $('<tr class="post-preview"></tr>').append([article,cell2,vid,cell3]);
			doc.append(row);
			});
			$('#tbody').append(doc);
			$("#title").tablepage($("#table_page"),5);
			})
		}
			
		 });
		 //點擊數
		$('#title').on('click', '.heltitle', function() {
			var title = ($(this).attr('name'));		
			$.post("<c:url value='/healthcolumn/countarticle.controller'/>", {title : title}, function(data) {
			});
		})	
	</script>
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>