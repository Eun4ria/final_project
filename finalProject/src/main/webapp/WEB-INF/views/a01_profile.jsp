<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
<script>
	var msg="${msg}"
	var sessionUser_id = "${sessionScope.user_id}"
	function projectPage(project_id){ // 프로젝트 리스트에서 해당 프로젝트의 행을 클릭했을 때 실행되는 함수
		if(sessionUser_id!="" && sessionUser_id!=null){
			$("[name=project_id]").val(project_id)
			$("#proPage").submit()
		}
	}
</script>
<style>
	.project-item:hover{
		cursor:pointer;
		background-color:lightgray;
		border-radius:10px;
		transition: background-color 0.3s ease;
	}
</style>
</head>

<body>

	<div class="wrapper">
	<jsp:include page="a00_sideBar.jsp"/> 
	
		<div class="main">			
        <jsp:include page="a00_top.jsp"/>

			<main class="content">
			
				<div class="container-fluid p-0">
					<div class="mb-3">
						<h1 class="h3 d-inline align-middle"><fmt:message key="profile" /></h1>
						<%--언어 선택 폼--%>
						<form class="float-end" method="get" action="profile" class="selectLan">
							<select name="lang" onchange="this.form.submit()">
								<option><fmt:message key="chlang" /></option>
								<option value="en" ${param.lang == 'en' ? 'selected' : ''}>English</option>
								<option value="ko" ${param.lang == 'ko' ? 'selected' : ''}>한국어</option>
								<option value="fa" ${param.lang == 'fa' ? 'selected' : ''}>فارسی</option>
							</select>
						</form>
					</div>
					
					<div class="row">
						<div class="col-md-4 col-xl-5">
						    <form class="card mb-3" method="post" action="profile" enctype="multipart/form-data">
						        <div class="card-header">
						            <h5 class="card-title mb-0"><fmt:message key="profile_details" /></h5>
						        </div>
						        <div class="card-body text-center">
						            <img src="${profile.image}" style="width: 40%; height: auto;" class="avatar img-fluid rounded me-1" alt="Profile Picture" />
						            <br><br>
						
						            <div class="form-group">
						                <label class="btn btn-outline-primary">
						                    <fmt:message key="update_image_file" />
						                   <input type="file"  name="imageFname" class="form-control"/>	
						                </label>
						            </div>					
						        </div>
						        <hr class="my-0" />
						
						        <div class="card-body">
						            <h5 class="h6 card-title"><fmt:message key="info" /></h5>
						            <div class="form-group">
						                <label for="userId"><fmt:message key="id" /></label>
						                <input type="text" class="form-control" id="userId" name="user_id" value="${profile.user_id}" readonly>
						            </div>
						
						            <div class="form-group">
						                <label for="name"><fmt:message key="name" /></label>
						                <input type="text" class="form-control" id="name" name="user_name" value="${profile.user_name}">
						            </div>
						
						            <div class="form-group">
						                <label for="email"><fmt:message key="email" /></label>
						                <input type="email" class="form-control" id="email" name="email" value="${profile.email}">
						            </div>
						
						            <div class="form-group">
						                <label for="company_id"><fmt:message key="company_id" /></label>
						                <input type="text" class="form-control" id="company_id" name="company_id" value="${profile.company_id}">
						            </div>						
						            <hr class="my-3" />
						            <div class="d-grid">
						                <input type="submit" class="btn btn-primary" value="<fmt:message key='update_profile' />"/>
						            </div>
						            <div class="d-grid">
						                <a href="changePassword"><fmt:message key="change_password"/></a>
						            </div>
						        </div>
						    </form>
						</div>

						<div class="col-md-8 col-xl-7">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title mb-0"><fmt:message key="active_project"/></h5>
								</div>
								<div class="card-body">
									<c:forEach var="pro" items="${pro}">									
									<div class="d-flex align-items-start project-item" onclick="projectPage('${pro.project_id}')" style="padding:10px;">
										<img src="${pro.logo}" width="30" height="30" class="rounded-circle me-2" alt="${pro.project_name} }">
										<div class="flex-grow-1">
											<small class="float-end text-navy">
												<fmt:formatDate value="${pro.start_date}" pattern="yy.MM.dd" /> ~
       											<fmt:formatDate value="${pro.end_date}" pattern="yy.MM.dd" />
       										</small>
											<strong>${pro.project_name}</strong>						

										</div>
									</div>
									</c:forEach>
								</div>									
									<hr>									
									<div class="card-header">
										<h5 class="card-title mb-0"><fmt:message key="completed_projects"/></h5>
									</div>
								<div class="card-body">
									<c:forEach var="cpro" items="${cpro}">
									<div class="d-flex align-items-start project-item" onclick="projectPage('${cpro.project_id}')" style="padding:10px;">
										<img src="${cpro.logo}" width="30" height="30" class="rounded-circle me-2" alt="${cpro.project_name} }">
										<div class="flex-grow-1">
											<small class="float-end text-navy">
												<fmt:formatDate value="${cpro.start_date}" pattern="yy.MM.dd" /> ~
       											<fmt:formatDate value="${cpro.end_date}" pattern="yy.MM.dd" />
       										</small>
											<strong>${cpro.project_name}</strong>						

										</div>
									</div>
									</c:forEach>
								</div>
								<form id="proPage" method="post" action="dashmemFrm">
				                  	<input type="hidden" name="project_id"/>
				                  </form>
							</div>
						</div>
					</div>
				</div>
			</main>
			
		</div>
	</div>
<script>
	function getPro(proejct_id){
		location.href=// 프로젝트 상세페이지
	}
</script>
	<script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

</body>

</html>