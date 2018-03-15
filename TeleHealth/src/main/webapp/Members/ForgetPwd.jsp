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
		<div class="row">
			<div class="col-3"></div>
				<div class="col-6">
					<div class="from-group">
						<form method="post" action='<c:url value="/ModifyPwd.controller" />' >
							<div class="row">
								<label for="oldpwd">請輸入原密碼：</label>
								<input type="password" name="oldpwd" id="oldpwd" value="${param.oldpwd}" class="fieldWidth" style="width: 320px;">
								<span id="checkOldpwd"></span>
							</div>
							<div class="row"><p> </p></div>
							<div class="row">
								<label for="Newpwd">請輸入新密碼：</label>
								<input type="password" name="Newpwd" id="Newpwd" value="${param.Newpwd}" class="fieldWidth" style="width: 320px;">
								<span id="checkNewpwd"></span>
							</div>
							<div class="row"><p> </p></div>
							<div class="row">
								<label for="pwdCheck">請輸入新密碼：</label>
								<input type="password" name="pwdCheck" id="pwdCheck" value="${param.pwdCheck}" class="fieldWidth" style="width: 320px;">
								<span id="passwordCheck"></span>
							</div>
							<div class="row"><p> </p></div>
								<div style="text-align:center;">
								<input class="btn btn-primary" type="submit"name="submitBtn" id="submitBtn" value="送出">
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
