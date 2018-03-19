<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購買點數</title>
<style>
.size {
	font-size: 18px;
}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    /* display: none; <- Crashes Chrome on hover */
    -webkit-appearance: none;
    margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
}
</style>
</head>
<body>
	<jsp:include page="/fragment/nav2.jsp" />
	
	<form action="../checkout.do" method="POST">
		<div class="container">

			<div class="card bg-light mb-3">
				<div class="card-header">
					<h2>購買點數</h2>
				</div>
				<div class="card-body">
					<div class="row ">
						<div class="col-3">
							<h5 class="card-title">商品資料</h5>
						</div>
						<div class="col-2">
							<h5 class="card-title">優惠</h5>
						</div>
						<div class="col-2 text-center">
							<h5 class="card-title">每點價格</h5>
						</div>
						<div class="col-3 text-center">
							<h5 class="card-title">點數</h5>
						</div>
						<div class="col-2 text-center">
							<h5 class="card-title">小計</h5>
						</div>
					</div>
				</div>

				<div class="card-body row">
					<div class="col-3">
						<img class="small" width="200" title="1點" alt="1點" 
							src="<c:url value="/images/point.png" />" /> <br />
						</div>
					<div class="col-2"><p class="card-text">滿20點送2點</p></div>
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
							<input type="number" id="qty" name="quantity" value="1"
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
			</div>

			<br />
			<div class="container">
				<div class="row">
					<div class="card bg-light mb-3 col-6">
						<div class="card-header">
							<h3>付款方式</h3>
						</div>
						<div class="card-body">
							<h5 class="card-title">信用卡(經由綠界)</h5>
						</div>
					</div>

					<div class="col-1"></div>

					<div class="card bg-light mb-3 col-5">
						<div class="card-header">
							<h3>訂單資訊</h3>
						</div>
						<div class="card-body">

							<!-- Point #point -->
							<div class="clearfix">
								<span class="size">點數:</span>
								<div class="float-right">
									<span id="point" class="size">1</span> <span class="size">點</span>
								</div>
							</div>
							<!-- Point End -->

							<!-- Amount .amount -->
							<div class="clearfix">
								<span class="size">合計:</span>
								<div class="float-right">
									<span class="size">NT$</span> <span class="amount size">50</span>
								</div>
							</div>
							<!-- Amount End -->
							<br /> <input id="pay" class="btn btn-success btn-block" type="submit"
								name="Checkout" value="付款" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		var btn = document.getElementById("decrease"),
			pay = document.getElementById("pay");
		$(document).ready(function() {
			if ($("#qty").val() <= 1) {
				btn.setAttribute("disabled", "disabled");
			}
			$("#qty").change(function() {
				var qty = $(this).val();
				// value
				$(this).attr("value", qty);
				// point
				
				if (qty >= 1) {
					btn.removeAttribute("disabled");
				}
				
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
			});
		    $("#qty").keydown(function (e) {



			    
		        // Allow: backspace, delete, tab, escape, enter and .(110)
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
		             // Allow: Ctrl/cmd+A
		            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: Ctrl/cmd+C
		            (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: Ctrl/cmd+X
		            (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: home, end, left, right
		            (e.keyCode >= 35 && e.keyCode <= 39)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
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
				
				if (result <= 1) {
					btn.setAttribute("disabled", "disabled");
				}
				
				if (result >= 20) {
					var bonus = result + (Math.floor(result / 20) * 2);
					$("#point").text(bonus);
				} else {
					$("#point").text(result);
				}
				// amount
				var amount = 50 * result;
				$(".amount").text(amount);
			});
			$("#increase").click(function() {
				var qty = $("#qty").val();
				var qty2 = parseInt(qty);
				// increase
				var result = qty2 + 1;
				$("#qty").val(result);
				// value
				$("#qty").attr("value", result);
				// point
				
				if (result >= 1) {
					btn.removeAttribute("disabled");
				}
				
				if (result >= 20) {
					var bonus = result + (Math.floor(result / 20) * 2);
					$("#point").text(bonus);
				} else {
					$("#point").text(result);
				}
				// amount
				var amount = 50 * result;
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
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>