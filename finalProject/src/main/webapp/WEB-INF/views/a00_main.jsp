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
<%--    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
--%>
<%-- taskcss --%>
<link rel="stylesheet" href="${path}/jobboard-master/css/custom-bs.css">
    <link rel="stylesheet" href="${path}/jobboard-master/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="${path}/jobboard-master/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="${path}/jobboard-master/fonts/icomoon/style.css">
    <link rel="stylesheet" href="${path}/jobboard-master/fonts/line-icons/style.css">
    <link rel="stylesheet" href="${path}/jobboard-master/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${path}/jobboard-master/css/animate.min.css">
    <link rel="stylesheet" href="${path}/jobboard-master/css/quill.snow.css">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
.project-item:hover{
	cursor:pointer;
	background-color:lightgray;
	border-radius:10px;
	transition: background-color 0.3s ease;
}
.dropdown-menu {
    max-height: 200px; /* 필요에 따라 높이 조절 */
    overflow-y: auto;
}
.dropdown-item {
       cursor: pointer; /* 클릭 가능한 커서 */
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
// 프로젝트 리스트에서 해당 프로젝트의 행을 클릭했을 때 실행되는 함수
function projectPage(project_id){ 
  if(role_code!="" && role_code!=null){
	$("[name=project_id]").val(project_id)
	$("#proPage").attr("action", "dashmemFrm");
	$("#proPage").submit()
  }else{
     alert("비정상적인 접근! 관리자에게 문의해주세요")
  }    
}


function projectDetail(project_id, event){
	event.stopPropagation();
	location.href="projectDetail?project_id="+project_id
}

</script>
</head>

<body>

   <div class="wrapper">
<jsp:include page="a00_sideBar.jsp"/>   
   
      <div class="main">
         <jsp:include page="a00_top.jsp"/>

         <main class="content">
           <div class="row">
           <div class="col-3 col-xxl-3 d-flex order-1 order-xxl-1  flex-fill w-2"  style="height: 20%">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title text-center mb-0">Count Active Project</h5>
								</div>
								<div class="d-flex justify-content-center align-items-center mb-3">
								    <div class="fw-bold" style="font-size: 1.5rem;">
								        ${aProCnt}
								    </div>
								</div>
								<div class="card-header">										
									<h5 class="card-title text-center mt-1 ">Count Complete Project</h5>
								</div>
								<div class="d-flex justify-content-center align-items-center mb-5">
								    <div class="fw-bold" style="font-size: 1.5rem;">
								        ${cProCnt}
								    </div>
								</div>
							</div>
						</div>
			<div class="col-3  col-xxl-3 d-flex order-1 order-xxl-1 flex-fill w-30" style="height: 20%">
							
                     <div class="card flex-fill w-100">
                        <div class="card-header">
                           <h5 class="card-title">Progress Chart</h5>
                           <h6 class="card-subtitle text-muted">A line chart is a way of plotting data points on a line.</h6>
                        </div>
                        <div class="card-body" >
                           <div >
                              <canvas id="chartjs-line"></canvas>
                           </div>
                      
                     </div>
                  </div> 
						</div>
			
          </div>
            <div class="container-fluid p-0">
               
            <div class="row mb-4">
        <div class="col-lg-12 col-md-6 mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-6 col-7">
                  <h4><strong>Active</strong> Projects</h4>
                  <!-- 프로젝트 생성 버튼 (PM만 보이게)-->
                  
         <c:if test="${sessionScope.role_code!=null&&sessionScope.role_code=='P'}">
	         <button class="btn btn-success" data-toggle="modal" data-target="#ModalCenter"
           type="button">CREATE PROJECT</button>
	    </c:if>
                </div>
                <div class="col-lg-6 col-5 my-auto text-end">
                  <div class="dropdown float-lg-end pe-4">
                    <a class="cursor-pointer"s id="dropdownTable" data-bs-toggle="dropdown" aria-expanded="false">
                      <i class="fa fa-ellipsis-v text-secondary"></i>
                    </a>
                    <ul class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5" aria-labelledby="dropdownTable">
                      <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                      <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                      <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-center text-uppercase text-xxs font-weight-bolder opacity-7">Project name</th>                      
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Budget</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Completion</th>
                      <th class="text-center text-uppercase text-xxs font-weight-bolder opacity-7 ps-2">Info</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="pro" items="${pro}">
                  <form id="proPage" method="post">
                  	<input type="hidden" name="project_id"/>
                  </form>
                    <tr onclick="projectPage('${pro.project_id}')" class="project-item">
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                           <img src="${pro.logo}" class="avatar avatar-sm me-3" alt="${pro.project_name}">
                          
                          </div>
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">${pro.project_name}</h6>
                          </div>
                        </div>
                      </td>
                       <td class="align-middle">
	                      <div style="text-align: right;">
	                        <span class="amount text-xs font-weight-bold" >${pro.amount}</span>
	                      </div>
                      </td>
                      <td class="align-middle">
                        <div class="progress-wrapper w-75 mx-auto text-center">
                          <div class="progress-info">
                            <div class="progress-percentage">
                              <span class="text-xs font-weight-bold">${pro.progress}%</span>
                            </div>
                          </div>
                          <div class="progress align-middle mx-auto">
                          <div class="progress-bar bg-gradient-info" style="width: ${pro.progress}%;" role="progressbar" aria-valuenow="${pro.progress}" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </td>
                      <td class="align-middle">
                      	<button class="btn btn-primary" onclick="projectDetail('${pro.project_id}',event)">INFO</button>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
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
        <h5 class="modal-title" id="ModalLongTitle">Create Project</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="modalFrm" class="form"  method="post" action="insertProject">
      <div class="row">
         <div class="col">
         <span>Company ID</span>
           <select class="form-control" name="company_id">
	           	<c:forEach var="com" items="${com}">
					<option value="${com.company_id}" style="height:1.5rem;">${com.company_name}</option>					
				</c:forEach>
	         </select>
         </div>
        </div>
        <div class="row">
         <div class="col">    
         <span>Project Name</span>              
           <input type="text" class="form-control" name="project_name"/>
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Extra Comment</span>
            <textarea name="etc" rows="3" cols="10" class="form-control"></textarea>
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>Start Date</span>
           <input type="date" class="form-control" name="start_date"/>
         </div>
        </div>
        <div class="row">
         <div class="col">
         <span>End Date</span>
           <input type="date" class="form-control" name="end_date"/>
         </div>
        </div>  
        <div class="row">
         <div class="col">
         <span>Users</span>
	         <select class="form-control" name="userIds" multiple>
	           	<c:forEach var="user" items="${user}">
					<option value="${user.user_id}" style="height:1.5rem;">
						${user.user_name}(${user.dname})</option>					
				</c:forEach>
	         </select>
		<%-- <input list="user_list" id="combobox" name="user_id"
					class="form-control" placeholder="Select Member">
			<datalist class="dropdown-menu" id="user_list" >
				<c:forEach var="user" items="${user}">
					<option value="${user.user_id}" style="width:10rem">${user.user_name}(${user.dname})</option>
				</c:forEach>
			</datalist> --%>
        </div>        
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
<script>
	document.addEventListener('DOMContentLoaded', () => {
	    const form = document.querySelector('form'); // 폼 선택
	    form.addEventListener('submit', (event) => {
	        const selectedUsers = Array.from(document.querySelectorAll('input[name="user_ids"]:checked'))
	                                   .map(checkbox => checkbox.value);
	        console.log('Selected Users:', selectedUsers);
	        // 예: 서버로 제출하거나 다른 작업을 수행
	    });
	});
</script>
   <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>
<script>
      document.addEventListener("DOMContentLoaded", function() {
         // Line chart
         new Chart(document.getElementById("chartjs-line"), {
            type: "line",
            data: {
               labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
               datasets: [{
                  label: "Sales ($)",
                  fill: true,
                  backgroundColor: "transparent",
                  borderColor: window.theme.primary,
                  data: [2115, 1562, 1584, 1892, 1487, 2223, 2966, 2448, 2905, 3838, 2917, 3327]
               }, {
                  label: "Orders",
                  fill: true,
                  backgroundColor: "transparent",
                  borderColor: "#adb5bd",
                  borderDash: [4, 4],
                  data: [958, 724, 629, 883, 915, 1214, 1476, 1212, 1554, 2128, 1466, 1827]
               }]
            },
            options: {
               maintainAspectRatio: false,
               legend: {
                  display: false
               },
               tooltips: {
                  intersect: false
               },
               hover: {
                  intersect: true
               },
               plugins: {
                  filler: {
                     propagate: false
                  }
               },
               scales: {
                  xAxes: [{
                     reverse: true,
                     gridLines: {
                        color: "rgba(0,0,0,0.05)"
                     }
                  }],
                  yAxes: [{
                     ticks: {
                        stepSize: 500
                     },
                     display: true,
                     borderDash: [5, 5],
                     gridLines: {
                        color: "rgba(0,0,0,0)",
                        fontColor: "#fff"
                     }
                  }]
               }
            }
         });
      });
   </script>

   

</body>

</html>