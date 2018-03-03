<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor"%>     
 <%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
<script src="../ckfinder/ckfinder.js"></script>
<link rel="stylesheet" href="../ckeditor/contents.css">
	

</head>
<body>
  <script type="text/javascript">
   $(document).ready(function() {
    CKEDITOR.replace('content',{
    		filebrowserBrowseUrl : '../ckfinder/ckfinder.html',
    		filebrowserImageBrowseUrl : '../ckfinder/ckfinder.html?type=Images', 
    		filebrowserFlashBrowseUrl : '../ckfinder/ckfinder.html?type=Flash',
    		filebrowserUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files', 
    		filebrowserImageUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images', 
    		filebrowserFlashUploadUrl : '../ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash' 	
    }	 );
    console.log("ready!");
   });
  </script>
 
  <form action="/TeleHealth/Healthcolumn/inshealthcolumn.controller" method="post" >
  <input type="text" name="name" id="title" value="d43b1906-f319-40dc-9e11-4da09a2558af"> 
  <h3>標題:<input type="text" name="title" id="title1" placeholder="title"></h3><p style="color:red">${errors.errortitleEmpty}</p>
  <h3>影片上傳:<input type="file" name="file1" id="video" accept="video/*" /></h3><p style="color:red">${errors.errorVideo}</p>
  <h3>文章類型:<select name="type">
       <option id="BOB" value="BOD">塑身減重</option>
       <option id="FOO" value="FOO">飲食資訊</option>
       <option id="OLD" value="OLD">銀髮照護</option>
       <option id="CHR" value="CHR">慢性疾病  </option>
       <option id="EYE" value="EYE">眼睛保健</option>
       <option id="VID" value="VID">影音專區</option>
       </select></h3>
       <p style="color:red">${errors.errorcontentEmpty}</p>
       <textarea name="content" id="content" rows="10" cols="80"></textarea>
       <input type="submit" value='送出' onclick="return(confirm('確認要送出本表單嗎？'))">      
       <input type="reset" id="clean" value="清除重選" onclick='clean()' >
       <p style="color:green">${msgOK.uploadok}${errors.uploaderror}</p>
  </form>        
</body>
</html>