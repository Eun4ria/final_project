<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
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
			height: 100%;
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
<div class="gantt_control">
	<input type='button' id='default' onclick="showGroups()" value="Tree">
	<input type='button' id='priority' onclick="showGroups('priority')" value="Group by priority">
	<input type='button' id='user' onclick="showGroups('user')" value="Group by owner">
	<input type='button' id='stage' onclick="showGroups('stage')" value="Group by stage">
</div>
<div id="gantt_here" style='width:100%; height:calc(100vh - 52px);'></div>
<script type="text/javascript">
	gantt.plugins({
		grouping: true
	});
	// test data
	var tasks = {
		data: [
			// id='작업id' text='작업명' start_date : '시작날짜' dutation : 업무기간, 우선순위 : 3~1 (lo~high), stage: 단계, user : 작업자, 'open'
			{id: 1, text: "Task #1", start_date: "02-04-2023 00:00", duration: 3, priority: 3, stage: 1, user: 3, open: true, parent: 0},
			{id: 5, text: "Task #1.1", start_date: "05-04-2023 00:00", duration: 4, parent: 1, open: true, priority: 1, stage: 1, user: 1},
			{id: 6, text: "Task #1.2", start_date: "11-04-2023 00:00", duration: 6, parent: 1, open: true, priority: 2, stage: 2, user: 3},
			{id: 2, text: "Task #2", start_date: "11-04-2023 00:00", duration: 2, priority: 1, stage: 3, user: 0, open: true, parent: 0},
			{id: 7, text: "Task #2.1", start_date: "13-04-2023 00:00", duration: 2, parent: 2, open: true, priority: 3, stage: 2, user: 2},
			{id: 3, text: "Task #3", start_date: "11-04-2023 00:00", duration: 6, priority: 2, stage: 2, user: 1, open: true, parent: 0},
			{id: 8, text: "Task #3.1", start_date: "09-04-2023 00:00", duration: 3, parent: 3, open: true, priority: 1, stage: 1, user: 3},
			{id: 9, text: "Task #3.2", start_date: "12-04-2023 00:00", duration: 2, parent: 3, open: true, priority: 3, stage: 3, user: 1},
			{id: 10, text: "Task #3.3", start_date: "17-04-2023 00:00", duration: 4, parent: 3, open: true, priority: 2, stage: 2, user: 0}
		], links: [ // type:1~3
			{source: "1", target: "5", type: "0"},
			{source: "5", target: "8", type: "0"},
			{source: "3", target: "7", type: "0"},
			{source: "6", target: "7", type: "0"},
			{source: "2", target: "10", type: "0"}
		]
	};
	// 구분 단계
	gantt.serverList("stage", [
		{key: 1, label: "Planning"},
		{key: 2, label: "Dev"},
		{key: 3, label: "Testing"}
	]);
	// 역할자 리스트
	gantt.serverList("user", [
		{key: 0, label: "N/A"},
		{key: 1, label: "John"},
		{key: 2, label: "Mike"},
		{key: 3, label: "Anna"}
	]); 
	// 우선순위 리스트
	gantt.serverList("priority", [
		{key: 1, label: "High"},
		{key: 2, label: "Normal"},
		{key: 3, label: "Low"}
	]);

	// end text data

	gantt.config.order_branch = true;
	gantt.config.grid_width = 420;
	gantt.config.row_height = 24;
	gantt.config.grid_resize = true;

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
	// 상세 팝업 섹션
	gantt.config.lightbox.sections = [
		{name: "description", height: 38, map_to: "text", type: "textarea", focus: true},
		{name: "priority", height: 22, map_to: "priority", type: "select", options: gantt.serverList("priority")},
		{name: "owner", height: 22, map_to: "user", type: "select", options: gantt.serverList("user")},
		{name: "stage", height: 22, map_to: "stage", type: "select", options: gantt.sergrid_row_classverList("stage")},
		{name: "time", type: "duration", map_to: "auto"}
	];

	// gantt.templates.grid_row_class =
		
	// 간트 작업 행 변경
	gantt.templates.task_row_class = function (start, end, task) {
		if (task.$virtual)
			return "summary-row"
	};
	// 간트 작업 변경
	gantt.templates.task_class = function (start, end, task) {
		if (task.$virtual)
			return "summary-bar";
	};

	gantt.init("gantt_here");
	gantt.sort("start_date");
	gantt.parse(tasks);
	
	
	// 그룹 함수
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


</script>
</body>