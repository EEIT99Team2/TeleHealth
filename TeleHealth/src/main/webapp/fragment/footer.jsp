<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- Footer -->
    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; TeleHealth 2018</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline">
              <li class="list-inline-item">
                <a href="#">
                  <i><img title="Logo" src="<c:url value="/images/logo.png" />" /></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
          
          </div>
        </div>
      </div>
    </footer>



<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>

    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
	<script src='https://www.google.com/recaptcha/api.js'></script>
