<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>
    忘記密碼頁面
</title>

</head>
<body>
    <div>
        
    <style>
        html { overflow-x: hidden; overflow-y: auto; }
        .fpbtn
        {
            font-size: 9pt;
        }
        .btn-primary
        {
            background: #f58200;
            background: -webkit-gradient(linear, left top, left bottom, from(#f99f00), to(#f58200));
            background: -moz-linear-gradient(top, #f99f00, #f58200);
            border: 1px solid #da7d00;
            color: white;
            text-shadow: 1px 1px 1px #666;
            padding: 5px 10px;
            border-radius: 4px;
            box-shadow: 1px 1px 3px #aaa;
            font-weight: bold;
            text-align: center;
            cursor: pointer;
            font-size: 14px;
        }
        .btn-primary:hover
        {
            background: #f58200;
        }
    </style>
     <form method="post" enctype="multipart/form-data" 
						action="<c:url value="/ForgetPwd.controller"/>">
   <div style="width: 480px; border: 0px solid #d2d2d2; margin: 0 auto; background-color: White;">
        <div class="cleardiv">
        </div>
        <div style="width: 480px; margin: 0px auto; padding-top: 25px;">
            <table class="ctbasictb3" width="98%" style=" margin-bottom:20px;">
                <tr>
                    <td rowspan="2" style="padding-left: 30px; padding-right: 20px;">
                        <img src="https://getez.info/uploads/201708/02/0849_OZOCH.gif" />
                    </td>
                    <td>
                        <span style="color: #000; font-size: 14px; font-weight: bold;">
                            會員註冊電郵</span><br />																	
                        <input name="account" type="text"  style="width: 250px;" /><br />	                                     		
                    	<font color="red" size="-1">${MsgMap.errorAccount}</font>  
                    </td>                    
                </tr>
                <tr>
                    <td style="padding-top: 10px; height:70px;">
                        <span style="float: left; margin-top: 3px;">
                            <img src="" /></span> <span style="font-size: 14px;
                                width: 250px; line-height: 23px;">
                                請輸入會員登記電郵址，系統將發送密碼至您的電郵信箱</span>
                    </td>
                </tr>
                <tr><td></td>
                    <td style=" color:Red;">
                        <label id="ContentPlaceHolder1_lbMSG">
                        </label>
                    </td>
                </tr>
            </table>
            <div style="width: 100%; background-color: rgb(235, 235, 235)">
                <div style="margin-left: 30%; padding-top: 10px; padding-bottom:10px; ">

                          <button type="submit" class="btn-primary">確定</button>
                          
                        <a href="<c:url value='/index.jsp' />"><input type="button" class="btn-primary" value="回主頁" style="background-color: #f58200; border: 1px solid #da7d00;
                        font-size: 14px; color: #fff; text-shadow: 1px 1px 1px #666; padding: 5px 10px;
                        border-radius: 4px; box-shadow: 1px 1px 3px #aaa; font-weight: bold; text-align: center;
                        cursor: pointer;"></button></a>
<!--                    		 <input type="button" class="btn-primary" value="回主頁"></a> -->
<%--                 <a href="<c:url value='/Members/Logout.jsp' />"><button class="btn btn-sm btn-outline-secondary" id="myBtn1">登出</button></a>	 --%>
                </div>
            </div>
            <div class="cleardiv">
            </div>
        </div>
    </div>
    </form>


    </div>



</body>
</html>
