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

<!-- jQuert 선언 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/vue" type="text/javascript"></script> 

  <style>
        .password-message  {
            font-size: 0.7rem; /* 글자 크기 조정 */
            font-weight: bold; /* 글자 두께 조정 */
  
        }
      

        .password-message.success {
            color: green; /* 비밀번호가 일치할 때 글자 색상 */
        }

        .password-message.error {
            color: red; /* 비밀번호가 일치하지 않을 때 글자 색상 */
        }
    </style>
<script type="text/javascript">
	$(document).ready(function() {
		
		
		var msg = "${msg}";
		if (msg !== "") {
			alert(msg);
			if (msg === "등록 성공") {
				location.href = "signinFrm";
				//location.href = "regEmpTmp";
			}
		}
		
		   // 비밀번호 확인 로직
        const passwordInput = document.querySelector('input[name="password"]');
        const passwordConfirmInput = document.getElementById('password_confirm');
        const passwordMessage = document.getElementById('password-message');

        function checkPasswords() {
            const password = passwordInput.value;
            const passwordConfirm = passwordConfirmInput.value;
         // 비밀번호 유효성 검사 조건
            const minLength = 6;
            const hasLetter = /[a-zA-Z]/.test(password);
            const hasDigit = /\d/.test(password);
            const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

            if (password === passwordConfirm && password.length >= minLength && hasLetter && hasDigit && hasSpecialChar) {
                passwordMessage.textContent = '비밀번호가 일치합니다';
                passwordMessage.className = 'password-message success'; // 성공 스타일
            } else if (password.length > 0 || passwordConfirm.length > 0) {
                if (password.length < minLength) {
                    passwordMessage.textContent = '비밀번호는 6자 이상이어야 합니다';
                    passwordMessage.className = 'password-message error'; // 실패 스타일
                } else if (!hasLetter || !hasDigit || !hasSpecialChar) {
                    passwordMessage.textContent = '비밀번호는 문자, 숫자, 특수문자를 각각 하나 이상 포함해야 합니다';
                    passwordMessage.className = 'password-message error'; // 실패 스타일
                } else {
                    passwordMessage.textContent = '비밀번호가 일치하지 않습니다';
                    passwordMessage.className = 'password-message error'; // 실패 스타일
                }
            } else{
                passwordMessage.textContent = ''; // 비어 있는 경우
                passwordMessage.className = 'password-message'; // 기본 스타일
            }
        }

        passwordInput.addEventListener('input', checkPasswords);
        passwordConfirmInput.addEventListener('input', checkPasswords);


       	const nameInput = document.querySelector('input[name="user_name"]');
       	const companyInput = document.querySelector('input[name="company_id"]');
        
        // 이메일 유효성 검사 및 중복 확인
       	const emailInput = document.querySelector('input[name="email"]');
        const emailMessage = document.getElementById('email-message');
        const validateEmailBtn = document.getElementById('validate-email-btn');

        validateEmailBtn.addEventListener('click', function() {
            const email = emailInput.value;
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 간단한 이메일 정규 표현식

            if (emailPattern.test(email)) {
                // 이메일 형식이 올바른 경우
                // 중복 확인을 위해 서버에 요청을 보냄
                $.ajax({
                    url: 'check_email', // 서버의 이메일 중복 확인 URL
                    type: 'POST',
                    data: { email: email },
                    success: function(response) {
                        if (response.exists) {
                            emailMessage.textContent = '이 이메일 주소는 이미 사용 중입니다';
                            emailMessage.className = 'email-message error'; // 실패 스타일
                        } else {
                            emailMessage.textContent = '사용 가능한 이메일 주소입니다';
                            emailMessage.className = 'email-message success'; // 성공 스타일
                        }
                    },
                    error: function() {
                        emailMessage.textContent = '서버 오류로 이메일 확인에 실패했습니다';
                        emailMessage.className = 'email-message error'; // 실패 스타일
                    }
                });
            } else {
                // 이메일 형식이 잘못된 경우
                emailMessage.textContent = '유효하지 않은 이메일 주소입니다';
                emailMessage.className = 'email-message error'; // 실패 스타일
            }
        });
     // 이메일 입력란의 입력 이벤트 핸들러
        emailInput.addEventListener('input', function() {
            const email = emailInput.value.trim();
            if (email === '') {
                emailMessage.textContent = ''; // 이메일이 비어 있으면 메시지 숨김
            }
        });

        // 폼 제출 전 비밀번호 및 이메일 검사
        $("form").on('submit', function(event) {

        	const name = nameInput.value; //사용자 이름
        	const email = emailInput.value; //이메일
        	const password = passwordInput.value; //비밀번호
        	const CompanyId = companyInput.value; // 회사 아이디
        	
           
            const passwordConfirm = passwordConfirmInput.value;
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            let isValid = true;
            let empcnt = 0;
         
            if (name === '') {
            	empcnt++;
            }
            
            if (password === '') {
            	empcnt++;
            }
            if (email === '') {
            	empcnt++;
            }
            
            if (CompanyId === '') {
            	empcnt++;
            }
            
            if(empcnt === 0){

            	 if (emailMessage.textContent !== '사용 가능한 이메일 주소입니다') {
                     alert('중복되지 않는 이메일을 사용주세요.');
                     event.preventDefault(); // 폼 제출 방지
                 }      
                 if (passwordMessage.textContent !== '비밀번호가 일치합니다') {
                     alert('비밀번호를 확인해주세요.');
                     event.preventDefault(); // 폼 제출 방지
                 }

                 if (!emailPattern.test(email)) {
                     alert('유효하지 않은 이메일 주소입니다.');
                     event.preventDefault(); // 폼 제출 방지
                 }
            
           
            }else if(empcnt === 1){
            	 if (name === '') {
                     alert('이름을 입력해 주세요.');
                     event.preventDefault(); // 폼 제출 방지
                 }
                 
                 if (password === '') {
                     alert('비밀번호를 입력해 주세요.');
                     event.preventDefault(); // 폼 제출 방지
                 }
                 if (email === '') {
                     alert('이메일을 입력해 주세요.');
                     event.preventDefault(); // 폼 제출 방지
                 }
                 
                 if (CompanyId === '') {
                     alert('회사아이디를 입력해 주세요.');
                     event.preventDefault(); // 폼 제출 방지
                 }
            
            }else {
				alert('모든 정보를 입력해주세요');
				isValid = false;
				if (!isValid) {
		            event.preventDefault(); // 폼 제출 방지
		        }
            }
            
           
            
            
        });
       
		
	});
	
</script>



</head>

<body class="bg-gray-200">
<!-- vue-->

  
  <main class="main-content  mt-0" >
    <div class="page-header align-items-start min-vh-100" style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
     <br><br> <br><br> 
      <span class="mask bg-gradient-dark opacity-6"></span>
      
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom">
    <!-- title 배경 위한 div -->
              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1" style="background: linear-gradient(#6A82FB,#B06AB3);">
                  <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">Sign Up</h4>
                  <div class="row mt-3">
                    
                  </div>
                </div>
              </div>
              <div class="card-body" id="app">
                <form role="form" class="text-start" action="sign_up">
     <!-- 사용자 이름  -->
                  <div class="input-group input-group-outline my-2">
                    <input type="text" class="form-control" name="user_name" value="" placeholder="Name" required>
                  </div>
      <!-- 이메일 -->     
                  <div class="input-group input-group-outline my-2">
                    <input type="email" class="form-control" name="email" value="" placeholder="Email" required style="height: 2.5rem; padding: 0.5rem; font-size: 0.875rem;">
                     <button type="button" class="btn bg-gradient-primary w-25 mb-2" style="background:#B06AB3;height: 2.5rem; font-size:0.6rem;" id="validate-email-btn">Check Email</button>
                                  
                   </div>
                     <!-- 이메일 유효성 검사 메시지 -->
   					 <p id="email-message" class="email-message" style="margin-bottom: 0; font-size: 0.7rem; font-weight:bold"></p>
                    
     <!-- 비밀번호  -->
                  <div class="input-group input-group-outline my-3">
                    <input type="password" class="form-control" name="password" value="" placeholder="Password" required>
                  </div>
     <!-- 비밀번호 확인 -->
                  <div class="input-group input-group-outline my-3">
                    <input type="password" class="form-control" id="password_confirm" placeholder="Password Confirm" required>
                  </div>
                   <!-- 비밀번호 확인 메시지 -->
    				<p id="password-message" class="password-message" style="margin-bottom:0"></p>
    				<br>
      <!-- 소속-권한  
	              <div class="input-group input-group-outline mb-3">
	               <label for="affiliation" class="col-sm-4 col-form-label">Affiliation</label>
				      <select class="form-control mr-sm-2" id="affiliation"@change="affiliation">
				         <option v-for="(aff, role_code) in affiliation" :key="role_code" :value="role_code">{{ aff }}</option>
				      </select>     
                  </div>  
       <div class="input-group input-group-outline my-3">
                    <input type="text" class="form-control" name="role_code" placeholder="role_code" value=""  >
                  </div>-->
                  
                  <div class="input-group input-group-outline my-3">   
                
				    
				<select  class="form-control"  v-model="aff.role_code" name="role_code">
		        	<option value="N">N/A</option>
		        	<option value="C">회사</option>
		        	<option value="P">프로젝트 관리자</option>
		        	<option value="M">팀원</option>
		        	<option value="40">마케팅</option>
		        	
		        </select>
		      </div>  
       
		<!-- 회사아이디 -->             
                <div class="input-group input-group-outline my-3">
                    <input type="text" class="form-control" name="company_id" placeholder="Company ID" value=""  >
                  </div>
         <!-- 부서     --> 
         <div class="input-group input-group-outline my-3">   
                <%--   <div class="input-group input-group-outline my-3">
				      <label for="department" class="col-sm-4 col-form-label">Department</label>
				      <select id="department" class="form-control mr-sm-2" @change="department">
				        
				    	 <option v-for="(dept, deptno) in department" :key="deptno" :value="deptno)">{{ dept }}</option>
				      </select>--%>
				     
				 <%--     </div>  
				       <div class="input-group input-group-outline my-3">
                    <input type="text" class="form-control" name="deptno" placeholder="deptno" value=""  >
                  </div>--%>
				    
				<select  class="form-control"  v-model="dept.deptno" name="deptno">
		        	<option value="0">N/A</option>
		        	<option value="10">관리</option>
		        	<option value="20">인사</option>
		        	<option value="30">재무</option>
		        	<option value="40">마케팅</option>
		        	<option value="50">개발</option>
		        	<option value="60">IT</option>
		        	<option value="70">품질 보증</option>
		        	
		        </select>
		      </div>  
				    
                  
                  <div class="text-center">
                    <input type="button" class="btn bg-gradient-primary w-100 my-4 mb-2" value="Sign up" style="background:#B06AB3"	id="regBtn" /> 
                  </div>
                 
                </form>
             
           
                 <p class="mt-4 text-sm text-center">
                    "Do you already have an account?"
                    <a href="signinFrm" class="text-primary text-gradient font-weight-bold" style="color:#3f2b96;">Sign in</a>
                  </p>
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
<%--   
 <script type="text/javascript">
    var model = {	
			department:{0:'N/A',10:'관리', 20:'인사', 30:'재무',40:'마케팅', 50:'개발', 60:'IT', 70:'품질 보증'},
    		affiliation:{'N':'N/A','C':'회사', 'P':'프로젝트 관리자', 'M':'팀원'},
			
    }
    var vm = Vue.createApp({
      
       data(){
          return model;
       }
    }).mount("#app");
</script>
--%>
<script>
var vm = Vue.createApp({
	name:"App",
	data(){
		return {dept:{deptno:0},
				aff:{role_code:"N"}
				
		};
	};
});
</script>
<script type="text/javascript">
	$("#regBtn").click(function() {
		if (confirm("등록하시겠습니까?")) {	

			$("form").submit();
			
		}
	});
</script>
 

  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
 <!--   <script src="${path}/material-dashboard-2/assets/js/material-dashboard.min.js?v=3.0.0"></script>-->
</body>

</html>