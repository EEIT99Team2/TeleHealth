<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/fragment/nav2.jsp" />
	<ul
		class="nav nav-tabs justify-content-center w3-padding-large w3-card "
		id="myTab" role="tablist">

		<li class="nav-item"><input type="button" class="nav-link active"
			id="BOD" data-toggle="tab" role="tab" value="修改資料"
			onclick="location.href='<c:url value='/Members/ModifyData.jsp'/>'" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="修改密碼"
			onclick="location.href='<c:url value='/Members/ChangePwd.jsp'/>'" /></li>
		<li class="nav-item"><input type="button" class="nav-link active"
			id="checkPoint" data-toggle="tab" role="tab" value="點數查詢" /></li>		
		<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="儲值紀錄"
			onclick="location.href='<c:url value='/Members/Point.jsp'/>'" /></li>
			<c:url value='' />
			<li class="nav-item"><input type="button" class="nav-link active"
			id="FOO" data-toggle="tab" role="tab" value="儲值點數"
			onclick="location.href='<c:url value='/pay/pay.jsp'/>'" /></li>
						
		<li class="nav-item"><input type="button" class="nav-link active"
		id="FOO" data-toggle="tab" role="tab" value="我的留言"
		onclick="location.href='questionMempublish.jsp'" /></li>
		
	</ul>
	
	<script>
		$(document).ready(function() {
			$("#qty").change(function() {
				var qty = $(this).val();
				// value
				$(this).attr("value", qty);
				// point
				var qty2 = parseInt(qty);
				if (qty2 >= 20) {
					var bonus = qty2 + (Math.floor(qty2 / 20) * 2);
					$("#point").text(bonus);
				} else {
					$("#point").text(qty2);
				}
				// amount
				var amount = 50 * qty2;
				$(".amount").text(amount);

				// 必須是數字 不能為負
			});
			$("#decrease").click(function() {
				var qty = $("#qty").val();
				var qty2 = parseInt(qty);
				// decrease
				var result = qty2 - 1;
				$("#qty").val(result);
				// value
				$("#qty").attr("value", result);
				// point
				if (qty2 >= 20) {
					var bonus = qty2 + (Math.floor(qty2 / 20) * 2);
					$("#point").text(bonus);
				} else {
					$("#point").text(result);
				}
				// amount
				var amount = 50 * qty2;
				$(".amount").text(amount);

				// 最小為1
			});
			$("#increase").click(function() {
				var qty = $("#qty").val();
				var qty2 = parseInt(qty);
				// increase
				var result = qty2 + 1;
				$("#qty").val(result);
				// value
				$("#qty").attr("value", result);
				if (qty2 >= 20) {
					var bonus = qty2 + (Math.floor(qty2 / 20) * 2);
					$("#point").text(bonus);
				} else {
					$("#point").text(result);
				}
				// amount
				var amount = 50 * qty2;
				$(".amount").text(amount);
			});

			
			//     function check() {
			//     	var regexp = RegExp("^/+?[1-9][0-9]*$");
			//     	var point = $(".text").val();
			//     	if (regexp.test(point) == false) {
			//     		$("#msg").append("<br /><p>123</p>");
			//     	}
			//     };
		});
	</script>
	<form action="../checkout.do" method="POST">
		<div class="container">
			<div class="row border border-primary">
				<div class="col">
					<h1>購物車</h1>
				</div>
			</div>
			<div class="row border border-primary">
				<div class="col-3">商品資料</div>
				<div class="col-2">優惠</div>
				<div class="col-2 text-center">每點價格</div>
				<div class="col-3 text-center">點數</div>
				<div class="col-2 text-center">小計</div>
			</div>
			<div class="row border border-primary">
				<div class="col-3">
					<img class="small" width="200" src="<c:url value="/images/point.png" />" /> <br />
					<p>1點</p>
				</div>
				<div class="col-2"></div>
				<div class="col-2 text-center">
					<span>NT$50</span>
				</div>
				
				<!-- Point -->
				<div class="col-3 text-center">
					<div id="msg" class="input-group input-group-sm mb-3">
						<!-- - #decrease -->
						<div class="input-group-prepend">
							<button id="decrease" class="btn btn-outline-secondary"
								type="button">
								<i class="fa fa-minus"></i>
							</button>
						</div>
						<!-- - End -->
						
						
						<!-- text input #qty -->
						<input type="text" id="qty" name="quantity" value="1"
							class="form-control text-center" aria-label=""
							aria-describedby="basic-addon1" />
						<!-- text input End -->	
						
						
						<!-- + #increase -->	
						<div class="input-group-prepend">
							<button id="increase" class="btn btn-outline-secondary"
								type="button">
								<i class="fa fa-plus"></i>
							</button>
						</div>
						<!-- + End -->
					</div>
				</div>
				<!-- Point End -->
				
				<!-- Amount .amount -->
				<div class="col-2 text-center">
					<span>NT$</span> <span class="amount">50</span>
				</div>
				<!-- Amount End -->
				
			</div>
			<br />
			<div class="row">
				<div class="col-8">
					<section>
					<div>
						<h3>付款方式</h3>
					</div>
					<div>
						<p>信用卡(經由綠界)</p>
					</div>
					</section>
				</div>
				<div class="col-4">
					<section>
					<div>
						<h3>訂單資訊</h3>
					</div>
					
					<!-- Point #point -->
					<div class="clearfix">
						<span>點數:</span>
						<div class="float-right">
							<span id="point">1</span> <span>點</span>
						</div>
					</div>
					<!-- Point End -->
					
					<!-- Amount .amount -->
					<div class="clearfix">
						<span>合計:</span>
						<div class="float-right">
							<span>NT$</span> <span class="amount">50</span>
						</div>
					</div>
					<!-- Amount End -->
					
					<input class="btn btn-success btn-block" type="submit"
						name="Checkout" value="Checkout" /> </section>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>