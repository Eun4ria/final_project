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
	<link rel="stylesheet" href="${path}/gantt_trial/samples/common/controls_styles.css?v=8.0.9">
	
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
	
<body>
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
							<li class="nav-item ">
							<span class="nav-icon dropdown-toggle" onclick="goChat('${sessionScope.user_id}')" id="messagesDropdown">
									<i class="align-middle" data-feather="message-square"></i>
							</span>
							
						</li>

							<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                 <img src="${image}" class="avatar img-fluid rounded me-1" alt="Profile Picture" /> <span class="text-dark">Welcome, PM_${user_name}</span>
                  </a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="pages-profile.html"><i class="align-middle me-1" data-feather="user"></i> Profile</a>
								<a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="pie-chart"></i> Analytics</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="index.html"><i class="align-middle me-1" data-feather="settings"></i> Settings & Privacy</a>
								<a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="help-circle"></i> Help Center</a>
								<div class="dropdown-divider"></div>
								<form method="post" action="/logout">
								<input type="submit" class="dropdown-item" value="Log out" >
								</form>
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
	
<script>

function goChat(user_id){
location.href="chatmemListstart?user_id="+user_id
}
</script>
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		gantt.plugins({
			grouping: true
		});

        var resourcesStore = gantt
        .createDatastore({
           name : gantt.config.resource_store,
           type : "treeDatastore",
           initItem : function(item) {
              item.parent = item.parent
                    || gantt.config.root_id;
              item[gantt.config.resource_property] = item.parent;
              item.open = true;
              return item;
           }
        });
        //gantt.init()
		gantt.init("gantt_here");
		// 페이지 로딩될 때 간트 조회
		ajaxFun("ganttList")
		//listFun()
		
		/* console.log("데이터 출력");
        console.log(data.ganttList)
        console.log("자원 출력");
        console.log(data.resource)
        gantttasks = data.ganttList;
        resourcesStore.parse(data.resource);
        gantt.parse(data.ganttList); */
        
		// ajax함수
		function ajaxFun(url){
			$.ajax({
				type:"post",
				url:url,
				data:$("form").serialize(),
				dataType:"json",
				success: function(data) { // data는 이미 배열형태
                    var rs = [{"id":1,"text":"QA","parent":0},{"id":2,"text":"Development","parent":0},
                    	{"id":3,"text":"Sales","parent":0},
                    	{"id":4,"text":"Other","parent":0},{"id":5,"text":"Unassigned","parent":4},
                    	{"id":6,"text":"John","parent":1},{"id":7,"text":"Mike","parent":2},
                    	{"id":8,"text":"Anna","parent":2},{"id":9,"text":"Bill","parent":3},
                    	{"id":10,"text":"홍길동","parent":3},{"id":11,"text":"Floe","parent":3}];
                    console.log("# 자원 출력 #")
                    console.log(rs)
                    resourcesStore.parse(rs);
                    
                    console.log("데이터  출력(gantt)");    
                    data.ganttList[0].owner_id=[7]
                    console.log(data.ganttList[0]);      
                    //owner_id=[7]
                    var gdata = {data:data.ganttList}
                    console.log(gdata)
                    gantt.parse(gdata); 
                    console.log("### 자원 출력 ###");
                    //console.log(data.resource)
                    
                    //console.log("데이터 출력");
			        //console.log(data.ganttList)
                    //console.log("자원 출력");
                    //console.log(data.resource)
                    
                    //resourcesStore.parse(data.resource);
                    var rsc = {"user": [
            			{key:  "M_0003", label: "파힘"},
            			{key:  "P_0012", label: "김은수"}
            		]}

                    
   
                    /*
                    var gresource ={
                    		resource:[{"id":1,"text":"QA","parent":0},
                    			{"id":2,"text":"Development","parent":0},
                    			{"id":3,"text":"Sales","parent":0},
                    			{"id":4,"text":"Other","parent":0},
                    			{"id":5,"text":"Unassigned","parent":4},
                    			{"id":6,"text":"John","parent":1},
                    			{"id":7,"text":"Mike","parent":2},
                    			{"id":8,"text":"Anna","parent":2},
                    			{"id":9,"text":"Bill","parent":3},
                    			{"id":10,"text":"홍길동","parent":3},
                    			{"id":11,"text":"Floe","parent":3}]

                    }
                    */
                    /*
                    var users ={
      	 	  			data.map(function(user) {
      	 	                return {
      	 	                    key: user.id,
      	 	                    label: user.name
      	 	                };
      	 	            })
      		 	  	}
                    console.log("사용자 리스트")
                    console.log(users);
                    */
                    /*
                    gantt.serverList("user", [
            		    {key: "P_0001", label: "파힘"},
            		    {key: "orange", label: "Orange"},
            		    {key: "yellow", label: "Yellow"},
            		    {key: "green", label: "Green"},
            		    {key: "blue", label: "Blue"},
            		    {key: "navy", label: "navy"},
            		    {key: "purple", label: "Purple"}
            		]);
                    gantt.serverList("user", [
        			{key:  "M_0003", label: "파힘"},
        			{key:  "P_0012", label: "김은수"}
        			]);
                    */
                    
                    /* var resources = data.resource.map(function(item) {
                        return {
                            key: item.id,
                            label: item.text
                        };
                    });
                    console.log("사용자 리스트")
                    console.log(resources) */
                    
                    
                  // gantt.serverList("user", resources);
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    /*
                    
                    var users ={
        	 	  			data.map(function(user) {
        	 	                return {
        	 	                    key: user.id,
        	 	                    label: user.name
        	 	                };
        	 	            })
        		 	  	}		
        		 	  	console.log("####사용자####")
        		 	  	console.log(users)
        		 	  	gantt.serverList(users);
                    */
                    
                    /* console.log("리소스 출력(gantt)");
                    console.log(gresource)
                    console.log("user리스트 출력(gantt)");
                    gantt.serverList("user", [
            			{id: 1, text: "김"},
            			{id: 2, text: "남"},
            			{id: 3, text: "수"}
            		]) */
                    
                    
			 	  	/*		 	  	
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
		 	                    parent: task.parent,
		 	                    progress: task.progress || 0,
		 	                    color:task.color,
		 	                    textColor:task.textcolor   	        
		 	                };
		 	            }),
						links:[]
			 	  	}	
			 	  	*/
				},
				error:function(err){
					console.log(err)
				}
			})
			
		}
       /*
       function listFun(){
        $.ajax({
			type:"post",
			url:"teamList",
			data:$("form").serialize(),
			dataType:"json",
			success: function(data) { // data는 이미 배열형태

                var resources = data.map(function(item) {
                    return {
                        key: item.id,
                        label: item.text
                    };
                });
                
                console.log("new resources")
                console.log(resources)
                gantt.serverList("user", resources);
                
                },
				error:function(err){
					console.log(err)
				}
			})
       }
       */
       /*
       gantt.serverList("user", [
			{key:  "M_0003", label: "파힘"},
			{key:  "P_0012", label: "김은수"}
			]);        
        */
		
		// 날짜 포맷 변환 함수
		function formatDate(dateStr) {
		    var date = new Date(dateStr);
		    return gantt.date.date_to_str(gantt.config.date_format)(date);
		}
		
		
		/*
		// 일정 추가	
		
		gantt.addTask(task, parentId, index)/////
		task는 작업 객체이며, parentId는 부모 작업의 ID, index는 추가할 위치입니다.
		
		
		var taskId = gantt.addTask({
		    id:10,
		    text:"Task #5",
		    start_date:"02-09-2013",
		    duration:28
		}, "project_2", 1);
		 
		
		// 일정 수정
		gantt.changeTaskId(이전아이디, 새로운 아이디); //changes the task's id '10 -> 15'
		gantt.updateTask(taskId)
		
		// 일정 삭제
		gantt.deleteTask(아이디); 
		
		// 라이트박스 닫기
		gantt.hideLightbox()
		
		// 특정 날짜로 스크롤
		gantt.scrollTo(date)
		gantt.scrollTo(new Date());
		
		// 지정 작업의 id를 열어 하위작업 표시
		gantt.open(taskId)
		
		gantt.close(taskId)
		
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
			{key: "계획", label: "계획"},
			{key: "개발", label: "개발"},
			{key: "테스트", label: "테스트"}
		]);
		gantt.init("gantt_here");
		/*
		// 역할자 리스트		
		$.ajax({
			type: "post",
		    url: "teamList",
		    data: { project_id: 'PRO_0001' },
		    async: true,
		    dataType: "json",
		    success: function(data) { // data는 이미 배열형태
		        console.log("users 데이터 출력");
		        console.log(data);      
		 	  			 	  	
		 	  	var users ={
	 	  			data: data.map(function(user) {
	 	                return {
	 	                    key: user.id,
	 	                    label: user.name
	 	                };
	 	            })
		 	  	}		
		 	  	console.log("####사용자 ###")
		 	  	console.log(users)
		 	  	gantt.serverList(users); // 간트에 데이터 적용
			},
			error:function(err){
				console.log(err)
			}
		})
		*/
	

		
		
	console.log("직접 하는거")
	console.log([
			{key:  "M_0003", label: "파힘"},
			{key:  "P_0012", label: "김은수"}
		]);
		// data에 쓰이는 key값을 지정
		// 우선순위 리스트
		gantt.serverList("priority", [
			{key: "상", label: "상"},
			{key: "중", label: "중"},
			{key: "하", label: "하"}
		]);
		
		gantt.serverList("progress", [
			{key: 0, label: "진행전"},
			{key: 50, label: "진행중"},
			{key: 100, label: "진행완료"}
		]); 
		// 배경색 리스트
		gantt.serverList("background", [
		    {key: "red", label: "Red"},
		    {key: "orange", label: "Orange"},
		    {key: "yellow", label: "Yellow"},
		    {key: "green", label: "Green"},
		    {key: "blue", label: "Blue"},
		    {key: "navy", label: "navy"},
		    {key: "purple", label: "Purple"}
		]);
		gantt.serverList("textcolor", [
		    {key: "black", label: "Black"},
		    {key: "white", label: "White"}
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
				column_progress: 'Progress',
				section_progress: 'Progress',
				section_background: 'Background',
				section_textcolor: 'Text color',
				section_resources: 'Resources'
			}
		});
		
	
		function byId(list, id) {
			for (var i = 0; i < list.length; i++) {
				if (list[i].key == id)
					return list[i].label || "";
			}
			return "";
		}
		// 간트 메인 화면 상단 컬럼
		gantt.config.columns = [
			{ name: "text", label: "Task name", tree: true, width: '*' },
			{ name: "priority", width: 80, align: "center", template: function (item) {
				return byId(gantt.serverList('priority'), item.priority)
			}},
			{ name: "owner", width: 80, align: "center", template: function (item) {
				return byId(gantt.serverList('user'), item.user)
			}},
			{ name: "progress", width: 80, align: "center", label: "Progress", width: '*' },
			{ name: "add", width: 40}
		];		
		// 일정상세 화면에서의 label
		gantt.config.lightbox.sections = [
			{name: "description", height: 38, map_to: "text", type: "textarea", focus: true},
			{name: "priority", height: 22, map_to: "priority", type: "select", options: gantt.serverList("priority")},
			{name: "owner", height: 22, map_to: "user", type: "select", options: gantt.serverList("user")},
			{name: "progress", height: 22, map_to: "progress", type: "select", options: gantt.serverList("progress")},
			{name: "background", height: 22, map_to: "background", type: "select", options: gantt.serverList("background")},
			{name: "textcolor", height: 22, map_to: "textcolor", type: "select", options: gantt.serverList("textcolor")},
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
	

		gantt.sort("start_date");
		//gantt.parse(tasks);
		
		
		// 작업그룹화 함수
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