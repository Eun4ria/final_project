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
        /* Style for the main content div */
        #mainDiv {
            position: relative;
            width: 300px;
            height: 300px;
            background-color: lightblue;
            border: 1px solid #ccc;
            padding: 20px;
            box-sizing: border-box;
        }

        /* Style for the toggled div */
        #toggleDiv {
            position: absolute;
            top: 0;
            left: 100%; /* Start off-screen to the right */
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            transition: left 0.5s; /* Smooth transition */
        }
        
        
    </style>

 <script>
 
function goChat(project_id){
	location.href="chatmemListstart?project_id="+project_id
}
</script>
</head>

<body>

   <div class="wrapper">
<jsp:include page="a00_sideBar.jsp"/>   
   
      <div class="main">
         
        <jsp:include page="a00_top.jsp"/>
<%-- 본문내용 - not toggle --%>
         <main class="content" id="toggleclose">
            <div class="container-fluid p-0">

               <h1 class="h3 mb-3"><strong>To Do</strong> List</h1>
     
            <div class="row mb-4">
        <div class="col-lg-12 col-md-6 mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-6 col-7">
                  <h6>Projects ${project_id}</h6>
                  <p class="text-sm mb-0">
                    <i class="fa fa-check text-info" aria-hidden="true"></i>
                    프로젝트 이름이나 기간 넣기?
                  </p>
                </div>
                
       
    
              </div>
            </div>
            
           <%-- 찐본문 --%>
            <div class="card-body px-0 pb-2" id="mainDiv" >
              <div class="table-responsive">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                    <th></th>
                      <th class=" text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">Task</th>
                     
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">End Date</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Status</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Priority</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Completion</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="task" items="${tasklist}">
                    <tr ondblclick="taskPage('${task.task_id}')">
                    <td>
	                    <div>
                            <input type="checkbox" id="task1" >
           			
                          </div>
                    </td>
                      <td>
                        <div class="d-flex px-2 py-1">
                         
                          <div class="d-flex flex-column justify-content-center">
                            <h6 class="mb-0 text-sm">${task.task_name}</h6>
                          </div>
                        </div>
                      </td>
                      
                      <td >
                      <div class="align-middle text-center" style="border:none">
                         
                          <div class="align-middle text-center ">
                            <h6 class="ml-5 text-center">${task.endDateFormatted }</h6>
                          </div>
                        </div>
                        
                      </td>
                      <td class="align-middle text-center text-sm">
                        <select  class="form-control text-center"  v-model="sta.tstatus" name="tstatus">
				        	<option value="N">${task.tstatus}</option>
				        	<option value="진행중">진행중</option>
				        	<option value="완료">완료</option>
				        	<option value="중단">중단</option>
				        	<option value="막힘">막힘</option>
			       		</select>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <select  class="form-control text-center"  v-model="pri.priority" name="priority">
				        	<option value="N">${task.priority}</option>
				        	<option value="상">상</option>
				        	<option value="중">중</option>
				        	<option value="하">하</option>
			       		</select>
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
        </div>
        
                     
               </div>

               <div class="row">
               
                  
                  
                  
                  
                  <div class="col-sm-11 col-lg-6 col-md-6 col-xl-6" >
                        
                    </div>
               </div>
               

            </div>
         </main>
<%-- 본문내용 - not toggle --%>
<%-- 본문내용 - toggle --%>
        <main class="content" id="togglediv">
            <div class="container-fluid p-0">

          
      <div class="container">

        <div class="row mb-5">
          <div class="col-lg-12" style="background:white; padding:0">
          <a class="sidebar-toggle js-sidebar-toggle" >
          <i class="hamburger align-self-center"></i>
        </a>
            <form class="p-4 p-md-5 border rounded" method="post">
              <h3 class="text-black mb-5 border-bottom pb-2">Job Details</h3>
              
              <div class="form-group">
                <label for="company-website-tw d-block">Upload Featured Image</label> <br>
                <label class="btn btn-primary btn-md btn-file">
                  Browse File<input type="file" hidden>
                </label>
              </div>

              <div class="form-group">
                <label for="email">Email</label>
                <input type="text" class="form-control" id="email" placeholder="you@yourdomain.com">
              </div>
              <div class="form-group">
                <label for="job-title">Job Title</label>
                <input type="text" class="form-control" id="job-title" placeholder="Product Designer">
              </div>
              <div class="form-group">
                <label for="job-location">Location</label>
                <input type="text" class="form-control" id="job-location" placeholder="e.g. New York">
              </div>

              <div class="form-group">
                <label for="job-region">Job Region</label>
                <select class="selectpicker border rounded" id="job-region" data-style="btn-black" data-width="100%" data-live-search="true" title="Select Region">
                      <option>Anywhere</option>
                      <option>San Francisco</option>
                      <option>Palo Alto</option>
                      <option>New York</option>
                      <option>Manhattan</option>
                      <option>Ontario</option>
                      <option>Toronto</option>
                      <option>Kansas</option>
                      <option>Mountain View</option>
                    </select>
              </div>

              <div class="form-group">
                <label for="job-type">Job Type</label>
                <select class="selectpicker border rounded" id="job-type" data-style="btn-black" data-width="100%" data-live-search="true" title="Select Job Type">
                  <option>Part Time</option>
                  <option>Full Time</option>
                </select>
              </div>


              <div class="form-group">
                <label for="job-description">Job Description</label>
                <div class="editor" id="editor-1">
                  <p>Write Job Description!</p>
                </div>
              </div>


              <h3 class="text-black my-5 border-bottom pb-2">Company Details</h3>
              <div class="form-group">
                <label for="company-name">Company Name</label>
                <input type="text" class="form-control" id="company-name" placeholder="e.g. New York">
              </div>

              <div class="form-group">
                <label for="company-tagline">Tagline (Optional)</label>
                <input type="text" class="form-control" id="company-tagline" placeholder="e.g. New York">
              </div>

              <div class="form-group">
                <label for="job-description">Company Description (Optional)</label>
                <div class="editor" id="editor-2">
                  <p>Description</p>
                </div>
              </div>
              
              <div class="form-group">
                <label for="company-website">Website (Optional)</label>
                <input type="text" class="form-control" id="company-website" placeholder="https://">
              </div>

              <div class="form-group">
                <label for="company-website-fb">Facebook Username (Optional)</label>
                <input type="text" class="form-control" id="company-website-fb" placeholder="companyname">
              </div>

              <div class="form-group">
                <label for="company-website-tw">Twitter Username (Optional)</label>
                <input type="text" class="form-control" id="company-website-tw" placeholder="@companyname">
              </div>
              <div class="form-group">
                <label for="company-website-tw">Linkedin Username (Optional)</label>
                <input type="text" class="form-control" id="company-website-tw" placeholder="companyname">
              </div>

              <div class="form-group">
                <label for="company-website-tw d-block">Upload Logo</label> <br>
                <label class="btn btn-primary btn-md btn-file">
                  Browse File<input type="file" hidden>
                </label>
              </div>

            </form>
            
           
          </div>

         
        </div>
        <div class="row align-items-center mb-5">
          
          <div class="col-lg-4 ml-auto">
            <div class="row">
              <div class="col-6">
                <a href="#" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>Preview</a>
              </div>
              <div class="col-6">
                <a href="#" class="btn btn-block btn-primary btn-md">Save Job</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </main>
    
  <%-- 본문내용 toggle 끝--%>
         
      </div>
   </div>

   <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $("#toggleopen").hide();

        window.taskPage = function(task_id) { // 프로젝트 리스트에서 해당 프로젝트의 행을 클릭했을 때 실행되는 함수
            alert("토글 가즈아" + task_id );

            // 토글 열기/닫기
            $("#toggleopen").toggleClass("show");

        }

        $("#closeBtn").click(function(){
            $("#toggleopen").removeClass("show");
        });
    });
</script>
  
<script>
var vm = Vue.createApp({
	name:"App",
	data(){
		return {sta:{tstatus:"N"},
				pri:{priority:'N'}	
		}
				
		};
	};
});
</script>

   
 <!-- SCRIPTS -->
    <script src="${path}/jobboard-master/js/jquery.min.js"></script>
    <script src="${path}/jobboard-master/js/bootstrap.bundle.min.js"></script>
    <script src="${path}/jobboard-master/js/isotope.pkgd.min.js"></script>
    <script src="${path}/jobboard-master/js/stickyfill.min.js"></script>
    <script src="${path}/jobboard-master/js/jquery.fancybox.min.js"></script>
    <script src="${path}/jobboard-master/js/jquery.easing.1.3.js"></script>
    
    <script src="${path}/jobboard-master/js/jquery.waypoints.min.js"></script>
    <script src="${path}/jobboard-master/js/jquery.animateNumber.min.js"></script>
    <script src="${path}/jobboard-master/js/owl.carousel.min.js"></script>
    <script src="${path}/jobboard-master/js/quill.min.js"></script>
    
    
    <script src="${path}/jobboard-master/js/bootstrap-select.min.js"></script>
    
    <script src="${path}/jobboard-master/js/custom.js"></script>
   
</body>

</html>