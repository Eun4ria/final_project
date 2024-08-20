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
<style>
.project-item:hover{
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


function goChat(user_id){
	location.href="message?user_id="+user_id
}
function handleButtonClick(event) {
    event.stopPropagation();
    location.href="HR"
  }
</script>
</head>

<body>

   <div class="wrapper">
<jsp:include page="a00_main_side.jsp"/>   
   
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
                 <img src="/z01_upload/${image}" class="avatar img-fluid rounded me-1" alt="Profile Picture" /> 
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
           <div class="row">
           <div class="col-3 col-xxl-3 d-flex order-1 order-xxl-1  flex-fill w-2"  style="height: 20%">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title text-center mb-0">진행중인 업무</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										50
									</div>
								</div>
								<div class="card-header">

									<h5 class="card-title text-center mt-1 ">예정된 업무</h5>
								</div>
								<div class="card-body d-flex mb-1">
									<div class="align-self-center w-100">
										70
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

               <h1 class="h3 mb-3"><strong>Analytics</strong> Dashboard</h1>
               
         <!-- 프로젝트 생성 버튼 -->
         <c:if test="${sessionScope.role_code != null && sessionScope.role_code == 'P'}">
	         <button class="btn btn-success" data-toggle="modal" data-target="#ModalCenter"
           type="button">CREATE PROJECT</button>
	    </c:if>
           
               
            <div class="row mb-4">
        <div class="col-lg-12 col-md-6 mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-6 col-7">
                  <h6>Projects</h6>
                  <p class="text-sm mb-0">
                    <i class="fa fa-check text-info" aria-hidden="true"></i>
                    <span class="font-weight-bold ms-1">30 done</span> this month
                  </p>
                </div>
                <div class="col-lg-6 col-5 my-auto text-end">
                  <div class="dropdown float-lg-end pe-4">
                    <a class="cursor-pointer" id="dropdownTable" data-bs-toggle="dropdown" aria-expanded="false">
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
                      <th class="text-center text-uppercase text-xxs font-weight-bolder opacity-7 ps-2">Members</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="pro" items="${pro}">
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
                     <%-- <td>
                        <div class="avatar-group mt-2">
                         <a href="javascript:;" class="avatar avatar-xs rounded-circle" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Ryan Tompson">
                            <img src="${path}/material-dashboard-2/assets/img/team-4.jpg" alt="user1">
                          </a>
                          <a href="javascript:;" class="avatar avatar-xs rounded-circle" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Romina Hadid">
                            <img src="${path}/material-dashboard-2/assets/img/team-3.jpg" alt="user2">
                          </a>
                          <a href="javascript:;" class="avatar avatar-xs rounded-circle" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Alexander Smith">
                            <img src="${path}/material-dashboard-2/assets/img/team-4.jpg" alt="user3">
                          </a>
                          <a href="javascript:;" class="avatar avatar-xs rounded-circle" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Jessica Doe">
                            <img src="${path}/material-dashboard-2/assets/img/team-1.jpg" alt="user4">
                          </a>
                        </div>                       
                      </td>
                       --%>
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
                      <button class="btn btn-primary" onclick="handleButtonClick(event)">member</button>
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
           <input type="text" class="form-control" name="company_id"/>
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