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
  	<link rel="icon" sizes="85x85" type="image/png" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">

<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

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

<script src="${path}/a00_com/dist/index.global.js"></script>
<script>
function goChat(user_id){
	location.href="chatmemListstart
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
			select : function(arg) { // 빈 공간 클릭 시
				$("#showModel").click()
				$("#modalTitle").text("일정등록")
				$("#regBtn").show()
				$("#uptBtn").hide()
				$("#delBtn").hide()
				addForm(arg,"I")
				
			},
			/* eventAllow: function (dropInfo, event) {
		        var view = calendar.view;
		        var isWeekOrDayView = view.type !== 'timeGridWeek' && view.type !== 'timeGridDay';
		        
		        // 주 또는 일 단위 수정 불가능
		        return isWeekOrDayView;
		    }, */
			eventDidMount: function(info) { // 바 두께 설정
	            info.el.style.height = '25px'; 
	            info.el.style.lineHeight = '25px'; 
		    },			
			eventClick : function(arg) { // 이벤트 클릭 시
				$("#modalTitle").text("일정상세")
				$("#showModel").click()
				$("#regBtn").hide()
				$("#uptBtn").show()
				$("#delBtn").show()			
				addForm(arg.event)
				
				// 간트 프로젝트 상세 부분
				if(isGantt()){ // 간트 차트일 때
					$("#regBtn").hide()
					$("#uptBtn").hide()
					$("#delBtn").hide()
					$("[name=writer]").val("프로젝트 일정")
					$("#writer").text("종류")						
				}
				if(!isUserEvent(arg.event)){ // 본인 일정이 아닐 때
					$("#regBtn").hide()
					$("#uptBtn").hide()
					$("#delBtn").hide()
				}
				
			},
			eventDrop:function(arg){ // 이벤트 드랍
				addForm(arg.event)
				if (isGantt() || !isUserEvent(arg.event)) { // 간트일정이거나 본인일정이 아닐 때 이벤트 방지
					arg.revert();
				}else{					
					ajaxFun("updateCalendar")
				}	
			},
			eventResize:function(arg){ // 리사이즈
				addForm(arg.event)
				if (isGantt() || !isUserEvent(arg.event)) {
					arg.revert();
				}else{
					ajaxFun("updateCalendar")
				}				
			},			
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events : function(info, successCallback, failureCallback) {
				var selectedValues = getSelectboxArray(); // 체크박스 선택목록 배열형태				
				$.ajax({
					url : "calList",
					method:"post",
					traditional: true, // 배열 직렬화
					data: {sel: selectedValues}, // 선택한checkbox
					success : function(data) {
						console.log(data)
						calendar.removeAllEvents()
						successCallback(data)
						console.log("선택한 보기 방식")
						console.log(selectedValues)

					},
					error : function(err) {
						failureCallback(err)
					}
				})
			}
			
			
		});
		calendar.render();
				
        
        // 체크박스 상태에 따라 일정을 새로 고침
        $("#personal, #team, #gantt1").change(function() {
            calendar.refetchEvents();
        });
		
		
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				 ajaxFun("insertCalendar")
			}		
		})
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				 ajaxFun("updateCalendar")
			}
		})		
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				ajaxFun("deleteCalendar")
			}	
		})	
		
		
		// 클릭시/선택시/스크롤시 전달되어온 일정을 매개변수로 모달 창에 할당 처리..
		
		function addForm(event, proc){
			console.log("#일정#")
			console.log(event)
			$("form")[0].reset()
			// 팝업창 content 비움
			$("[name=content]").val("");
			// 등록 기본값을 P(개인으로 설정)
			$("[name=entity_type]").val("P");
			
			if(proc != "I" ){
				$("[name=id]").val(event.id)
				$("[name=backgroundColor]").val(event.backgroundColor)
				$("[name=textColor]").val(event.textColor)				
				$("[name=writer]").val(event.extendedProps.writer)
				$("[name=content]").val(event.extendedProps.content)
				//$("[name=urlLink]").val(event.extendedProps.urlLink)	
				//$("[name=sel]").val(event.extendedProps.sel);
				$("[name=user_id]").val(event.extendedProps.user_id);
				$("[name=project_id]").val(event.extendedProps.project_id);				
				$("[name=entity_type]").val(event.extendedProps.entity_type);
			}else{// 등록 시 작성자명 세션에 저장된 이름 표시
				$("[name=writer]").val("${sessionScope.user_name}")				
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
			$("[name=allDay]").val(event.allDay?1:0);
			$("[name=entity_type]").change(function () { 
		        if ($("[name=entity_type]").val() === "T") {
		            $("[name=project_id]").val("${sessionScope.project_id}");
		        } else {
		            $("[name=project_id]").val("");
		        }
		    });
			
			//calendar.unselect()
		}
		
		function ajaxFun(url){
			$.ajax({
				type:"post",
				url:url,
				data:$("form").serialize(),
				dataType:"json",
				success:function(data){
					if (data.msg.indexOf("실패") === -1) {
						alert(data.msg)						
                    }
					calendar.refetchEvents();
					// data.msg에 수정이 포함되어 있지 않을 때
					if (data.msg.indexOf("수정") === -1) { 
						$("#clsBtn").click()
                    }
					
				},
				error:function(err){
					console.log(err)
				}
			})
		}
		// 체크박스 상태에 따라 sel 배열 생성
        function getSelectboxArray() {
	        var sel = [];
	        if ($("#personal").is(":checked")) sel.push("P");
	        if ($("#team").is(":checked")) sel.push("T");
	        if ($("#gantt1").is(":checked")) sel.push("G");
	        return sel;
	    }
		// event작성자와 현재 사용자가 일치하는지 확인
        function isUserEvent(event) {
            return event.extendedProps.user_id === '${sessionScope.user_id}'; // 예시: userId 비교
        }
		// 프로젝트 일정(간트) 인지 확인
        function isGantt() {
		    // writer 필드가 빈 값이거나 존재하지 않는 경우 간트 차트로 간주
		    var writerVal = $("[name=writer]").val();
		    return !writerVal
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
               <li class="nav-item dropdown">
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
                    
                  </li>
               </ul>
            </div>
         </nav>
         
        <div class="content">
            <div class="container">
         <c:choose>
           <c:when test="${sessionScope.project_id != null && sessionScope.project_id != ''}">
            <label for="personal" class="p-1" style="background:#85eee2;color:black; border-radius:5px;">
                <input type="checkbox" id="personal" checked> Personal
            </label>           
            <label for="team" class="p-1" style="background:#c266f4;color:white; border-radius:5px;">
                <input type="checkbox" id="team"> Team
            </label>
		    <label for="gantt1" class="p-1" style="background:#d8ee95;color:black; border-radius:5px;">
              	<input type="checkbox" id="gantt1"> Gantt(Project)
          	</label> 
			</c:when>			
			 <c:otherwise>
                	<input type="checkbox" id="personal" checked hidden>
		    </c:otherwise>
		</c:choose>
            
            
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
								<input type="hidden" name="id"/>
									<div class="input-group mb-3">	
										<div class="input-group-prepend">
											<span class="input-group-text justify-content-center" style="width:6rem" id="writer">작성자</span>
										</div>
										<input name="writer"  class="form-control" readonly/>	
									</div>
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center" style="width:6rem">프로젝트 ID</span>
										</div>
										<input name="project_id"  class="form-control" readonly/>	
									</div>
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center" style="width:6rem">일정명</span>
										</div>
										<input name="title" placeholder="일정 입력"  class="form-control" />	
									</div>								
									<div class="input-group mb-3">	
										<div class="input-group-prepend">
											<span class="input-group-text justify-content-center" style="width:6rem">시 작(일/시)</span>
										</div>
										<input id="start" class="form-control" readonly style="background-color: white; color: gray;" /><!-- 화면에 보일 날짜/시간.. -->	
										<input name="start" type="hidden" />	<!-- 실제 저장할 날짜/시간 -->
									</div>	
									<div class="input-group mb-3">	
										<div class="input-group-prepend">
											<span class="input-group-text justify-content-center" style="width:6rem">종 료(일/시)</span>
										</div>
										<input id="end" class="form-control" readonly style="background-color: white; color: gray;" />	
										<input name="end" type="hidden" />	
									</div>
													
										<input type="hidden" name="allDay" value="1" class="form-control">
									
									<div class="input-group mb-3">	
										<div class="input-group-prepend">
											<span class="input-group-text justify-content-center" style="width:6rem">팀/개인</span>
										</div>
										<select name="entity_type" class="form-control">
											<option value="P">개인</option>
											<option value="T">팀</option>											
										</select>
									</div>			
									<div class="input-group mb-3">	
										<div class="input-group-prepend ">
											<span class="input-group-text  justify-content-center" style="width:6rem">내용</span>
										</div>
										<textarea name="content" rows="5" cols="10" class="form-control"></textarea>			
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