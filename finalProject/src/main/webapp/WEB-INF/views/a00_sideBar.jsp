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
	<link rel="shortcut icon" href="${path}/adminkit-3.1.0/img/icons/icon-48x48.png" />

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
		$("#pmGantt").hide()
		$("#Output").hide()
		$("#todo").show()
		if("${sessionScope.role_code}"=="P"){
			$("#pmGantt").show()
			$("#Output").show()
		}
		
		 // 현재 URL을 JavaScript 변수로 설정
        var currentUrl = window.location.pathname;
        if(currentUrl.includes('todoFrm')){
            $("#todo").hide();
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

            <li class="sidebar-item ${currentUrl == '/dashpmFrm' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('dashpmFrm')">
                    <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                </a>
            </li>
			
            <li class="sidebar-item ${currentUrl == '/profile' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('profile')" >
                    <i class="align-middle" data-feather="user"></i> <span class="align-middle">profile</span>
                </a>
            </li>
            <li id="todo" class="sidebar-item ${currentUrl == '/todoFrm' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('todoFrm')" >
                    <i class="align-middle" data-feather="list"></i> <span class="align-middle">To Do List</span>
                </a>
            </li>
 			 
	    		<li id="pmGantt" class="sidebar-item ${currentUrl == '/gantt' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('gantt')">
                    <i class="align-middle" data-feather="align-left"></i> <span class="align-middle">Gantt</span>
                </a>
            	</li>			
           <li class="sidebar-item ${currentUrl == '/fullcalendar' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('fullcalendar')">
                    <i class="align-middle" data-feather="calendar"></i> <span class="align-middle">Calendar</span>
                </a>
            </li>
            
            <li class="sidebar-item ${currentUrl == '/chart' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('chart')">
                    <i class="align-middle" data-feather="pie-chart"></i> <span class="align-middle">Chart</span>
                </a>
            </li>

            <li id="Output" class="sidebar-item ${currentUrl == '/Deliverables' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('Deliverables')">
                    <i class="align-middle" data-feather="command"></i> <span class="align-middle">Deliverables M</span>
                </a>
            </li>
            
              <li class="sidebar-item ${currentUrl == '/sign_up' ? 'active' : ''}">
	            <form id="logoutFrm" method="post" action="/logout">
				</form>			
	                <a class="sidebar-link" id="logoutBtn">
	                    <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">Log Out</span>
	                </a>	             
           	 </li>

        </ul>

				<div class="sidebar-cta">
					<div class="sidebar-cta-content">
						<strong class="d-inline-block mb-2">About Us</strong>
						<div class="mb-3 text-sm">
							Want to learn more about us? Click the button below to find out!
						</div>
						<div class="d-grid">
							<a href="board" class="btn btn-primary">Board</a>
						</div>
					</div>
				</div>
			</div>
		</nav> 

		<script src="${path}/adminkit-3.1.0/static/js/app.js"></script>
		 <script>
        $("#logoutBtn").click(function(){
			$("#logoutFrm").submit()
		})
        
        </script>
		<script>
		//var project_id="${sessionScope.project_id}"
		function goPage(url){
			
			location.href=url//+"?project_id="+project_id
		}
		</script>
</body>
</html>