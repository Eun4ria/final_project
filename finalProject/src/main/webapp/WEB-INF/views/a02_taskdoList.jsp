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
 if(msg != "") {
     alert(msg); // 알림 메시지 표시

     if (msg=="생성 완료") {
        $(".close").click();
        window.location.href = 'main';
     }
 }
 
function goChat(project_id){
	location.href="chatmemListstart?project_id="+project_id
}

<%--토글 관련 --%>
function sendResetMessage() {
    var iframe = document.querySelector('iframe');
    if (iframe) {
        iframe.contentWindow.postMessage({ type: 'reset' }, '*');
    }
}

function handleDblClick(event) {
    // 이벤트 발생 시 iframe 리셋 메시지 전송
    sendResetMessage();
}

function handleResizeMessage(event) {
    if (event.data.type === 'resize') {
        var toggleDiv = document.getElementById('toggleDiv');
        if (toggleDiv) {
            toggleDiv.style.width = event.data.width;
        }
    }
}

window.addEventListener('message', handleResizeMessage);

document.addEventListener('DOMContentLoaded', function() {
    var taskRows = document.querySelectorAll('tr[ondblclick]');
    taskRows.forEach(function(row) {
        row.addEventListener('dblclick', handleDblClick);
    });
    
    
    
    $("[name=priority]").change(function(){
    	//var st = $("[name=tstatus]").value()
    	 var selectElement = event.target;
        var row = selectElement.closest('tr'); // Find the closest row
     var task_id = row.getAttribute('data-task-id'); // Get the task_id from the row
     alert("task_id 확인:"+task_id);
     // Update the hidden input field with the correct task_id
     document.getElementById('task_id').value = task_id;
    	$.ajax({
            type: "POST",
            url: "uptSP",
            data: $("#replaceFrm").serialize(),
            success: function(data) {
               // alert(data)
            },
            error: function(err) {
            }
        });

    });
    $("[name=tstatus]").change(function(){
    	//var st = $("[name=tstatus]").value()
    	$.ajax({
            type: "POST",
            url: "uptSP",
            data: $("#replaceFrm").serialize(),
            success: function(data) {
                //alert(data)
            },
            error: function(err) {
            }
        });

    });

});
  
  
function updateTask(task_id, field, value) {

    $.ajax({
        type: "POST",
        url: "uptSP",
        data: {
            task_id: task_id,
            field: field,
            value: value
        },
        success: function(data) {
            console.log(task_id + "의 " + field + "가 변경되었습니다.");
            console.log(data);
        },
        error: function(err) {
            console.log("변경 중 오류 발생:", err);
        }
    });
} 


</script>

  <style>
       /* #main {
            position: relative;
            width: 100%;
            height: 100%;
            background-color: lightblue;
            padding: 20px;
            box-sizing: border-box;
        } */

        /* Style for the toggled div */
        #toggleDiv {
            position: fixed;
            top: 4rem;
            right: -140%; /* Start off-screen to the right */
            width: 50%; /* Adjust width as needed */
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            text-align: center;
            transition: right 0.5s; /* Smooth transition */
            overflow-x: hidden; /* 가로 스크롤 숨기기 */
            
        }

        iframe {
            width: 100%;
            height: 100%;
            border: none;
            overflow-x: hidden; /* 가로 스크롤 숨기기 */
        }
    </style>
  
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

<%-- 본문내용 --%>
         <main class="content" id="mainDiv">
            <div class="container-fluid p-0">

               <h1 class="h3 mb-3"><strong>To Do</strong> List</h1>
     
            <div class="row mb-4">
        <div class="col-lg-12 col-md-6 mb-md-0 mb-4">
          <div class="card">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-lg-6 col-7">
                  <h6>Projects ${project_id}</h6>
                  
                </div>
                
       
    
              </div>
            </div>
  <%-- 토글 전 본문 --%>
           <div class="card-body px-0 pb-0" id="app">
            <div class="table-responsive">
            <table class="table align-items-center mb-0" id="taskTable">
                  <thead>
                    <tr>
                   
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">Task ID</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">parent ID</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ">Task Name</th>
                   
				    <c:if test="${sessionScope.role_code != null && sessionScope.role_code == 'P'}">
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 " >Responsibility</th>
                     </c:if>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 "> End Date</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Status</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Priority</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Completion</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="task" items="${tasklist}">
                    <tr ondblclick="taskPage('${task.task_id}')" >
               
                    <td>
	                    <div>
                            <input type="checkbox" id="task1" >
                            <c:forEach begin="1"
								end="${task.level}">  &nbsp;&nbsp;&nbsp;  
						 </c:forEach>${task.task_id}
                          </div>
                    </td>
                    <td>
                         <div class="align-middle text-center" style="border:none">
                         
                          <div class="align-middle text-center ">
                            <h6 class="mb-0 text-sm">${task.parent_id}</h6>
                          </div>
                        </div>
                      </td>
                      <td>
                         <div class="align-middle text-center" style="border:none">
                         
                          <div class="align-middle text-center ">
                            <h6 class="mb-0 text-sm">${task.task_name}</h6>
                          </div>
                        </div>
                      </td>
                       <c:if test="${sessionScope.role_code != null && sessionScope.role_code == 'P'}">
                       <td >
                         <div class="align-middle text-center" style="border:none">
                         
                          <div class="align-middle text-center ">
                            <h6 class="mb-0 text-sm">${task.user_id}</h6>
                          </div>
                        </div>
                      </td>
                      </c:if>
                      <td >
                      <div class="align-middle text-center" style="border:none">
                         
                          <div class="align-middle text-center ">
                            <h6 class="mb-0 text-center">${task.endDateFormatted }</h6>
                          </div>
                        </div>
                        
                      </td>
            <%--	 <form id="replaceFrm"> --%>
                      <td class="align-middle text-center" >
                  <%--  <input type="text" id="task_id" name="task_id" value="${task.task_id}"/>  --%> 
                      <h6 class="mb-0 text-center">${task.tstatus }</h6>
                     </td>
                      <td class="align-middle text-center" >
                      <h6 class="mb-0 text-center">${task.priority }</h6>
                     </td>
                     
                       
                 </form>
         

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
                <div id="toggleDiv" >
            <iframe id="taskFrame" src="">
               
            </iframe>
        </div>

    </div>
</div>
</div>
</div>
</div>

 <script>

 function taskPage(task_id) {
	  //var sessionTaskId = '${sessionScope.task_id}'; // 로그인한 사용자 데이터
     // var sessionProId = '${sessionScope.project_id}'; // 로그인한 사용자 데이터
     $.ajax({
         url: '/setTaskId',
         type: 'POST',
         data: { 
				task_id: task_id
               // project_id: sessionProId // 서버로 전송할 데이터
                },
         success: function(response) {
             console.log("Task ID set in session");
             var iframe = document.getElementById('taskFrame');
             iframe.src = `taskdo?task_id=${task_id}`; // URL 연결로 수정
             toggleDiv();
         },
         error: function(error) {
             console.error("Error setting Task ID", error);
         }
     });
 }
 


 async function toggleDiv() { //async => promise 반환 & 내부에거 await 사용가능 : 비동기 작업 수행 가능
	    var toggleDiv = document.getElementById('toggleDiv');
	    if (toggleDiv.style.right === '0px') {
	        await slideOutDiv(toggleDiv); // 비동기적으로 닫기 //promise(slideOutDiv())가 종료될 때까지 함수 실행 중지 
	        												//=> 작업이 완료된 후에 다음 코드 실행 되므로 비동기적 실행이 가능
	        document.removeEventListener('click', outsideClickListener);
	    } else {
	        toggleDiv.style.right = '0'; // Slide in
	        setTimeout(() => {
	            document.addEventListener('click', outsideClickListener);
	        }, 0); // Ensure the listener is added after the current event loop
	    }
	}

	// 비동기적으로 Div를 슬라이드 아웃시키는 함수
	function slideOutDiv(div) {
	    return new Promise((resolve) => { //await 이전 실행되는 promise 코드 부분으로 resolve가 호출되면 종료
	        // Slide out animation
	        div.style.transition = 'right 0.5s'; // 슬라이드 속도 조절
	        div.style.right = '-140%'; 
	        div.addEventListener('transitionend', resolve, { once: true }); // 애니메이션이 끝나면 resolve 호출
	    });
	}

	async function outsideClickListener(event) {
	    var toggleDiv = document.getElementById('toggleDiv');
	    if (!toggleDiv.contains(event.target)) {
	        await slideOutDiv(toggleDiv); // 비동기적으로 닫기
	        document.removeEventListener('click', outsideClickListener);
	       // window.location.reload();
	    }
	}

	window.addEventListener("message", async function(event) {
	    if (event.data === "closeAndReload") {
	        var toggleDiv = document.getElementById('toggleDiv');
	        await slideOutDiv(toggleDiv); // 비동기적으로 닫기
	        document.removeEventListener('click', outsideClickListener);
	        //window.location.reload();
	    }
	}, false);

	function setupOutsideClickListener() {
	    document.addEventListener('click', outsideClickListener);
	}

    </script>
           
           
           
    </main>
    </div>
    

    
    
   
  
  </div>

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