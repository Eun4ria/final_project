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
<%--  세션 예외처리  
 <c:if test="${not empty alertMessage}">
    <script>
        alert("${alertMessage}");
        location.href = '${path}/signinFrm';
    </script>
</c:if> --%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#HR").hide()
		$("#todo").hide()
		$("#gantt").hide()
		$("#chart").hide()
		$("#budget").hide()
		var sessionRole = "${sessionScope.role_code}"
		var sessionPro = "${sessionScope.project_id}"
		
		if(sessionPro!=null && sessionPro!=""){
			$("#todo").show()
			$("#gantt").show()
			$("#chart").show()
		}
		if(sessionRole=="P"){
			$("#HR").show()
		}
		if(sessionRole=="B"){
			if(sessionPro!=null&&sessionPro!=""){
				$("#budget").show()
			}			
		}
		
		
	});
	
</script>
</head>

<body>

 <c:if test="${sessionScope.user_id == null || sessionScope.user_id == ''}">
    <script>
        alert("로그인이 필요한 서비스입니다.");
        location.href = 'signinFrm';
    </script>
</c:if>
 <nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="main">
          <span class="align-middle">HPM</span>
        </a>
		<ul class="sidebar-nav">
            <li id="main" class="sidebar-item ${currentUrl == '/main' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('main')">
                    <i class="align-middle" data-feather="x"></i> <span class="align-middle"><fmt:message key="main" /></span>
                </a>
            </li>
			<li id="profile" class="sidebar-item ${currentUrl == '/profile' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('profile')">
                    <i class="align-middle" data-feather="user"></i> <span class="align-middle"><fmt:message key="profile" /></span>
                </a>
            </li>	
             <li id="HR" class="sidebar-item ${currentUrl == '/HR' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('HR')">
                    <i class="align-middle" data-feather="command"></i> <span class="align-middle"><fmt:message key="human_resources" /></span>
                </a>                
            </li>    
            <li id="todo" class="sidebar-item ${currentUrl == '/todoFrm' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('todoFrm')" >
                    <i class="align-middle" data-feather="list"></i> <span class="align-middle"><fmt:message key="to_do_list" /></span>
                </a>
            </li>
 			 
	    		<li id="gantt" class="sidebar-item ${currentUrl == '/gantt' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('gantt')">
                    <i class="align-middle" data-feather="align-left"></i> <span class="align-middle"><fmt:message key="gantt" /></span>
                </a>
            	</li>			
           <li id="fullcalendar" class="sidebar-item ${currentUrl == '/fullcalendar' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('fullcalendar')">
                    <i class="align-middle" data-feather="calendar"></i> <span class="align-middle"><fmt:message key="calendar" /></span>
                </a>
            </li>
            
            <li id="chart" class="sidebar-item ${currentUrl == '/chart' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('chart')">
                    <i class="align-middle" data-feather="pie-chart"></i> <span class="align-middle"><fmt:message key="chart" /></span>
                </a>
            </li>

            <%-- <li id="Output" class="sidebar-item ${currentUrl == '/Deliverables' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('Deliverables')">
                    <i class="align-middle" data-feather="command"></i> <span class="align-middle">Deliverables M</span>
                </a>
            </li> --%>
            <li id="budget" class="sidebar-item ${currentUrl == '/budgetFrm' ? 'active' : ''}">
                <a class="sidebar-link" onclick="goPage('budgetFrm')">
                    <i class="align-middle" data-feather="dollar-sign"></i> <span class="align-middle"><fmt:message key="budget" /></span>
                </a>
            </li>
            
              <li class="sidebar-item ${currentUrl == '/sign_up' ? 'active' : ''}">
	            <form id="logoutFrm" method="post" action="/logout">
				</form>			
	                <a class="sidebar-link" id="logoutBtn">
	                    <i class="align-middle" data-feather="log-out"></i> <span class="align-middle"><fmt:message key="log_out" /></span>
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
							<a href="https://github.com/Eun4ria/final_project" class="btn btn-primary">GIT Link</a>
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
		//var user_id="${sessionScope.user_id}"
		function goPage(url){
			location.href=url//+"?project_id="+project_id
		}
		</script>
</body>
</html>