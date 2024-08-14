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

function validatePassword(password) {
    // 비밀번호 길이 확인 및 조건 확인
    if (password.length < 6 || 
        !/[a-zA-Z]/.test(password) || 
        !/[0-9]/.test(password) || 
        !/[!@#$%^&*(),.?:{}|<>]/.test(password)) {
        return '비밀번호는 영문, 숫자, 특수문자 조합 6자리 이상 입력하세요.';
    }
    return ''; // 모든 조건을 만족할 경우 빈 문자열 반환
}

$(document).ready(function() {
	var msg="${msg}"
	if(msg!=""){
		alert(msg)
		if(msg=="수정 성공"){
			location.href="profile"
		}
	}
	
    function updateMessages() {
        var npwd = $('#npwd').val();
        var cnpwd = $('#cnpwd').val();
        var pwd = $('#pwd').val();

        var chMsg = $('#chMsg');
        var conMsg = $('#conMsg');
        var pwdMsg = $('#pwdMsg');

        // 메시지 초기화
        chMsg.text('');
        conMsg.text('');
        pwdMsg.text('');

        // 새 비밀번호 유효성 검사
        var npwdMessage = validatePassword(npwd);
        if (npwdMessage) {
            chMsg.text(npwdMessage);
        }

        // 비밀번호 확인
        if (npwd !== cnpwd) {
            conMsg.text('비밀번호가 일치하지 않습니다.');                 
        }

        // 현재 비밀번호 입력 필드 검사
        if (pwd === '') {
            pwdMsg.text('현재 비밀번호를 입력하세요.');
        }

        // 유효성 검사 통과 시 성공 메시지
        if (!npwdMessage && npwd === cnpwd && pwd !== '') {            	 
       	 $("#chBtn").click(function(){
			 	$("form").submit();
       	 })
        }
    }

    // 입력 필드에서 값이 변경될 때마다 메시지 업데이트
    $('#pwd, #npwd, #cnpwd').on('input', updateMessages);
});
	
</script>
<style>
	 .message {
            color: red;
            font-weight: bold;
            font-size: 0.9rem;
            margin-top: 5px;
        }
</style>
</head>

<body>
	<div class="wrapper">
	<jsp:include page="a00_sideBar.jsp"/> 
	
		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>

            <div class="navbar-collapse collapse">
               <ul class="navbar-nav navbar-align">
                  <li class="nav-item dropdown">
                     <a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
                        <div class="position-relative">
                           <i class="align-middle" data-feather="bell"></i>
                           <span class="indicator">4</span>
                        </div>
                     </a>
                     <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="alertsDropdown">
                        <div class="dropdown-menu-header">
                           4 New Notifications
                        </div>
                        <div class="list-group">
                           <a href="#" class="list-group-item">
                              <div class="row g-0 align-items-center">
                                 <div class="col-2">
                                    <i class="text-danger" data-feather="alert-circle"></i>
                                 </div>
                                 <div class="col-10">
                                    <div class="text-dark">Update completed</div>
                                    <div class="text-muted small mt-1">Restart server 12 to complete the update.</div>
                                    <div class="text-muted small mt-1">30m ago</div>
                                 </div>
                              </div>
                           </a>
                           <a href="#" class="list-group-item">
                              <div class="row g-0 align-items-center">
                                 <div class="col-2">
                                    <i class="text-warning" data-feather="bell"></i>
                                 </div>
                                 <div class="col-10">
                                    <div class="text-dark">Lorem ipsum</div>
                                    <div class="text-muted small mt-1">Aliquam ex eros, imperdiet vulputate hendrerit et.</div>
                                    <div class="text-muted small mt-1">2h ago</div>
                                 </div>
                              </div>
                           </a>
                           <a href="#" class="list-group-item">
                              <div class="row g-0 align-items-center">
                                 <div class="col-2">
                                    <i class="text-primary" data-feather="home"></i>
                                 </div>
                                 <div class="col-10">
                                    <div class="text-dark">Login from 192.186.1.8</div>
                                    <div class="text-muted small mt-1">5h ago</div>
                                 </div>
                              </div>
                           </a>
                           <a href="#" class="list-group-item">
                              <div class="row g-0 align-items-center">
                                 <div class="col-2">
                                    <i class="text-success" data-feather="user-plus"></i>
                                 </div>
                                 <div class="col-10">
                                    <div class="text-dark">New connection</div>
                                    <div class="text-muted small mt-1">Christina accepted your request.</div>
                                    <div class="text-muted small mt-1">14h ago</div>
                                 </div>
                              </div>
                           </a>
                        </div>
                        <div class="dropdown-menu-footer">
                           <a href="#" class="text-muted">Show all notifications</a>
                        </div>
                     </div>
                  </li>
                                
     
<li class="nav-item dropdown">   
                     <a class="nav-link d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                 <img src="${image}" class="avatar img-fluid rounded me-1" alt="Profile Picture" /> 
				<c:choose>
				    <c:when test="${sessionScope.role_code != null && sessionScope.role_code == 'P'}">
				        <span class="text-dark">Welcome, PM_${user_name}</span>
				    </c:when>
				    <c:otherwise>
				        <span class="text-dark">Welcome, MEM_${user_name}</span>
				    </c:otherwise>
				</c:choose>
              </a>
                     <!-- <div class="dropdown-menu dropdown-menu-end">
                        <a class="dropdown-item" href="pages-profile.html"><i class="align-middle me-1" data-feather="user"></i> Profile</a>
                        <a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="pie-chart"></i> Analytics</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="index.html"><i class="align-middle me-1" data-feather="settings"></i> Settings & Privacy</a>
                        <a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="help-circle"></i> Help Center</a>
                        <div class="dropdown-divider"></div>
                        <form method="post" action="/logout">
                        <input type="submit" class="dropdown-item" value="Log out" >
                        </form>
                     </div> -->
                  </li>
               </ul>
            </div>
         </nav>

			<main class="content">
			
				<div class="container-fluid p-13">
					<div class="mb-3">
						<h1 class="h3 d-inline align-middle">Change Password</h1>						
					</div>
					
					<div class="row">
						<div class="col-md-8 col-xl-8">
						    <form class="card mb-3" method="post" action="changePassword">
                            <input type="hidden" name="user_id" value="${sessionScope.user_id}"/>
                            <div class="card-body" style="margin:30px 0 0 0;">
                                <div class="form-group" style="margin:10px 80px;">
                                    <strong>Existing password</strong>
                                    <input type="password" class="form-control" id="pwd" name="password" style="margin:10px auto;">
                                    <p id="pwdMsg" class="message"></p> <!-- 비밀번호 입력 필드 아래 메시지 -->
                                </div>

                                <div class="form-group" style="margin:10px 80px;">
                                    <strong>New password</strong>
                                    <input type="password" class="form-control" id="npwd" name="new_password" style="margin:10px auto;">
                                    <p id="chMsg" class="message"></p> <!-- 새 비밀번호 입력 필드 아래 메시지 -->
                                </div>

                                <div class="form-group" style="margin:10px 80px;">
                                    <strong>Confirm new password</strong>
                                    <input type="password" class="form-control" id="cnpwd" style="margin:10px auto;">
                                    <p id="conMsg" class="message"></p> <!-- 비밀번호 확인 입력 필드 아래 메시지 -->
                                </div>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-center">
                                <button class="btn btn-primary" id="chBtn" type="button" style="margin:30px auto;">Change</button>
                            </div>
                            <br>
                        </form>
						</div>

						
					</div>

				</div>
			</main>
			
		</div>
	</div>
<script>
	function getPro(proejct_id){
	}
	 
    
    
	
</script>
	<script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

</body>

</html>