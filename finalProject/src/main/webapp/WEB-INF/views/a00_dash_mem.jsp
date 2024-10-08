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
<%-- 	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
--%>
<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>

<body>


	<div class="wrapper">
<jsp:include page="a00_sideBar.jsp"/>	

 <c:if test="${sessionScope.project_id == null || sessionScope.project_id == ''}">
    <script>
        alert("프로젝트를 선택하세요");
        location.href = 'main';
    </script>
</c:if>
		<div class="main">
         <jsp:include page="a00_top.jsp"/>

			<main class="content">
				<div class="container-fluid p-0">

		
					
				<div class="row mb-4">
    <!--  <div style="background-color: #dbd4ec;"  class="card flex-fill w-90">    
     <br>
         <div class="row">
           <div class="col-6 col-xxl-3 d-flex order-1 order-xxl-1  flex-fill w-30">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">진행중인 업무</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										ㅎㅎ
									</div>
								</div>
							</div>
						</div>
			<div class="col-6  col-xxl-3 d-flex order-1 order-xxl-1 flex-fill w-30">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">완료된 업무</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										호호
									</div>
								</div>
							</div>
						</div>
			<div class="col-6 col-xxl-3 d-flex order-1 order-xxl-1 flex-fill w-30">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">중단 업무</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										후후
									</div>
								</div>
							</div>
						</div>
          </div> 
          </div>-->
           <div class="row" style="margin-top:1rem"> 
          <div class="col-sm-11 col-lg-6 col-md-6 col-xl-6 w-100"  >
                        <div class="col-12 bg-white rounded p-5" style="background:white">
                            <div class="d-flex align-items-center justify-content-between mb-4" style="background:white">
                                <h6 class="mb-0"><strong>DashBoard</strong> - ${project_id} </h6>
                                <a href="todoFrm">Show All</a>
                            </div>
                            <!-- <div class="d-flex mb-2">
                                <input class="form-control bg-transparent" type="text" placeholder="Enter task">
                                <button type="button" class="btn btn-primary ms-2">Add</button>
                            </div> -->
   <%-- to do 내용 --%> 
   
   <%-- <div class="container-fluid p-0">

               
            <div class="row mb-4">
        <div class="col-lg-12 col-md-6 mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
             
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                    <th></th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">c</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">Task Name</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Completion</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="task" items="${tasklist}">
                    <tr ondblclick="taskPage('${task.task_id}')">
                      <td>
                         <div class="align-middle text-center" style="border:none">
                         
                          <div class="align-middle text-center ">
                          	<input type="checkbox" id="task1" >
                            <h6 class="mb-0 text-sm">${task.task_name}</h6>
                          </div>
                        </div>
                      </td>
                      
                      <td >
                      <div class="align-middle text-center" style="border:none">
                         
                          <div class="align-middle text-center ">
                            <h6 class="mb-0 text-center">${task.endDateFormatted }</h6>
                          </div>
                        </div>
                        
                      </td>
                    
                      <td class="align-middle text-center">
                          <div class="align-middle text-center ">
                            <h6 class="mb-0 text-center">${task.tstatus }</h6>
                          </div>
                        </div>
                      </td>
                     
                     
                      <td class="align-middle">
                        <div class="progress-wrapper  mx-auto">
                          <div class="progress-info">
                            <div class="progress-percentage">
                              <span class="text-xs font-weight-bold">${task.progress}%</span>
                            </div>
                          </div>
                          <div class="progress mx-auto">
                          <div class="progress-bar bg-gradient-info" style="width: ${task.progress}%;" role="progressbar" aria-valuenow="${pro.progress}" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div> --%>
        
                     
               </div>

               <div class="row">
               
                  
                  
                  
                  
                  <div class="col-sm-11 col-lg-6 col-md-6 col-xl-6" >
                        
                    </div>
               </div>
               

            </div>
                           
   <%-- to do 내용 끝--%>                         
                           





                        </div>
                    </div>
         </div> 
  <div class="row" style="margin-top:1rem">     
  
        <div class="col-12 d-flex col-xxl-3 order-2 order-xxl-1 w-45" style="padding:0">
							<div class="card flex-fill  w-45">
								<div class="card-header">

									<h5 class="card-title mb-0">Calendar</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										<div class="chart">
											<div id="datetimepicker-dashboard"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
				<div class="col-12 col-md-6 col-xxl-3 d-flex order-2 order-xxl-3  w-55">
			

				<div class="card flex-fill w-100">
					<div class="card-header">

						<h5 class="card-title mb-0">Browser Usage</h5>
					</div>
					<div class="card-body d-flex">
						<div class="align-self-height col-6 col-xxl-3 d-flex order-1 order-xxl-1  flex-fill w-40">
							<div class="py-3">
								<div class="chart chart-xs">
									<canvas id="chartjs-dashboard-pie"></canvas>
								</div>
							</div>
							<div class=" col-6 col-xxl-3 d-flex order-1 order-xxl-1  flex-fill w-60">
							<table class="table mb-0">
								<tbody>
									<tr>
										<td>Chrome</td>
										<td class="text-end">4306</td>
									</tr>
									<tr>
										<td>Firefox</td>
										<td class="text-end">3801</td>
									</tr>
									<tr>
										<td>IE</td>
										<td class="text-end">1689</td>
									</tr>
								</tbody>
							</table>
						</div>
						</div>
					</div>
				</div>
			</div>
					</div>
</div>
					<div class="row">
					
						
						
					</div>
					

				</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>AdminKit</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

	
	<script>
<%-- 도넛차트 --%>
		document.addEventListener("DOMContentLoaded", function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-dashboard-pie"), {
				type: "pie",
				data: {
					labels: ["Chrome", "Firefox", "IE"],
					datasets: [{
						data: [4306, 3801, 1689],
						backgroundColor: [
							window.theme.primary,
							window.theme.warning,
							window.theme.danger
						],
						borderWidth: 5
					}]
				},
				options: {
					responsive: !window.MSInputMethodContext,
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					cutoutPercentage: 75
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Bar chart
			new Chart(document.getElementById("chartjs-dashboard-bar"), {
				type: "bar",
				data: {
					labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
					datasets: [{
						label: "This year",
						backgroundColor: window.theme.primary,
						borderColor: window.theme.primary,
						hoverBackgroundColor: window.theme.primary,
						hoverBorderColor: window.theme.primary,
						data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
						barPercentage: .75,
						categoryPercentage: .5
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					},
					scales: {
						yAxes: [{
							gridLines: {
								display: false
							},
							stacked: false,
							ticks: {
								stepSize: 20
							}
						}],
						xAxes: [{
							stacked: false,
							gridLines: {
								color: "transparent"
							}
						}]
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var markers = [{
					coords: [31.230391, 121.473701],
					name: "Shanghai"
				},
				{
					coords: [28.704060, 77.102493],
					name: "Delhi"
				},
				{
					coords: [6.524379, 3.379206],
					name: "Lagos"
				},
				{
					coords: [35.689487, 139.691711],
					name: "Tokyo"
				},
				{
					coords: [23.129110, 113.264381],
					name: "Guangzhou"
				},
				{
					coords: [40.7127837, -74.0059413],
					name: "New York"
				},
				{
					coords: [34.052235, -118.243683],
					name: "Los Angeles"
				},
				{
					coords: [41.878113, -87.629799],
					name: "Chicago"
				},
				{
					coords: [51.507351, -0.127758],
					name: "London"
				},
				{
					coords: [40.416775, -3.703790],
					name: "Madrid "
				}
			];
			var map = new jsVectorMap({
				map: "world",
				selector: "#world_map",
				zoomButtons: true,
				markers: markers,
				markerStyle: {
					initial: {
						r: 9,
						strokeWidth: 7,
						stokeOpacity: .4,
						fill: window.theme.primary
					},
					hover: {
						fill: window.theme.primary,
						stroke: window.theme.primary
					}
				},
				zoomOnScroll: false
			});
			window.addEventListener("resize", () => {
				map.updateSize();
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
			var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
			document.getElementById("datetimepicker-dashboard").flatpickr({
				inline: true,
				prevArrow: "<span title=\"Previous month\">&laquo;</span>",
				nextArrow: "<span title=\"Next month\">&raquo;</span>",
				defaultDate: defaultDate
			});
		});
	</script>

</body>

</html>