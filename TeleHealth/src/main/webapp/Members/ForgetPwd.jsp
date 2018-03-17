<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
 <jsp:include page="/fragment/nav2.jsp" />

<div class="container">
		<div style="text-align:center;"><h3 class="title">忘記密碼</h3></div>
			<div style="text-align:center;"><p>請輸入會員登記E-Mail，系統將發送密碼至您的E-Mail
</p></div>
		<div class="row">
			<div class="col-3"></div>
				<div class="col-6">
					<div class="from-group">
						<form method="post" enctype="multipart/form-data" 
						action="<c:url value="/ForgetPwd.controller"/>">
							<div class="row">
								<label for="oldpwd">會員註冊E-Mail：</label>
								 <input name="account" type="text" id="account" value="${param.account}" class="fieldWidth" style="width: 320px;" required>
								<font color="red" size="-1">${MsgMap.errorAccount}</font>  
								<span id="checkAccount"></span>
							</div>
							<div class="row"><p> </p></div>
							
							
					<div style="text-align:center;">		
                          <button type="submit" class="btn-primary" style="background-color: #f58200; border: 1px solid #da7d00;
                        font-size: 14px; color: #fff; text-shadow: 1px 1px 1px #666; padding: 5px 10px;
                        border-radius: 4px; box-shadow: 1px 1px 3px #aaa; font-weight: bold; text-align: center;
                        cursor: pointer;">確定</button>
                          
                        <a href="<c:url value="/home.jsp"/>"><input type="button" class="btn-primary" value="回主頁" style="background-color: #f58200; border: 1px solid #da7d00;
                        font-size: 14px; color: #fff; text-shadow: 1px 1px 1px #666; padding: 5px 10px;
                        border-radius: 4px; box-shadow: 1px 1px 3px #aaa; font-weight: bold; text-align: center;
                        cursor: pointer;"></button></a>
                        </div>

						</form>		
					</div>
				</div>
			<div class="col-3"></div>
		</div>	
	</div>

<jsp:include page="/fragment/footer.jsp" />

</script>
</body>
</html>
