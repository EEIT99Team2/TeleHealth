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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script src="<c:url value='forCkeditor/ckeditor/ckeditor.js' />"></script>
<script src="<c:url value='forCkeditor/ckfinder/ckfinder.js' />"></script>
<link rel="stylesheet" href="<c:url value='forCkeditor/ckeditor/contents.css' />">
	

</head>
<body>
  <script type="text/javascript">
   $(document).ready(function() {
    CKEDITOR.replace('content',{
    		filebrowserBrowseUrl : 'forCkeditor/ckfinder/ckfinder.html',
    		filebrowserImageBrowseUrl : 'forCkeditor/ckfinder/ckfinder.html?type=Images', 
    		filebrowserFlashBrowseUrl : 'forCkeditor/ckfinder/ckfinder.html?type=Flash',
    		filebrowserUploadUrl : 'forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files', 
    		filebrowserImageUploadUrl : 'forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images', 
    		filebrowserFlashUploadUrl : 'forCkeditor/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash' 	
    }	 );
    console.log("ready!");
   });
  </script>
 
  <form action="/TeleHealth/Healthcolumn/inshealthcolumn.controller" method="post" >
  <input type="text" name="name" id="title" value="黑傑克"> 
  <h3>標題:<input type="text" name="title" id="title" placeholder="title"></h3><p style="color:red">${errors.errortitleEmpty}</p>
  <h3>影片上傳:<input type="file" name="file" id=video accept="video/*" /></h3>
  <h3>文章類型:<select name="type">
       <option id="BOB" value="BOB">塑身減重</option>
       <option id="FOO" value="FOO">飲食資訊</option>
       <option id="OLD" value="OLD">銀髮照護</option>
       <option id="CHR" value="CHR">慢性疾病  </option>
       <option id="EYE" value="EYE">眼睛保健</option>
       <option id="VIO" value="VIO">影音專區</option>
       </select></h3>
       <p style="color:red">${errors.errorcontentEmpty}</p>
       <textarea name="content" id="content" rows="10" cols="80"></textarea>
       <input type="submit" value='送出' onclick="return(confirm('確認要送出本表單嗎？'))">      
       <input type="reset" id="clean" value="清除重選" onclick='clean()' >
  </form>        
</body>
</html>