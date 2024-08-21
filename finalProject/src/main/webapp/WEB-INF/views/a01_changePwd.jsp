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
 <%--  --%>
 <c:if test="${sessionScope.user_id == null || sessionScope.user_id == ''}">
    <script>
        alert("로그인이 필요한 서비스입니다");
        location.href = 'signinFrm';
    </script>
</c:if>
	<div class="wrapper">
	<jsp:include page="a00_sideBar.jsp"/> 
	
		<div class="main">
			
        <jsp:include page="a00_top.jsp"/>

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