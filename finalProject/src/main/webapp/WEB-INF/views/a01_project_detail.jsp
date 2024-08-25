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
$(document).ready(function() {
    $('form').submit(function(event) {
        var datePattern = /^\d{4}-\d{2}-\d{2}$/;
        
        var startDateValue = $('#start_date').val();
        var endDateValue = $('#end_date').val();
        
        if (!datePattern.test(startDateValue) || !datePattern.test(endDateValue)) {
            alert('날짜는 yyyy-MM-dd 형식으로 입력해주세요.');
            event.preventDefault(); // 폼 제출 방지
            return false;
        }

        // hidden 필드에 값을 설정합니다.
        $('[name="start_date"]').val(startDateValue);
        $('[name="end_date"]').val(endDateValue);
    });

    var msg = "${msg}";
    if(msg != null && msg != ""){
        alert(msg);
        if(msg=="삭제 완료"){
        	location.href="main"
        }
    }
    $("#uptBtn").click(function(){
		$("form").attr("action", "updateProject");
		$("form").submit()
	})
	$("#delBtn").click(function(){
		$("form").attr("action", "deleteProject");
		$("form").submit()
	})
});
</script>
</head>

<body>

	<div class="wrapper">
	<jsp:include page="a00_sideBar.jsp"/> 
	
		<div class="main">			
        <jsp:include page="a00_top.jsp"/>

			<main class="content">
			
					<div class="mb-3">
						<h1 class="h3 d-inline align-middle">Project Detail</h1>
					</div>
					
					<div class="row">
						<div class="col-md-8 col-xl-8">
						    <form class="card mb-3" method="post">
						        <div class="card-body"  style="margin:30px 0 0 0;">
						            <h4 class="h4 card-title" style="margin:10px 80px;">Info</h4>
						            <div class="form-group" style="margin:10px 80px;">
						                <label for="project_name">Project Name</label>
						                <input class="form-control" id="project_name" name="project_name" value="${pro.project_name}">
						            </div>
						
						            <div class="form-group" style="margin:10px 80px;">
						                <label for="project_id">Project ID</label>
						                <input class="form-control" id="project_id" name="project_id" value="${pro.project_id}">
						            </div>
						
						            <div class="form-group" style="margin:10px 80px;">
						                <label for="etc">Etc</label>
						                <input class="form-control" id="etc" name="etc" value="${pro.etc}">
						            </div>
						            
						             <div class="form-group" style="margin:10px 80px;">
						                <label for="start_date">Start Date</label>
						                <input type="hidden" name="start_date"/>
						                <input class="form-control" id="start_date" 
						                	value="<fmt:formatDate value='${pro.start_date}' pattern='yyyy-MM-dd' />">
						            </div>							           
						            <div class="form-group" style="margin:10px 80px;">
						                <label for="end_date">End Date</label>
						                <input type="hidden" name="end_date"/>
						                <input class="form-control" id="end_date" 
						                	value="<fmt:formatDate value='${pro.end_date}' pattern='yyyy-MM-dd' />">
						            </div>
						           </div>
						            <hr>
						            <div class="d-flex justify-content-center">
						                <button type="button" id="uptBtn" class="btn btn-primary" style="margin:30px auto;">Change</button>
						            </div>
						            <div class="d-flex justify-content-center">
						                <button type="button" id="delBtn" class="btn btn-primary" style="margin:30px auto;">Delete</button>
						            </div>
						        
						    </form>
						</div>
						
					</div>

			</main>
			
		</div>
	</div>
	<script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

</body>

</html>