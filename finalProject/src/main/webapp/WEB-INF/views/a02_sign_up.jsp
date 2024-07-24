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
<!-- vue-->
<script src="https://unpkg.com/vue" type="text/javascript"></script> 

<!-- jQuert 선언 -->
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


</head>

<body class="bg-gray-200">
  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">
        
      </div>
    </div>
  </div>
  <main class="main-content  mt-0" id="app">
    <div class="page-header align-items-start min-vh-100" style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
      <span class="mask bg-gradient-dark opacity-6"></span>
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom">
              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1" style="background: linear-gradient(#6A82FB,#B06AB3);">
                  <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">Sign Up</h4>
                  <div class="row mt-3">
                    
                    
                    
                  </div>
                </div>
              </div>
              <div class="card-body">
                <form role="form" class="text-start">
     <!-- 사용자 이름  -->
                  <div class="input-group input-group-outline my-3">
                    <label class="form-label">Name</label>
                    <input type="text" class="form-control" name="user_name" value=""  required>
                  </div>
     <!-- 로그인 아이디  -->
                  <div class="input-group input-group-outline my-3">
                    <label class="form-label">ID</label>
                    <input type="text" class="form-control" name="user_id" value=""required>
                  </div>
     <!-- 비밀번호  -->
                  <div class="input-group input-group-outline my-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" value=""  required>
                  </div>
      <!-- 권한 --> 
	                <div class="input-group input-group-outline my-3">
				      <label for="receive_yn" class="col-sm-4 col-form-label">Role code</label>
				      <select class="form-control mr-sm-2">
				        <option value="">부서선택</option>
				        <option v-for="(dept, key) in department" v-bind:value="key">{{ dept }}</option>
				      </select>
				     
				    </div>


                  <div class="input-group input-group-outline my-3">
                    <label class="form-label">Company Name</label>
                    <input type="text" class="form-control" name="company_id" value=""  >
                  </div>
                  <div class="input-group input-group-outline my-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" value="" required>
                  </div>
                  <div class="input-group input-group-outline mb-3">
                    <label class="form-label">Department</label>
                    <input type="text" class="form-control" name="department" value=""  required>
                  </div>
                  
                  <div class="text-center">
                    <button type="button" class="btn bg-gradient-primary w-100 my-4 mb-2" style="background:#B06AB3">Sign in</button>
                  </div>
                  <p class="mt-4 text-sm text-center">
                    Don't have an account?
                    <a href="../pages/sign-up.html" class="text-primary text-gradient font-weight-bold" style="color:#3f2b96;">Sign up</a>
                  </p>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer position-absolute bottom-2 py-2 w-100">
        <div class="container">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-12 col-md-6 my-auto">
              <div class="copyright text-center text-sm text-white text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>,
                made with <i class="fa fa-heart" aria-hidden="true"></i> by
                <a href="https://www.creative-tim.com" class="font-weight-bold text-white" target="_blank">Creative Tim</a>
                for a better web.
              </div>
            </div>
            <div class="col-12 col-md-6">
              <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                <li class="nav-item">
                  <a href="https://www.creative-tim.com" class="nav-link text-white" target="_blank">Creative Tim</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/presentation" class="nav-link text-white" target="_blank">About Us</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/blog" class="nav-link text-white" target="_blank">Blog</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-white" target="_blank">License</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </main>
  <!--   Core JS Files   -->
  <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>
  <script src="${path}/material-dashboard-2/assets/js/core/popper.min.js"></script>
  <script src="${path}/material-dashboard-2/assets/js/core/bootstrap.min.js"></script>
  <script src="${path}/material-dashboard-2/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${path}/material-dashboard-2/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script type="text/javascript">
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
    
    $(document).ready(function() {
        $("[name='receive_yn']").change(function() {
            var val = $(this).val();
            $("[name='role_code']").val(val);
        });
    });
    
	
    var model = {	department:{10:'인사',20:'재무',30:'회계', 40:'IT개발'}
    };
    var vm = Vue.createApp({
      
       data(){
          return model;
       }
    });
    vm.mount("#app");

</script>


  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${path}/material-dashboard-2/assets/js/material-dashboard.min.js?v=3.0.0"></script>
</body>

</html>