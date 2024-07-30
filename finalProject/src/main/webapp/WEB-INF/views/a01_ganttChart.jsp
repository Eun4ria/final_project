<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<link rel="preconnect" href="https://fonts.gstatic.com">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="icon" sizes="85x85" type="image/png" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">

	<link rel="canonical" href="https://demo-basic.adminkit.io/pages-profile.html" />

	<title>HPM-Project Manager System</title>

	<link href="${path}/adminkit-3.1.0/static/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<script src="${path}/a00_com/jquery.min.js"></script>
	<script src="${path}/a00_com/popper.min.js"></script>
	<script src="${path}/a00_com/bootstrap.min.js"></script>
	<script src="${path}/a00_com/jquery-ui.js"></script>
	<script src="${path}/a00_com/dist/index.global.js"></script>
	
	<!-- gantt -->
	<script src="${path}/gantt_trial/codebase/dhtmlxgantt.js?v=8.0.9"></script>
	<link rel="stylesheet" href="${path}/gantt_trial/codebase/dhtmlxgantt.css?v=8.0.9">
	<link rel="stylesheet" href="${path}/gantt_trial/common/controls_styles.css?v=8.0.9">
	
<style>
	html, body {
		height: 80%;
		padding: 0px;
		margin: 0px;
		overflow: hidden;
	}

	.summary-row,
	.summary-row.odd {
		background-color: #EEEEEE;
		font-weight: bold;
	}

	.gantt_grid div,
	.gantt_data_area div {
		font-size: 12px;
	}

	.summary-bar {
		opacity: 0.4;
	}
</style>
</head>
	
<body style="overflow: hidden">
	<div class="wrapper">
	<jsp:include page="a00_sideBar.jsp"/> 

<!-- top -->
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
							<a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown" data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="message-square"></i>
								</div>
							</a>
							<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="messagesDropdown">
								<div class="dropdown-menu-header">
									<div class="position-relative">
										4 New Messages
									</div>
								</div>
								<div class="list-group">
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="${path}/adminkit-3.1.0/static/img/avatars/avatar-5.jpg" class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Vanessa Tucker</div>
												<div class="text-muted small mt-1">Nam pretium turpis et arcu. Duis arcu tortor.</div>
												<div class="text-muted small mt-1">15m ago</div>
											</div>
										</div>
									</a>
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="${path}/adminkit-3.1.0/static/img/avatars/avatar-2.jpg" class="avatar img-fluid rounded-circle" alt="William Harris">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">William Harris</div>
												<div class="text-muted small mt-1">Curabitur ligula sapien euismod vitae.</div>
												<div class="text-muted small mt-1">2h ago</div>
											</div>
										</div>
									</a>
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="${path}/adminkit-3.1.0/static/img/avatars/avatar-4.jpg" class="avatar img-fluid rounded-circle" alt="Christina Mason">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Christina Mason</div>
												<div class="text-muted small mt-1">Pellentesque auctor neque nec urna.</div>
												<div class="text-muted small mt-1">4h ago</div>
											</div>
										</div>
									</a>
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="${path}/adminkit-3.1.0/static/img/avatars/avatar-3.jpg" class="avatar img-fluid rounded-circle" alt="Sharon Lessman">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Sharon Lessman</div>
												<div class="text-muted small mt-1">Aenean tellus metus, bibendum sed, posuere ac, mattis non.</div>
												<div class="text-muted small mt-1">5h ago</div>
											</div>
										</div>
									</a>
								</div>
								<div class="dropdown-menu-footer">
									<a href="#" class="text-muted">Show all messages</a>
								</div>
							</div>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                <i class="align-middle" data-feather="settings"></i>
              </a>

							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                <img src="${path}/adminkit-3.1.0/static/img/avatars/avatar.jpg" class="avatar img-fluid rounded me-1" alt="Charles Hall" /> <span class="text-dark">Charles Hall</span>
              </a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="pages-profile.html"><i class="align-middle me-1" data-feather="user"></i> Profile</a>
								<a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="pie-chart"></i> Analytics</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="index.html"><i class="align-middle me-1" data-feather="settings"></i> Settings & Privacy</a>
								<a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="help-circle"></i> Help Center</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Log out</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>
			
			<!-- gantt -->
	<div class="gantt_control">
	<input type='button' id='default' onclick="showGroups()" value="Tree">
	<input type='button' id='priority' onclick="showGroups('priority')" value="Group by priority">
	<input type='button' id='user' onclick="showGroups('user')" value="Group by owner">
	<input type='button' id='stage' onclick="showGroups('stage')" value="Group by stage">
	</div>
	<div id="gantt_here" style='width:100%; height:calc(100vh - 90px);'></div>
	</div>
	</div>
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		gantt.plugins({
			grouping: true
		});
		
		// 간트 차트 데이터 보기
		$.ajax({
			type: "post",
		    url: "ganttList",
		    data: { project_id: 'PRO_0001' },
		    async: true,
		    dataType: "json",
		    success: function(data) { // data는 이미 배열형태
		        console.log("간트 데이터 출력");
		        console.log(data);        
		 	  			 	  	
		 	  	var tasks={
	 	  			data: data.map(function(task) {
	 	                return {
	 	                    id: task.id,
	 	                    text: task.text,
	 	                    start_date: formatDate(task.start_date), // 날짜 형식 변환
	 	                    duration: task.duration || 1, // duration 기본값 설정
	 	                    priority: task.priority,
	 	                    user: task.user,
	 	                    open: task.open,
	 	                    parent: task.parent
	 	                };
	 	            }),
					links:[]
		 	  	}		 	  	
			 	// 간트에 데이터 적용
		 	  	gantt.parse(tasks);
			},
			error:function(err){
				console.log(err)
			}
			
		})	
		
		// 날짜 포맷 변환 함수
		function formatDate(dateStr) {
		    var date = new Date(dateStr);
		    return gantt.date.date_to_str(gantt.config.date_format)(date);
		}
		
		/*
		// 일정 추가	
		gantt.addTask({
		    id:10,
		    text:"Project #1",
		    start_date:"02-09-2013",
		    duration:28
		});
		
		var taskId = gantt.addTask({
		    id:10,
		    text:"Task #5",
		    start_date:"02-09-2013",
		    duration:28
		}, "project_2", 1);
		 
		
		// 일정 수정
		gantt.changeTaskId(10, 15); //changes the task's id '10 -> 15'
		
		// 일정 삭제
		gantt.deleteTask(10); 
		
		// 컨펌 창
		var box = gantt.confirm({
	    	text: "Continue?",
		    ok:"Yes", 
		    cancel:"No",
		    callback: function(result){
		        if(result){
		            gantt.message("Yes!");
		        }else{
		            gantt.message("No...");
		        }
		    }
		});
		// or
		var box = gantt.confirm("Do you want to continue?");
		
		// 화면열기
		gantt.open("p_1");
		// 화면닫기
		gantt.close("p_1");
		
		
		// 라이트 박스에
		gantt.attachEvent("onLightbox", function (task_id){
		    //any custom logic here
		});
		
		// 
		var taskId = gantt.createTask({
		    id:10,
		    text:"Task #5",
		    start_date:"02-09-2013",
		    duration:28
		}, "project_2", 2);
		*/
		
		// 구분 단계
		gantt.serverList("stage", [
			{key: 1, label: "계획"},
			{key: 2, label: "개발"},
			{key: 3, label: "테스트"}
		]);
		// 역할자 리스트
		$.ajax({
			type: "post",
		    url: "userList",
		    data: { project_id: 'PRO_0001' },
		    async: true,
		    dataType: "json",
		    success: function(data) { // data는 이미 배열형태
		        console.log("users 데이터 출력");
		        console.log(data);        
		 	  			 	  	
		 	  	var users={
	 	  			data: data.map(function(user) {
	 	                return {
	 	                    key: user.id,
	 	                    label: user.name
	 	                };
	 	            })
		 	  	}		 	  				 	
		 	  	gantt.serverList("user",users) // 간트에 데이터 적용
			},
			error:function(err){
				console.log(err)
			}
		})
		/*
		gantt.serverList("user", [
			{key: 0, label: "N/A"},
			{key: 1, label: "박민경"},
			{key: 2, label: "김은수"},
			{key: 3, label: "파힘"}
		]);
		*/
		// 우선순위 리스트
		gantt.serverList("priority", [
			{key: 1, label: "상"},
			{key: 2, label: "중"},
			{key: 3, label: "하"}
		]);
	
		// end text data	
		gantt.config.order_branch = true;
		gantt.config.grid_width = 420;
		gantt.config.row_height = 24;
		gantt.config.grid_resize = true;
		
		// 레이블 변경
		gantt.i18n.setLocale({
			labels:{
				column_priority: 'Priority',
				section_priority: 'Priority',
				column_owner: 'Owner',
				section_owner: 'Owner',
				column_stage: 'Stage',
				section_stage: 'Stage',
				section_resources: 'Resources',
			}
		});
	
		function byId(list, id) {
			for (var i = 0; i < list.length; i++) {
				if (list[i].key == id)
					return list[i].label || "";
			}
			return "";
		}
		// 간트 일정 컬럼
		gantt.config.columns = [
			{ name: "text", label: "Task name", tree: true, width: '*' },
			{ name: "priority", width: 80, align: "center", template: function (item) {
				return byId(gantt.serverList('priority'), item.priority)
			}},
			{ name: "owner", width: 80, align: "center", template: function (item) {
				return byId(gantt.serverList('user'), item.user)
			}},
			{ name: "stage", width: 80, align: "center", template: function (item) {
				return byId(gantt.serverList('stage'), item.stage)
			}},
			{ name: "add", width: 40}
		];
		// 일정상세 화면
		gantt.config.lightbox.sections = [
			{name: "description", height: 38, map_to: "text", type: "textarea", focus: true},
			{name: "priority", height: 22, map_to: "priority", type: "select", options: gantt.serverList("priority")},
			{name: "owner", height: 22, map_to: "user", type: "select", options: gantt.serverList("user")},
			{name: "stage", height: 22, map_to: "stage", type: "select", options: gantt.serverList("stage")},
			{name: "time", type: "duration", map_to: "auto"}
		];		
		
		gantt.templates.grid_row_class =
			gantt.templates.task_row_class = function (start, end, task) {
				if (task.$virtual)
					return "summary-row"
			};
			
			
		gantt.templates.task_class = function (start, end, task) {
			if (task.$virtual)
				return "summary-bar";
		};
	
		gantt.init("gantt_here");
		gantt.sort("start_date");
		gantt.parse(tasks);
	
		function showGroups(listname) {
			if (listname) {
				gantt.groupBy({
					groups: gantt.serverList(listname),
					relation_property: listname,
					group_id: "key",
					group_text: "label"
				});
				gantt.sort("start_date");
			} else {
				gantt.groupBy(false);
	
			}
		}
	});
	
	
	</script>
	


	<script src="${path}/adminkit-3.1.0/static/js/app.js"></script>

</body>

</html>