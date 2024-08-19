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
<!-- gantt -->
<script src="${path}/gantt_trial/codebase/dhtmlxgantt.js?v=8.0.9"></script>
<link rel="stylesheet" href="${path}/gantt_trial/codebase/dhtmlxgantt.css?v=8.0.9">
<link rel="stylesheet" href="${path}/gantt_trial/samples/common/controls_styles.css?v=8.0.9">

<style>
	html, body {
		padding: 0px;
		margin-bottom: 0px;
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
<script>
function goChat(user_id){
	location.href="message?user_id="+user_id
}
</script>
</head>

<body>

	<div class="wrapper">
<jsp:include page="a00_sideBar.jsp"/>	
	
		<div class="main">
         
        <jsp:include page="a00_top.jsp"/>
			
			<!-- gantt -->
	<div class="gantt_control">
	<input type='button' id='default' onclick="showGroups()" value="Tree">
	<input type='button' id='priority' onclick="showGroups('priority')" value="Group by priority">
	<input type='button' id='user' onclick="showGroups('user')" value="Group by owner">
	<input type='button' id='stage' onclick="showGroups('stage')" value="Group by stage">
	</div>
	 <div id="gantt_here" style="width: 100%; height: calc(100vh - 14vh);"></div>
	</div>
	</div>
	<script>
		var msg = "${msg}"
		
		if(msg!=""){
			alert(msg)
		}
		
	</script>
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		gantt.plugins({
			grouping: true
		});
		
		// 날짜 변환 함수
		function parseDate(dateString) {
			// 날짜 형식: dd-MM-yyyy
		    var parts = dateString.split("-");
		    return new Date(parts[2], parts[1] - 1, parseInt(parts[0]) + 1); // 연, 월, 일
		}
		// 정렬 함수
		function sortTasksByStartDate(tasks) {
		    return tasks.sort(function(a, b) {
		        return new Date(a.start_date) - new Date(b.start_date);
		    });
		}
		
		$.ajax({
			type:"post",
			url:"ganttList",
			data:{project_id:"${param.project_id}"},
			dataType:"json",
			success: function(data) { // data는 이미 배열형태    
				// 전체 data
				console.log("#로딩 시 전체 데이터 출력(gantt,resource)#")
				console.log(data)
              						
                var tasks = data.ganttList.map(function(task) {
		            return {
		                id: task.id,
		                text: task.text,
		                start_date: parseDate(task.start_date), // 날짜 변환
		                duration: task.duration || 1,
		                priority: task.priority,
		                user: task.user,
		                open: task.open,
		                parent: task.parent,
		                progress: task.progress || 0,
		                color: task.color,
		                textColor: task.textcolor
		            };
		        });
				var sortedTasks = sortTasksByStartDate(tasks);

		        var gdata = { data: sortedTasks };
		        
				console.log("#gantt 데이터 출력#");  
                console.log(gdata)
                // gantt적용
                gantt.parse(gdata); 
                
                
                // 해당 프로젝트 팀원 리스트
                var resources = data.resource.map(function(item) {
                    return {
                        key: item.id,
                        label: item.text
                    };
                });
                console.log("#팀원 데이터 출력#")
                console.log(resources)                 
				// lightbox팀원 리스트에 추가
                gantt.serverList("user", resources);
                // lightbox 적용               	
               	gantt.config.lightbox.sections = [
           			{name: "description", height: 38, map_to: "text", type: "textarea", focus: true},
           			{name: "priority", height: 22, map_to: "priority", type: "select", options: gantt.serverList("priority")},
           			{name: "owner", height: 22, map_to: "user", type: "select", options: gantt.serverList("user")},
           			{name: "progress", height: 22, map_to: "progress", type: "select", options: gantt.serverList("progress")},
           			{name: "background", height: 22, map_to: "background", type: "select", options: gantt.serverList("background")},
           			{name: "textcolor", height: 22, map_to: "textcolor", type: "select", options: gantt.serverList("textcolor")},
           			{name: "time", type: "duration", map_to: "auto"}
           		];
               	

               	// Gantt 차트 강제 업데이트
                gantt.render();
               	
            	// 모든 자식 작업 열기
                gantt.eachTask(function(task) {
                    if (task.parent) {
                        gantt.open(task.parent);
                    }
                });
                  
		 	  	/*		 	  	
		 	  	var tasks={
	 	  			data: data.map(function(task) {
	 	                return {
	 	                    id: task.id,
	 	                    text: task.text, // 작업명
	 	                    start_date: formatDate(task.start_date), // 날짜 형식 변환
	 	                    duration: task.duration || 1, // duration 기본값 설정
	 	                    priority: task.priority, // 중요도
	 	                    user: task.user, // 사용자 아이디
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
		});
		
		
		
		/* 
		// 라이트 박스 옵션
		gantt.attachEvent("onLightbox", function (task_id){
		    //any custom logic here
		});
		
		// 데이터 예시
		var taskId = gantt.createTask({
		    id:10,
		    text:"Task #5",
		    start_date:"02-09-2013",
		    duration:28
		}, "project_2", 2); 
		*/
		// 날짜를 +1일 하는 함수
		function subtractOneDay(date) {
		    var newDate = new Date(date);
		    newDate.setDate(newDate.getDate() + 1);
		    return newDate;
		}
		
		// 재사용 함수
		function ajaxFun(url,task){
        	$.ajax({
    			type:"post",
    			url:url,
    			data:{
					id:task.id,
    				start_date: subtractOneDay(task.start_date).toISOString(),
    		        text: task.text,
    		        duration: task.duration,
    		        parent:task.parent,
    		        priority: task.priority,
    		        progress: task.progress || 0,
    		        color: task.background,
    		        textcolor: task.textcolor,
    		        user: task.user,
    		        project_id: "${sessionScope.project_id}"
    		    },
    			dataType:"json",
    			success: function(result) {
    				var tasks = result.ganttList.map(function(task) {
    		            return {
    		                id: task.id,
    		                text: task.text,
    		                start_date: parseDate(task.start_date), // 날짜 변환
    		                duration: task.duration || 1,
    		                priority: task.priority,
    		                user: task.user,
    		                open: task.open,
    		                parent: task.parent,
    		                progress: task.progress || 0,
    		                color: task.color,
    		                textColor: task.textcolor
    		            };
    		        });
    				var sortedTasks = sortTasksByStartDate(tasks);

    		        var gdata = { data: sortedTasks };
    		        
    				console.log("#gantt 데이터 출력#");  
                    console.log(gdata)
                    
    				console.log(result.msg,("!!!!!")); // 결과 메시지
    				
    				gantt.clearAll();   // 기존 데이터 및 설정 지우기
    	            gantt.parse(gdata);  // 새로운 데이터를 파싱하여 로드
    	            gantt.render();     // 차트를 다시 렌더링
    	            
    	         	// 모든 자식 작업 열기
    	            gantt.eachTask(function(task) {
    	                if (task.parent) {
    	                    gantt.open(task.parent);
    	                }
    	            });
    	        },
    			error:function(err){
    				console.log(err)
    			}
    		});
        }
		
		
		var sessionRole="${sessionScope.role_code}"
		// 등록/수정/삭제는 PM권한
		if(sessionRole=="P"){
	        // 일정 등록
	        gantt.attachEvent("onAfterTaskAdd", function(id, task) {
	        	console.log("등록할 데이터(url 호출 전):", id, task);
	        	
	        	// 등록 컨펌창
	        	gantt.confirm({
	    	    	text: "Are you sure you want to save this?",
	    		    ok:"Yes", 
	    		    cancel:"No",
	    		    callback: function(result) { 
	    	            if (result) {  // 확인을 클릭할 경우
	    	                console.log("등록할 데이터(url 호출 전):", id, task);
	    	                ajaxFun("insertGantt", task);  // 등록함수 호출
	    	            } else {  // 취소할 경우
	    	            	 gantt.deleteTask(id, false);  // 작업을 삭제 (롤백)
	    	            }
	    	        }
	    		});
	        	
	        });
	        
	        // 일정 수정
	        gantt.attachEvent("onAfterTaskUpdate", function(id, task) {
			    console.log("수정할 데이터(url 호출 전):", id, task);
			    ajaxFun("updateGantt", task);
			});        
	        
	        // 일정 삭제
	        gantt.attachEvent("onAfterTaskDelete", function(id, task) {
			    console.log("삭제할 데이터(url 호출 전):", id, task);
			    ajaxFun("deleteGantt", task);
			});
	        
	        gantt.attachEvent("onTaskDrag", function(id, mode) {
	            console.log("드래그 시작:", id, mode);
	            // 추가적인 로직
	        });

	        gantt.attachEvent("onTaskDragEnd", function(id, task) {
	            console.log("드래그 종료:", id);
	            console.log("드래그")
	            console.log(task)
	            ajaxFun("updateGantt", task); // 드래그 후 서버에 데이터 전송
	        });
		}

		gantt.config.drag_move = true;  // 드래그 이동 활성화
		gantt.config.drag_resize = true; // 드래그 크기 조정 활성화

		/*
		// 일정 추가			
		gantt.attachEvent("onAfterTaskDelete", function(id, task) {

		});	 		
		// 일정 수정
		// 일정 수정
        gantt.attachEvent("onAfterTaskUpdate", function(id, task) {

		}); 
		// 일정 삭제
		gantt.attachEvent("onAfterTaskDelete", function(id, task) {

		});
		
		// 라이트박스 닫기
		gantt.hideLightbox()
		
		// 특정 날짜로 스크롤
		gantt.scrollTo(date)
		gantt.scrollTo(new Date());
		
		// 지정 작업의 id를 열고 닫기(하위작업 표시)
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
		// 또는
		var box = gantt.confirm("Do you want to continue?");
		
		// 라이트 박스에 뭐든!
		gantt.attachEvent("onLightbox", function (task_id){
		    //any custom logic here
		});		
		*/
		
		/*
		// stage리스트		
		gantt.serverList("stage", [
			{key: "계획", label: "계획"},
			{key: "개발", label: "개발"},
			{key: "테스트", label: "테스트"}
		]);
		*/
		
	
		
		// 우선순위 리스트
		gantt.serverList("priority", [
			{key: "상", label: "상"},
			{key: "중", label: "중"},
			{key: "하", label: "하"}
		]);
		
		gantt.serverList("progress", [
			{key: 0, label: 0},
			{key: 10, label: 10},
			{key: 20, label: 20},
			{key: 30, label: 30},
			{key: 40, label: 40},
			{key: 50, label: 50},
			{key: 60, label: 60},
			{key: 70, label: 70},
			{key: 80, label: 80},
			{key: 90, label: 90},
			{key: 100, label: 100}
		]); 	
		
		// 배경색 리스트
		gantt.serverList("background", [
		    {key: "#e6928e", label: "Red"},
		    {key: "#e4b590", label: "Orange"},
		    {key: "#f3edaf", label: "Yellow"},
		    {key: "#dff3af", label: "Green"},
		    {key: "#afe4f3", label: "Blue"},
		    {key: "#afc9f3", label: "navy"},
		    {key: "#c0aff3", label: "Purple"}
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
		
		// ui텍스트
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
		function byId(list, key) {
		    var item = list.find(x => x.key === key);
		    return item ? item.label : "";
		}
		
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
		/*
		//날짜 관련
		gantt.config.scale_height = 50; // 스케일의 높이 설정

		gantt.config.date_scale = "%Y"; // 연도 표시 형식 설정
		
		// 월과 날짜는 하위 스케일로 설정
		gantt.config.scale_unit = "month"; // 스케일 단위 설정
		gantt.config.step = 1; // 월 단위 설정
		
		gantt.config.subscales = [
		    {unit: "month", step: 1, date: "%F"},
		    {unit: "day", step: 1, date: "%d"}
		];	
		*/
		gantt.config.row_height = 30; // 높이를 40픽셀로 설정
	
		
		
		
		
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
		gantt.init("gantt_here");
		
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