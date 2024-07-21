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
<body>
	<body>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="text-center mt-4">
							<h1 class="h2">Get started</h1>
							<p class="lead">
								Start creating the best possible user experience for you customers.
							</p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<form>
										<div class="mb-3">
											<label class="form-label">Name</label>
											<input class="form-control form-control-lg" type="text" name="name" placeholder="Enter your name" />
										</div>
										<div class="mb-3">
											<label class="form-label">Company</label>
											<input class="form-control form-control-lg" type="text" name="company" placeholder="Enter your company name" />
										</div>
										<div class="mb-3">
											<label class="form-label">Email</label>
											<input class="form-control form-control-lg" type="email" name="email" placeholder="Enter your email" />
										</div>
										<div class="mb-3">
											<label class="form-label">Password</label>
											<input class="form-control form-control-lg" type="password" name="password" placeholder="Enter password" />
										</div>
										<div class="text-center mt-3">
											<a href="index.html" class="btn btn-lg btn-primary">Sign up</a>
											<!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

	<script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

</body>

</html>