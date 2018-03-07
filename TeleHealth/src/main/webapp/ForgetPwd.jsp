<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>
    忘記密碼頁面
</title>
<!--     <link href="/css/web.css" rel="stylesheet" type="text/css" /> -->
<!--     <link href="/css/validform.css" rel="stylesheet" type="text/css" /> -->
<!--     <link href="/css/datagrid.css" rel="stylesheet" type="text/css" /> -->
<!--     <link href="/css/wbox/wbox.css" rel="stylesheet" type="text/css" /> -->

<!--     <script type="text/javascript" src="/js/jquery-1.8.0.min.js"></script> -->
<!--     <script type="text/javascript" src="/js/Validform_v5.0.js"></script> -->
<!--     <script type="text/javascript" src="/js/common.js"></script> -->
<!--     <script type="text/javascript" src="/js/My97DatePicker2/WdatePicker.js"></script> -->
<!--     <script type="text/javascript" src="/js/wbox.js"></script> -->
<!-- <script> -->
<!-- //             (function (i, s, o, g, r, a, m) { -->
<!-- //                 i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () { -->
<!-- //                     (i[r].q = i[r].q || []).push(arguments) -->
<!-- //                 }, i[r].l = 1 * new Date(); a = s.createElement(o), -->
<!-- //   m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m) -->
<!-- //             })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga'); -->

<!-- //             ga('create', 'UA-13234389-1', 'auto'); -->
<!-- //             ga('send', 'pageview'); -->

<!-- </script> -->
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
<!-- <div class="aspNetHidden"> -->
<!-- <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTEzMDYyNzE2NTNkZHSkEY+2YLnJHHA49DPBlJdp/vzrYH2JKHrInN6HIfqH" /> -->
<!-- </div> -->

<!-- <div class="aspNetHidden"> -->

<!-- 	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="1B8B6C4A" /> -->
<!-- 	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEdAATNDm8Po4UrrrK7KALcw09BV/W0gDAOkD+neJAATSx0O/Ry0Q+gDmkr9wvBe23t60Tp/n7Z45JRmPMilCxxl2WG3dPkqZ2t7ZH3jE1X511efhDeRiCbjRcD/TccfStckH4=" /> -->
<!-- </div> -->
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
                       <button type="submit" style="background-color: #f58200; border: 1px solid #da7d00;
                        font-size: 14px; color: #fff; text-shadow: 1px 1px 1px #666; padding: 5px 10px;
                        border-radius: 4px; box-shadow: 1px 1px 3px #aaa; font-weight: bold; text-align: center;
                        cursor: pointer;">取消</button>
                   		 <input type="button" class="btn-primary" value="回主頁" onclick="location.href='index.jsp'">
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
