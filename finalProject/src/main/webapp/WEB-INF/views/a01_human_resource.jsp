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


<style>
.userList:hover{
	cursor:pointer;
	background-color:lightgray;
	border-radius:10px;
	transition: background-color 0.3s ease;
}
</style>
 <script>
 var msg="${msg}"
 if(msg != "") {
     alert(msg); // 알림 메시지 표시

     if (msg=="생성 완료") {
        $(".close").click();
        window.location.href = 'main';
     }
 }
 // 세션에 저장되어 있는 롤 코드
 var role_code="${sessionScope.role_code}"
 function projectPage(project_id){ // 프로젝트 리스트에서 해당 프로젝트의 행을 클릭했을 때 실행되는 함수
   if(role_code!="" && role_code!=null){
      if(role_code=="P"){
         location.href="dashpmFrm?project_id="+project_id
      }else{
         location.href="dashmemFrm?project_id="+project_id
      }
   }else{
      alert("비정상적인 접근! 관리자에게 문의해주세요")
   }    
 }



function getUser(user_id){
	$.ajax({
		type:"post",
		url:"getUser",
		data:{user_id:user_id},
		success:function(data){
			var userId = data[0].user_id;
			console.log(userId+"의 정보"); 
			console.log(data)
			
            $("[name=user_id]").val(userId);
            $("[name=user_name]").val(data[0].user_name);
            $("[name=email]").val(data[0].email);	        
            $("[name=company_id]").val(data[0].company_id);	        
            $("[name=deptno]").val(data[0].deptno);	        
		},
		error:function(err){
			console.log(err)
		}
	})
}
$(document).ready(function() {
	
})
</script>
</head>

<body>

   <div class="wrapper">
<jsp:include page="a00_main_side.jsp"/>   
   
      <div class="main">
         <jsp:include page="a00_top.jsp"/>  

         <main class="content">

            <div class="container-fluid p-0">

               <h1 class="h3 mb-3"><strong>Analytics</strong> Dashboard</h1>
               
     
     <div class="row mb-4">
        <div class="col-lg-12 col-md-6 mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-6 col-7">
                  <form action="HR" id="schFrm" method="post">
                    <input type="text" class="form-control" name="sch" placeholder="Search..." />
                    <input type="hidden" name="curPage" value="${sch.curPage}"/>               
                   </form>
                </div>
                <div class="col-lg-6 col-5 my-auto text-end">
                  
                </div>
              </div>
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7 px-2">add</th>
                      <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">user</th>
                      <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">ID</th>
                      <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">email</th>
                      <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">department</th>
                      <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">company ID</th>
                      <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">is Active</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="user" items="${user}">
                    <tr class="userList" data-toggle="modal" data-target="#ModalCenter" onclick="getUser('${user.user_id}')">
                     <td class="align-middle text-center text-sm">
			            <input type="checkbox" name="selectedUsers" onclick="event.stopPropagation()"
			            	style="transform: scale(1.5); margin: 0; padding: 0;" value="${user.user_id}">
			        </td>
                      <td>                      
                        <div class="d-flex px-2 py-1">
                          <div>
                           <img src="z01_upload/${user.image}" class="avatar avatar-sm me-3" alt="${user.user_name}'s image">
                          
                          </div>
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm font-weight-bold">${user.user_name}</h6>
                          </div>
                        </div>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="amount text-s" >${user.user_id}</span>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="amount text-s" >${user.email}</span>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="amount text-s" >${user.dname}</span>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="amount text-s" >${user.company_id}</span>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="amount text-s" >${user.project_status ? 'Active' : 'Inactive'}</span>                      
                      </td>                                            
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
<ul class="pagination justify-content-center">
	  <li class="page-item"><a class="page-link" href="javascript:goPage(${sch.startBlock-1})" style="width:5rem">Previous</a></li>
	  <c:forEach var="pCnt" begin="${sch.startBlock}" 
	  						end="${sch.endBlock}">
	  <li class="page-item ${sch.curPage==pCnt?'active':''}">
	  	<a class="page-link" href="javascript:goPage(${pCnt})">${pCnt}</a></li>
	  </c:forEach>
	  <li class="page-item"><a class="page-link" href="javascript:goPage(${sch.endBlock+1})" style="width:5rem">Next</a></li>
	</ul>	
	<script type="text/javascript">
		function goPage(pCnt){
			$("[name=curPage]").val(pCnt)  // 클릭한 것을 현제 페이지 번호로 전송.. 페이지가 이동 처리.
			$("#schFrm").submit()
			
		}
	</script>
        </div>
<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        const elements = document.querySelectorAll('.amount');
        elements.forEach(element => {
            const number = parseFloat(element.innerText);
            if (!isNaN(number)) {
                element.innerText = number.toLocaleString();
            }
        });
    });
</script>

            </div>
         </main>
<div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="ModalLongTitle">User Info</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="modalFrm" class="form"  method="post" action="updateUser">
      <div class="row">
         <div class="col">
         <span>ID</span>
           <input type="text" class="form-control" name="user_id" readonly/>
         </div>
        </div>
        <div class="row">
         <div class="col">    
         <span>Name</span>              
           <input type="text" class="form-control" name="user_name" readonly/>
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>email</span>
            <input type="text" class="form-control" name="email" readonly/>
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Company ID</span>
           <input type="text" class="form-control" name="company_id"/>
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Department</span>
           <select class="form-control" name="deptno">
           	<option value="0">N/A</option>
           	<option value="10">PM</option>
           	<option value="20">인사</option>
           	<option value="30">재무</option>
           	<option value="40">마케팅</option>
           	<option value="50">개발</option>
           	<option value="60">유지보수</option>
           	<option value="70">품질보증</option>
           </select>
         </div>
        </div>            
        
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" id="regBtn" class="btn btn-success">regist</button>        
      </div>   
       </form> 
      </div>
      
    </div>
  </div>
</div>     
      </div>
   </div>

   <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>


   

</body>

</html>