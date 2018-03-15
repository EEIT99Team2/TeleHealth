<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
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
			id="BOD" data-toggle="tab" role="tab" value="修改資料"
			onclick="location.href='ModifyData.jsp'" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="修改密碼"
			onclick="location.href='ChangePwd.jsp'" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="CHR" data-toggle="tab" role="tab" value="點數查詢" /></li>
		
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home" role="tabpanel"
			aria-labelledby="home-tab">
			<!-- Main Content -->
			<div class="container">
				<div class="row">
					<table class="col-lg-4 col-md-10 mx-auto" id="title">
						<tbody id="tbody">
							<tr class="post-preview">
							會員專區~~~~
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
</body>
</html>