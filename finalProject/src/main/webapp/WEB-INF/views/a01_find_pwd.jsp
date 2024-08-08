<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">
<!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%-- material link --%>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<link rel="apple-touch-icon" sizes="85x85" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">
  	<link rel="icon" sizes="85x85" type="image/png" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">
	 <!--     Fonts and icons     
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  -->
  <!-- Nucleo Icons -->
  <link href="${path}/material-dashboard-2/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/material-dashboard-2/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons   -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>

  <!-- Material Icons 
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
 -->
  <!-- CSS Files -->
  
  <link id="pagestyle" href="${path}/material-dashboard-2/assets/css/material-dashboard.css?v=3.0.0" rel="stylesheet" />
	
<%--다시 adminkit --%>

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="${path}/adminkit-3.1.0/img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />

	<title>HPM-Project Manager System</title>

	<link href="${path}/adminkit-3.1.0/static/css/app.css" rel="stylesheet">
<%-- 	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
--%>
<script type="text/javascript">

	$(document).ready(function(){

		var msg = "${msg}"
		if(msg!=""){
			alert(msg)
			if(msg!="해당 계정 정보 없습니다"){
				if(confirm("로그인 화면으로 이동하시겠습니까?")){
					location.href="signinFrm"
				}
			}
		}
		
		$("#pwdBtn").click(function() { 
			var nameInput = document.querySelector('[name=user_name]');
	        var name = nameInput.value;
			var idInput = document.querySelector('[name=user_id]');
	        var id = idInput.value;
			var emailInput = document.querySelector('[name=email]');
	        var email = emailInput.value;
	        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;	
	        
	        if(name === "") {
	            alert("이름을 입력하세요");
	            nameInput.focus();
	        } else if(id === "") {
	            alert("ID를 입력하세요");
	            idInput.focus();
	        } else if(email === "") {
	            alert("이메일 주소를 입력하세요");
	            emailInput.focus();
	        } else if (!emailPattern.test(email)) {
	            alert('이메일 형식에 맞지 않습니다');
	            emailInput.focus();
	        } else {
	            $("form").submit()
	        }	        
	    });
		
	});
    
	
	
</script>
</head>

<body class="bg-gray-200">
  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">
        <!-- Navbar -->
        
        <!-- End Navbar -->
      </div>
    </div>
  </div>
  <main class="main-content  mt-0">
    <div class="page-header align-items-start min-vh-100" style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
      <span class="mask bg-gradient-dark opacity-6"></span>
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom">
              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1" style="background: linear-gradient(#6A82FB,#B06AB3);">
                  <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">Find Password</h4>
                  <div class="row mt-3">
                   
                  </div>
                </div>
              </div>
              <div class="card-body">
                <form role="form" class="text-start" action="find_pwd" method="post">
                  <div class="input-group input-group-outline my-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="user_name" class="form-control">
                  </div>
                  <div class="input-group input-group-outline my-3">
                    <label class="form-label">ID</label>
                    <input type="text" name="user_id" class="form-control">
                  </div>
                  <div class="input-group input-group-outline mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control">
                  </div>
                 
                  <div class="text-center">
                    <button type="button" id="pwdBtn" class="btn bg-gradient-primary w-100 my-4 mb-2" style="background:#B06AB3">Find Password</button>
                  </div>
                  <p class="mt-4 text-sm text-center">
                    Are you ready to log in?
                    <a href="signinFrm" class="text-primary text-gradient font-weight-bold" style="color:#3f2b96;">Login</a>
                  </p>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <!--   Core JS Files   -->
  <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>
  <script src="${path}/material-dashboard-2/assets/js/core/popper.min.js"></script>
  <script src="${path}/material-dashboard-2/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/material-dashboard-2/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/material-dashboard-2/assets/js/plugins/smooth-scrollbar.min.js"></script>
  
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${path}/material-dashboard-2/assets/js/material-dashboard.min.js?v=3.0.0"></script>
</body>

</html>