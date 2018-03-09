<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<div class="modal-header" style="padding: 35px 50px;">
						<h4 class="modal-title">Login</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">

						<form method="post" enctype="multipart/form-data"
							action="<c:url value="/login.controller"/>">
							<div class="form-group">
								<label for="usrname">Username</label> <input type="text"
									class="form-control" name="usrname" id="usrname"
									placeholder="Enter email" value="${param.usrname}"> <font
									color="red" size="-1">${MsgMap.errorUsrName}</font>
							</div>
							<div class="form-group">
								<label for="psw"> </span> Password
								</label> <input type="password" class="form-control" name="psw" id="psw"
									placeholder="Enter password">
							</div>
							<font color="red" size="-1">${MsgMap.errorPsw}</font>
							<div class="checkbox">
								<label> <input type="checkbox" value="" checked />
									Remember me
								</label>
							</div>
							<button type="submit" class="btn btn-success btn-block">Login</button>
							<button type="submit" class="btn btn-danger btn-block">Cancel</button>
						</form>

					</div>
					<div class="modal-footer">
						<p>
							Not a member? <a href="Members/register.jsp">Sign Up</a>
						</p>
						<p>
							Forgot <a href="Members/ForgetPwd.jsp">Password?</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-3">
		</div>
		<div class="col-6">
			<div class="w3-container marketing " style="padding: 128px 16px" id="team">
				<h1 class="w3-center">藥品外觀暨藥性查詢</h1>
				<form class="form-group" action="/   ">
					<div class="form-group has-success has-feedback">
				    	<label class="col-2 control-label" for="drugChinese">藥品中文名稱:</label>
				    	<div class="col-10">
				    		<input type="text" class="form-control" id="drugChinese">
				        	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
				      	</div>
	   				</div>
	   				<div class="form-group has-success has-feedback">
				    	<label class="col-2 control-label" for="drugEnglish">藥品英文名稱:</label>
				    	<div class="col-10">
				    		<input type="text" class="form-control" id="drugEnglish">
				        	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
				      	</div>
	   				</div>
	   				<div class="form-group has-success has-feedback">
				    	<label class="col-2 control-label" for="manu">製造商:</label>
				    	<div class="col-10">
				    		<input type="text" class="form-control" id="manu">
				        	<span class="glyphicon glyphicon-ok form-control-feedback"></span>
				      	</div>
	   				</div>
					<div class="form-group">
						<label class="control-label col-2">藥品刻痕:</label>
						<div class="col-10">
							<label class="radio-inline">
	     							<input type="radio" name="optradio" value="Y">有
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="N">無
	   						</label>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-2">藥品顏色:</label>
						<div class="col-10">
							<label class="radio-inline">
	     							<input type="radio" name="optradio" value="white">白色
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="red">紅色
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="orange">橘色
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="yellow">黃色
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="green">綠色
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="blue">藍色
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="purple">紫色
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="coffee">咖啡色
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="brown">褐色
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="black">黑色
	   						</label>    	    						
						</div>
						
						<label class="control-label col-2">藥品劑型:</label>
						<div class="col-10">
							<label class="radio-inline">
	     							<input type="radio" name="optradio" value="ingot">錠劑
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="film">膜衣錠
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="sugar">糖衣錠
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="capsule">膠囊
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="powder">粉劑
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="dispersion">散
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="particles">顆粒
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="mouth">口溶錠
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="Chewing">咀嚼錠
	   						</label>
	   						<label class="radio-inline">
	     							<input type="radio" name="optradio" value="enteric">腸溶錠
	   						</label>    	    						
						</div>
					</div>
					<div class="form-group">
						<div class="col-offset-2 col-10">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-3" >
	</div>
	<!-- Footer -->
	<jsp:include page="/fragment/footer.jsp" />
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. -->
	<script src="<c:url  value='/holder.min.js' />"></script>
	<script src="<c:url  value='/scripts.js' />"></script>


</body>

</html>