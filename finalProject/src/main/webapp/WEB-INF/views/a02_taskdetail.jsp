<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <!-- Nucleo Icons 
  <link href="${path}/material-dashboard-2/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="${path}/material-dashboard-2/assets/css/nucleo-svg.css" rel="stylesheet" />
  -->
  <!-- Font Awesome Icons   -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>

  <!-- Material Icons 
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
 -->
  <!-- CSS Files 
  
  <link id="pagestyle" href="${path}/material-dashboard-2/assets/css/material-dashboard.css?v=3.0.0" rel="stylesheet" />-->
  
  <!-- MAIN CSS -->
    <link rel="stylesheet" href="${path}/jobboard-master/css/style.css">    
   
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
   
    <%-- 기존 --%>
  <script src="${path}/adminkit-3.1.0/static/js/app.js"></script>
 <script>
 var msg="${msg}"
var proc = "${proc}"
 if(msg != "") {
     

     if (msg=="수정성공"){

    	 // 부모 페이지를 새로 고침하는 함수
    	 parent.window.location.href = parent.window.location.href;
     }
    
	if(proc == 'del'){
		alert(msg)
		
		location.href="todoFrm"
	}
 }
 
 let isExpanded = false;

 function sendResizeMessage(width) {
     window.parent.postMessage({ type: 'resize', width: width }, '*');
 }

 function toggleResize() {
     // 현재 상태에 따라 너비 설정
     if (isExpanded) {
         sendResizeMessage('70%');  // 기본 너비
     } else {
         sendResizeMessage('100%'); // 확장된 너비
     }
     // 상태 토글
     isExpanded = !isExpanded;
 }

 document.addEventListener('DOMContentLoaded', function() {
     var sidebarToggle = document.querySelector('.js-sidebar-toggle');
     sidebarToggle.addEventListener('click', function() {
         toggleResize();
     });
 });

 window.addEventListener('message', function(event) {
     if (event.data.type === 'reset') {
         sendResizeMessage('70%');  // 기본 너비로 설정
         isExpanded = false;  // 상태 리셋
     }
 });

 
</script>
<style>

 body{
 background-color: rgba(248,249,251, 0.3);
 overflow-x:hidden;
}

</style>

</head>

<body>

  
   

<%-- 본문내용 --%>
         <main class="content">
           

          
      <div class="container border rounded" style="background:white"> 

        <div class="row mb-5">
          <div class="col-lg-12" style="background:white; padding:0">
          
<%-- pm권한 --%>
  <%-- form --%>  
<c:choose>  
 <c:when test="${fn:startsWith(sessionScope.user_id, 'P_')}"> 
          <form class="p-4  rounded" method="post" id="PMrole" >  
          <div>
             <a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>  <i class="bi bi-x"></i>
        </a>
              <h3 class="text-black mb-3 border-bottom pb-2">Job Details</h3>
              
              
      
<%-- task id --%> <%-- parent id --%>
        	 <div class="form-group">
                <label for="taskid" style="padding-right:12rem;">Task ID</label>  <label for="parent_id">Parent ID</label><br>
                <input type="text" class="form-control" id="task_id" style="width:15rem;display:inline-block" name="task_id" value="${taskdetail.task_id }" readonly>
          
 				<input type="text" class="form-control" id="parent_id" style="width:15rem;display:inline-block" name="parent_id" value="${taskdetail.parent_id}" readonly>
              </div>
  <%-- user Id --%>               
              <div class="form-group">
               <label for="user_id">User ID</label>
                <input type="text" class="form-control" id="user_id" style="width:14rem;display:inline-block" name="user_id" value="${taskdetail.user_id}">

              </div>
           
 <%-- task name --%>
              <div class="form-group">
                <label for="job-title">Task Title</label>
                <input type="text" class="form-control" id="task-title" name="task_name" value="${taskdetail.task_name}" >
              </div>
              
   <%-- Day --%>           
   			  <div class="form-group">
                <label for="start"  style="padding-right:11rem;">Start Date</label> <label for="end">End Date</label><br>
                <input type="Date" class="form-control" id="start" style="width:15rem;display:inline-block" name="start_date" value="${taskdetail.startDateFormatted}" >
             
                
                <input type="Date" class="form-control" id="end" style="width:15rem;display:inline-block" name="end_date" value="${taskdetail.endDateFormatted}" >
              </div>

   <%-- Status  --%>  
              
              <div class="form-group" style="display:inline-block" id="app">
                <label for="tstatus" style="padding-right:11rem;">Status</label>   <label for="priority">priority</label><br> 
         
                <select class="selectpicker border rounded" data-live-search="true" name="tstatus" style="width:15rem" > 
		        	<option class="text-center"  value="${taskdetail.tstatus}" hidden>${taskdetail.tstatus}</option>
		        	<option class="text-center"  value="진행중">진행중</option>
		        	<option class="text-center"  value="중단">중단</option>
		        	<option class="text-center"  value="막힘">막힘</option>
		        	<option class="text-center"  value="보완">보완</option>
                  </select>
              
              
  <%-- priority --%>   
              
                 <select class="selectpicker border rounded" id="priority" data-style="btn-black" data-live-search="true" style="width:15rem" :title="${taskdetail.priority}" name="priority">
		        	<option class="text-center"  value="${taskdetail.priority}" hidden>${taskdetail.priority}</option>
		        	<option class="text-center"  value="상">상</option>
		        	<option class="text-center"  value="중">중</option>
		        	<option class="text-center"  value="하">하</option>
                 </select>
              </div>
              
 <%-- Project id --%> 
               <div class="form-group">
               <%--  <label for="project_id">Project Id</label>--%>
                <input type="text" class="form-control" id="project_id" name="project_id" value="${taskdetail.project_id}" hidden>
              </div>

 <%-- Progress --%> 
              <div class="form-group">
                <label for="company-website-tw d-block">Progress</label> <br>        
                
                   <div class="progress-info">
                     <div class="progress-percentage"> 
                       <input class="text-xs font-weight-bold" id="progress" name="progress" value="${taskdetail.progress}" style="border:none;width:2rem;" ><span  class="text-xs font-weight-bold" >%</span>
                     </div>
                   </div>
                   <div class="progress mx-auto">
                   <div class="progress-bar bg-gradient-info" style="width: ${taskdetail.progress}%;" role="progressbar" aria-valuenow="${taskdetail.progress}" aria-valuemin="0" aria-valuemax="100"></div>
                   </div>      
              </div>
 <%-- content --%> 
              <div class="form-group">
                <label for="comment">content</label>
   <%--            <div class="editor" id="editor-1">
                  <p>Write Job Description!</p>
                </div>
            --%>  
              <input type="text" class="form-control" id="content" name="content" value="${taskdetail.content}">
              </div>


 <%-- Upload File --%> 
              <div class="form-group">
                <label for="company-website-tw d-block">Upload File</label> <br>
                <label class="btn btn-primary btn-md btn-file">
                  Browse File<input type="file" >
                </label>
              </div>
 		
 		
 		  <div class="form-group">
                <label for="company-website-tw d-block">Upload File</label> <br>
                <input type="file" name="reports" multiple="multiple" class="form-control" value="" />	
                
                <br>
                <label for="noti">Uploaded File</label> 
                <c:choose>
                 <c:when test="${not empty fileinfo}" >
				    <!-- 파일 이름 리스트가 비어 있지 않은 경우 -->
				    <ul>
				        <c:forEach var="fileinfo" items="${fileinfo}">
				            <li><p style="margin:0"> File name: ${fileinfo.fname}</p>  <p>-> upload time: ${fileinfo.regdate }</p> </li>
				        </c:forEach>
				    </ul>
				</c:when>
				 <c:otherwise>
				   <p>  <!-- 파일 이름 리스트가 비어 있는 경우 --> </p>
				 </c:otherwise>
				
				 </c:choose>
				
				
                
              </div>
</div>
            </form>
    <%--  pm 권한 끝--%> 
 
 </c:when>
 <c:otherwise>
 
   <%-- 멤버 권한  --%> 
   <%-- form --%>            
              <form class="p-4  rounded" method="post" id="MEMrole" enctype="multipart/form-data">  
          <div>
             <a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>  <i class="bi bi-x"></i>
        </a>
              <h3 class="text-black mb-3 border-bottom pb-2">Job Details</h3>
              
              
      
<%-- task id --%> <%-- parent id --%>
        	 <div class="form-group">
                <label for="taskid" style="padding-right:12rem;">Task ID</label>  <label for="parent_id">Parent ID</label><br>
                <input type="text" class="form-control" id="task_id" style="width:15rem;display:inline-block" name="task_id" value="${taskdetail.task_id }" readonly>
          
 				<input type="text" class="form-control" id="parent_id" style="width:15rem;display:inline-block" name="parent_id" value="${taskdetail.parent_id}" readonly>
                <input type="text" class="form-control" id="user_id" style="width:14rem;display:inline-block" name="user_id" value="${taskdetail.user_id}" hidden>
             
              
               
              </div>
              
 <%-- task name --%>
              <div class="form-group">
                <label for="job-title">Task Title</label>
                <input type="text" class="form-control" id="task-title" name="task_name" value="${taskdetail.task_name}" >
              </div>
              
   <%-- Day --%>           
   			  <div class="form-group">
                <label for="start"  style="padding-right:11rem;">Start Date</label> <label for="end">End Date</label><br>
                <input type="Date" class="form-control" id="start" style="width:15rem;display:inline-block" name="start_date" value="${taskdetail.startDateFormatted}" readonly>
             
                
                <input type="Date" class="form-control" id="end" style="width:15rem;display:inline-block" name="end_date" value="${taskdetail.endDateFormatted}" readonly>
              </div>

  <%-- Status  --%>  
              
              <div class="form-group" style="display:inline-block" id="app">
                <label for="tstatus" style="padding-right:11rem;">Status</label>   <label for="priority">priority</label><br> 
         
                <select class="selectpicker border rounded" data-live-search="true" name="tstatus" > 
		        	<option class="text-center"  value="${taskdetail.tstatus}" hidden>${taskdetail.tstatus}</option>
		        	<option class="text-center"  value="진행중">진행중</option>
		        	<option class="text-center"  value="중단">중단</option>
		        	<option class="text-center"  value="막힘">막힘</option>
		        	<option class="text-center"  value="보완">보완</option>
                  </select>
              
              
  <%-- priority --%>   
              
                 <select class="selectpicker border rounded" id="priority" data-style="btn-black" data-live-search="true"  :title="${taskdetail.priority}" name="priority">
		        	<option class="text-center"  value="${taskdetail.priority}" hidden>${taskdetail.priority}</option>
		        	<option class="text-center"  value="상">상</option>
		        	<option class="text-center"  value="중">중</option>
		        	<option class="text-center"  value="하">하</option>
                 </select>
              </div>

              
 <%-- Project id --%> 
               <div class="form-group">
               <%--  <label for="project_id">Project Id</label>--%>
                <input type="text" class="form-control" id="project_id" name="project_id" value="${taskdetail.project_id}" hidden>
              </div>

 <%-- Progress --%> 
              <div class="form-group">
                <label for="company-website-tw d-block">Progress</label> <br>        
                
                   <div class="progress-info">
                     <div class="progress-percentage"> 
                       <input class="text-xs font-weight-bold" id="progress" name="progress" value="${taskdetail.progress}" style="border:none;width:2rem;" readonly><span  class="text-xs font-weight-bold" >%</span>
                     </div>
                   </div>
                   <div class="progress mx-auto">
                   <div class="progress-bar bg-gradient-info" style="width: ${taskdetail.progress}%;" role="progressbar" aria-valuenow="${taskdetail.progress}" aria-valuemin="0" aria-valuemax="100"></div>
                   </div>      
              </div>
 <%-- content --%> 
              <div class="form-group">
                <label for="comment">content</label>
   <%--            <div class="editor" id="editor-1">
                  <p>Write Job Description!</p>
                </div>
            --%>  
              <input type="text" class="form-control" id="content" name="content" value="${taskdetail.content}">
              </div>


 <%-- Upload File --%> 
              <div class="form-group">
                <label for="company-website-tw d-block">Upload File</label> <br>
                <input type="file" name="reports" multiple="multiple" class="form-control" value="" />	
                
                <br>
                <label for="noti">Uploaded File</label> 
                <c:choose>
                 <c:when test="${not empty fileinfo}" >
				    <!-- 파일 이름 리스트가 비어 있지 않은 경우 -->
				    <ul>
				        <c:forEach var="fileinfo" items="${fileinfo}">
				            <li><p style="margin:0"> 
				            File name: <a href="javascript:download('${fileinfo.fname }')">${fileinfo.fname}</a>,&nbsp;&nbsp;</p>  
				            <p>-> upload time: ${fileinfo.regdate }</p> </li>
				         </c:forEach>
				         <script>
							function download(fname){
								if (fname.trim() === "") {
							        alert("파일 이름이 유효하지 않습니다.");
							        return "todoFrm";
							    }
								if(confirm(fname+"다운로드하시겠습니까?")){
									location.href="downLoad.do?fname="+fname
								}
							}
						</script>
				    </ul>
				</c:when>
				 <c:otherwise>
				   <p>  <!-- 파일 이름 리스트가 비어 있는 경우 --> </p>
				 </c:otherwise>
				
				 </c:choose>
				
				
                
              </div>
 		
 		
 		<div class="col-lg-4 ml-auto " style="margin-bottom:20rem">
            <div class="row">
              <div class="col-6">
                <a href="#" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>Go Up</a>
              </div>
              <div class="col-6" style="margin-bottom:3rem;">
             	 <input type="button" value="수정" class="btn btn-block btn-primary btn-md" id="uptBtn"> 
              </div>
            </div>
          </div>
</div>
            </form>
          
           <%-- 멤버 권한 끝 --%> 
            </c:otherwise>
 </c:choose>              
           
        
         
         </div>

         
        </div>
        </div>

  
    </main>
  

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
    
    <script>
    var vm = Vue.createApp({
    	name:"App",
    	data(){
    		return {pr:{priority:"${taskdetail.priority}"},
    				st:{tstatus:"${taskdetail.tstatus}"}
    				
    		};
    	};
    }).mount('#app');
</script>
    <script src="${path}/jobboard-master/js/custom.js"></script>
  <!-- End General Form Elements -->
		<script type="text/javascript">
			$("#uptBtn").click(function() {
				if (confirm("수정하시겠습니까?")) {
					$("#MEMrole").attr("action", "upttask");
					$("#MEMrole").submit();
					
				}
			})
			$("#uptPMBtn").click(function() {
				if (confirm("pm: 수정하시겠습니까?")) {
					$("#PMrole").attr("action", "upttask");
					$("#PMrole").submit();
				}
			})
			
			$("#delBtn").click(function() {
				if (confirm("삭제하시겠습니까?")) { 
					location.href = "deltask?task_id="+ $("[name=task_id]").val()
				}
			})
			
	</script>      
 
 
   
     
  </body>
</html>