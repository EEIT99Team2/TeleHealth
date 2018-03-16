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
	<script>
		$(document).ready(function() {
			$(".text").change(function() {
				var quantity = $(this).val();
				$(this).attr("value", quantity);

				var point = $(".text").val();
				// !!!
				if (point >= 20) {
					$(".point").text(parseInt(point) + 2);
				} else {
					$(".point").text(point);
				}

				//         console.log(check());

				var dollar = 50 * $(".text").val();
				$(".price").text("NT$" + dollar);
			});
			$("#decrease").click(function() {
				var quantity = $(".text").val();
				var result = $(".text").val(quantity - 1);

				var point = $(".text").val();
				// !!!
				if (point >= 20) {
					$(".point").text(parseInt(point) + 2);
				} else {
					$(".point").text(point);
				}

				var dollar = 50 * $(".text").val();
				$(".price").text(dollar);
			});
			$("#increase").click(function() {
				// 數量
				var qty1 = $(".text").val();
				$(".text").val(parseInt(qty1) + 1);

				// 點數
				var qty2 = $(".text").val();
				$(".point").text(qty2);
				var point = $(".point").text();
				if (qty2 % 20 == 0) {
					var bonus = qty2 / 20 * 2;
					$(".point").text(parseInt(point) + bonus);
					$(".point").text() + 1; // parseint
				}

				// 合計
				var dollar = 50 * $(".text").val();
				$(".price").text(dollar);
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
						<!-- - -->
						<div class="input-group-prepend">
							<button id="decrease" class="btn btn-outline-secondary"
								type="button">
								<i class="fa fa-minus"></i>
							</button>
						</div>
						<!-- - End -->
						
						
						<!-- text input -->
						<input type="text" name="quantity" value="1"
							class="text form-control text-center" aria-label=""
							aria-describedby="basic-addon1" />
						<!-- text input End -->	
						
						
						<!-- + -->	
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
				<div class="col-2 text-center">
					<span>NT$</span> <span class="price">50</span>
				</div>
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
					<div class="clearfix">
						<span>點數:</span>
						<div class="float-right">
							<span class="point">1</span> <span>點</span>
						</div>
					</div>
					<div class="clearfix">
						<span>合計:</span>
						<div class="float-right">
							<span>NT$</span> <span class="price">50</span>
						</div>
					</div>

					<input class="btn btn-success btn-block" type="submit"
						name="Checkout" value="Checkout" /> </section>
				</div>
			</div>
		</div>
	</form>
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>