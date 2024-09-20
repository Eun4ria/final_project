<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="apple-touch-icon" sizes="85x85" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">
  	<link rel="icon" sizes="85x85" type="image/png" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />

	<title>HPM-Project Manager System</title>

	<link href="${path}/adminkit-3.1.0/static/css/app.css" rel="stylesheet">
<%--	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	
 	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
--%>
<script src="${path}/adminkit-3.1.0/static/js/app.js"></script>
</head>
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#HR").hide()
	
	if("${sessionScope.role_code}"=="P"){
		$("#HR").show()
	}
});
</script>
</head>

<body>


 <nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="main">
          <span class="align-middle">HPM</span>
        </a>

				<ul class="sidebar-nav">
            <li class="sidebar-header">
                사용자
            </li>
            <li class="sidebar-item ${currentUrl == '/profile' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('profile')">
                    <i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
                </a>
            </li>	
            <%-- 	
            <li class="sidebar-item ${currentUrl == '/signinFrm' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('fullcalendar')">
                    <i class="align-middle" data-feather="calendar"></i> <span class="align-middle">Calendar</span>
                </a>
            </li>
            --%>
            
             <li id="HR" class="sidebar-item ${currentUrl == '/HR' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('HR')">
                    <i class="align-middle" data-feather="command"></i> <span class="align-middle"><strong>H</strong><small>uman</small> <strong>R</strong><small>esources</small></span>
                </a>                
            </li>

            <li class="sidebar-item ${currentUrl == '/logout' ? 'active' : ''}">
	            <form id="logoutFrm" method="post" action="/logout">
				</form>			
	                <a class="sidebar-link" id="logoutBtn">
	                    <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">Log Out</span>
	                </a>
	             
            </li>

        </ul>
        <script>
        $("#logoutBtn").click(function(){
			$("#logoutFrm").submit()
		})
        
        </script>
        
        

				<div class="sidebar-cta">
					<div class="sidebar-cta-content">
						<strong class="d-inline-block mb-2">About Us</strong>
						<div class="mb-3 text-sm">
							Want to learn more about us? Click the button below to find out!
						</div>
						<div class="d-grid">
							<a href="upgrade-to-pro.html" class="btn btn-primary">GIT Link</a>
						</div>
					</div>
				</div>
			</div>
		</nav> 

		<script src="${path}/adminkit-3.1.0/static/js/app.js"></script>
		<script>
		//var user_id="${sessionScope.user_id}"
		function goPage(url){
			location.href=url//+"?user_id="+user_id
		}
		</script>
</body>
</html>