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

<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
 <style>
     body {
         margin: 0;
         font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
     }
     .wrapper {
         display: flex;
         
     }
     .content{
    	 background-color: white;
     }
     .sidebar {
         width: 250px; /* 사이드바의 너비를 설정 */
         background-color: #f8f9fa; /* 사이드바의 배경색 */
         min-height: 100vh; /* 사이드바가 화면 전체 높이를 차지하게 */
     }
     .content {
         flex: 1;
         padding: 20px;    
     }
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="${path}/a00_com/dist/index.global.js"></script>
<script>
function goChat(user_id){
	location.href="message?user_id="+user_id
}
</script>
<script type="text/javascript">
	var calendar;
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var today = new Date()
		// 오늘 날짜 세팅
		var todayTitle = today.toISOString().split("T")[0]
		calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			initialDate : todayTitle,
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				$("#showModel").click()
				$("#modalTitle").text("일정등록")
				$("#regBtn").show()
				$("#uptBtn").hide()
				$("#delBtn").hide()
				addForm(arg,"I")
			},
			eventClick : function(arg) {
				$("#modalTitle").text("일정상세")
				$("#showModel").click()
				$("#regBtn").hide()
				$("#uptBtn").show()
				$("#delBtn").show()			
				addForm(arg.event)
				
			},
			eventDrop:function(arg){
				addForm(arg.event)
				ajaxFun("updateCalendar")
				
			},
			eventResize:function(arg){
				addForm(arg.event)
				ajaxFun("updateCalendar")
				
			},			
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events : function(info, successCallback, failureCallback) {
				$.ajax({
					url : "calList",
					method:"post",
					dataType : "json",
					success : function(data) {
						console.log(data)
						calendar.removeAllEvents()
						successCallback(data)
						// 조회시:data,  등록,수정,삭제시:  data.msg data.calList

					},
					error : function(err) {
						failureCallback(err)
					}
				})
			}
			
			
		});
		calendar.render();
		
		
		$("#regBtn").click(function(){
			if(confirm("등록하시겠니까?")){
				// 등록 처리 ajax 처리..
				 ajaxFun("insertCalendar")
			}		
		})
		// uptBtn delBtn
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠니까?")){
				 ajaxFun("updateCalendar")
			}		
		})		
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠니까?")){
				 ajaxFun("deleteCalendar")
			}		
		})			
		
		// 클릭시/선택시/스크롤시 전달되어온 일정을 매개변수로 모달 창에 할당 처리..
		
		function addForm(event, proc){
			console.log("#일정#")
			console.log(event)
			$("form")[0].reset()
			if(proc != "I" ){
				$("[name=id]").val(event.id)
				$("[name=backgroundColor]").val(event.backgroundColor)
				$("[name=textColor]").val(event.textColor)
				
				$("[name=writer]").val(event.extendedProps.writer)
				$("[name=content]").val(event.extendedProps.content)
				$("[name=urlLink]").val(event.extendedProps.urlLink)				
			}
			$("[name=title]").val(event.title)
			$("[name=start]").val(event.startStr)
			$("#start").val(event.start.toLocaleString())
			if(event.end != null) {
				$("[name=end]").val(event.endStr)
				$("#end").val(event.end.toLocaleString())
			}else{
				$("[name=end]").val(event.startStr)
				$("#end").val(event.start.toLocaleString())			
			}			
			$("[name=allDay]").val(event.allDay?1:0)
			
			// 추가 속성..

			
			//calendar.unselect()
		}
		function ajaxFun(url){
			$.ajax({
				type:"post",
				url:url,
				data:$("form").serialize(),
				dataType:"json",
				success:function(data){
					alert(data.msg)  //  data.msg data.calList
					calendar.removeAllEvents()
					calendar.addEventSource(data.calList)
					// 수정 처리 외외는 창닫기 처리..
					if(data.msg.indexOf("수정")==-1){
						$("#clsBtn").click()	
					}
					
				},
				error:function(err){
					console.log(err)
				}
			})
		}
		
		
	});
</script>
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
                 <li class="nav-item">
					<a class="nav-icon dropdown-toggle" onclick="goChat('${sessionScope.project_id}')" id="messagesDropdown">
							<i class="align-middle" data-feather="message-square"></i>
					</a>
					
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
         
        <div class="content">
            <div class="container">
                <div id='calendar'></div>

				<div id="showModel" data-toggle="modal" data-target="#calModal"></div>
			
				<div class="modal fade" id="calModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="modalTitle">타이틀</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="frm02" class="form" method="post">
									<input type="hidden" name="id" value="0"/>
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">일정명</span>
										</div>
										<input name="title" placeholder="입정 입력"  class="form-control" />	
									</div>	
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">작성자</span>
										</div>
										<input name="writer" placeholder="작성자 입력"  class="form-control" />	
									</div>	
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">시 작(일/시)</span>
										</div>
										<input id="start"  class="form-control" /><!-- 화면에 보일 날짜/시간.. -->	
										<input name="start" type="hidden"   />	<!-- 실제 저장할 날짜/시간 -->
									</div>	
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">종 료(일/시)</span>
										</div>
										<input id="end"  class="form-control" />	
										<input name="end" type="hidden"   />	
									</div>		
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">내용</span>
										</div>
										<textarea name="content" rows="5" cols="10" class="form-control"></textarea>			
									</div>	
																				
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">배경색상</span>
										</div>
										<input name="backgroundColor" value="#0099cc" type="color" placeholder="색상선택"  class="form-control" />	
									</div>	
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">글자색상</span>
										</div>
										<input name="textColor"   value="#ccffff"  type="color" placeholder="글자선택"  class="form-control" />	
									</div>							
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">종일여부</span>
										</div>
										<select name="allDay"  class="form-control" >
											<option value="1">종일</option>
											<option value="0">시간</option>
										</select>	
									</div>	
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center">연관페이지</span>
										</div>
										<input name="urlLink" placeholder="연관 url링크 주소 입력"  class="form-control" />	
									</div>																										
				
			
			
								</form>
							</div> 
							<div class="modal-footer">
								<button id="regBtn" type="button" class="btn btn-primary">등록</button>				
								<button id="uptBtn" type="button" class="btn btn-info">수정</button>				
								<button id="delBtn" type="button" class="btn btn-danger">삭제</button>				
								<button id="clsBtn" type="button" class="btn btn-secondary"
									data-dismiss="modal">창닫기</button>				
							</div>
						</div>
					</div>
				</div>
            </div>
        </div>
    </div>
    </div>
</body>
</html>