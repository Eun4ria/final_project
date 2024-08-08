<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
	$(document).ready(function() {
		$("#showModel").hide()
		


	});


	document.addEventListener('DOMContentLoaded', function() {
		
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			initialDate : '2024-07-05', /*초기 로딩되는 날짜.*/
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) { // 기본 일정 등록시, 처리되는 이벤트..
				$("#showModel").click() //강제이벤트 처리.
				console.log("# 캘린터 기본 속성 확인 #")
				console.log(arg)
				console.log(arg.startStr)
				console.log(arg.endStr)
				console.log(arg.allDay)
				$("#modalTitle").text("일정 등록") 
				$("#regBtn").show()
				$("#uptBtn").hide()
				$("#delBtn").hide()				
				addForm(arg,"I")
				/*
				// 같은 모달창에서 상세와 등록 같이 처리하기에
				$("form")[0].reset()
				// 입력form의 내용을 초기화:이전 입력데이터/상세데이터 삭제 처리

				// 같은 모달창(등록/상세)에서 등록버튼만 화성화 처리..
				$("#start").val(arg.start.toLocaleString())
				// 보이는 날짜 처리 형식
				$("[name=start]").val(arg.startStr)
				// 실제 저장할 날짜 처리 형식..
				$("#end").val(arg.end.toLocaleString())
				$("[name=end]").val(arg.endStr)
				
				$("#allDay").val(""+arg.allDay) // 문자열로 형변환설정.
				$("[name=allDay]").val(arg.allDay?1:0) // 문자열을 vo boolean형식으로 전달하기 위해설정.
				*/
				
				/*
				var title = prompt('Event Title:');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
				}
				*/
				//calendar.unselect()
			},
			eventClick : function(arg) {
				console.log("# 상세 일정 #")
				console.log(arg.event)
				$("#modalTitle").text("일정상세")
				$("#regBtn").hide()
				$("#uptBtn").show()
				$("#delBtn").show()
				
				addForm(arg.event)
				$("#showModel").click() 
				// 상세화면 - 수정/삭제
				/*
				if (confirm('Are you sure you want to delete this event?')) {
					arg.event.remove()
				}
				*/
			},
			eventDrop:function(arg){
				addForm(arg.event)
				ajaxFun("updateCalendar.do")
			},
			eventResize:function(arg){
				addForm(arg.event)
				ajaxFun("updateCalendar.do")				
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events : function(info, successCallback, failureCallback){
				// callList.do
				$.ajax({
					url:"callList.do",
					dataType:"json",
					success:function(data){
						console.log(data) // 서버에서 받은 데이터(controller)
						calendar.removeAllEvents() // 현재 기본 일정 데이터 초기화(삭제처리)
						successCallback(data.calList) // data.모델명(json형식데이터)
						// d.addAttribute("calList", service.getFullCalendarList());
						
					}
					
				})	
			},
			error:function(err){
				console.log(err)
				failureCallback(err)
			}
		});
		
		function addForm(event, proc){
			
			$("form")[0].reset()
			if(proc != "I"){
				$("[name=id]").val(event.id)
				$("[name=writer]").val(event.extendedProps.writer)
				$("[name=content]").val(event.extendedProps.content)
				$("[name=urlLink]").val(event.extendedProps.urlLink)
				$("[name=backgroundColor]").val(event.backgroundColor)
				$("[name=textColor]").val(event.textColor)
				
			}
			$("[name=title]").val(event.title)
			$("[name=start]").val(event.startStr)
			$("#start").val(event.start.toLocaleString())
			if(event.end==null){
				$("[name=end]").val(event.startStr)
				$("#end").val(event.start.toLocaleString())			
			}else{
				$("[name=end]").val(event.endStr)
				$("#end").val(event.end.toLocaleString())				
			}
			$("[name=allDay]").val(event.allDay?1:0)
		}
		calendar.render();
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				ajaxFun("insertCalendar.do")
			}
		})	
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				ajaxFun("updateCalendar.do")
			}
		})	
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				ajaxFun("deleteCalendar.do")
			}
		})	
		function ajaxFun(url){
			$.ajax({
				type:"post",
				url:url,
				data:$("form").serialize(),// form안에 있는 name/value 속성값을 key=val변환 처리.
				dataType:"json",
				success:function(data){
					// 등록이 완료된 후,  등록성공/실패 메시지와 다시 등록이 된 내용을 적용한
					// 화면을 로딩하기 위한 처리..
					alert(data.msg)
					calendar.removeAllEvents()
					calendar.addEventSource(data.calList)
					// 등록 완료된 후에는 등록 모달창 닫기 처리.
					console.log(data.msg.indexOf('수정'))
					// 메시지가 '수정'포함인 경우만 창닫는 처리 방지
					if(data.msg.indexOf('수정')==-1){
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
        <div class="sidebar">
            <jsp:include page="a00_sideBar.jsp"/>
        </div>
        <div class="content">
            <div class="container">
                <div id='calendar'></div>
            </div>
            <div id="showModel" data-toggle="modal" data-target="#calModal"></div>
            <div class="modal fade" id="calModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTitle">타이틀</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="frm02" class="form" method="post">
                                <input type="hidden" name="id" value="0"/>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">일정명</span>
                                    </div>
                                    <input name="title" placeholder="입정 입력" class="form-control" />
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">작성자</span>
                                    </div>
                                    <input name="writer" placeholder="작성자 입력" class="form-control" />
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">시 작(일/시)</span>
                                    </div>
                                    <input id="start" class="form-control" />
                                    <input name="start" type="hidden" />
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">종 료(일/시)</span>
                                    </div>
                                    <input id="end" class="form-control" />
                                    <input name="end" type="hidden" />
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">내용</span>
                                    </div>
                                    <textarea name="content" rows="5" cols="10" class="form-control"></textarea>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">배경색상</span>
                                    </div>
                                    <input name="backgroundColor" value="#0099cc" type="color" placeholder="색상선택" class="form-control" />
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">글자색상</span>
                                    </div>
                                    <input name="textColor" value="#ccffff" type="color" placeholder="글자선택" class="form-control" />
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">종일여부</span>
                                    </div>
                                    <select name="allDay" class="form-control">
                                        <option value="1">종일</option>
                                        <option value="0">시간</option>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">연관페이지</span>
                                    </div>
                                    <input name="urlLink" placeholder="연관 url링크 주소 입력" class="form-control" />
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button id="regBtn" type="button" class="btn btn-primary">등록</button>
                            <button id="uptBtn" type="button" class="btn btn-info">수정</button>
                            <button id="delBtn" type="button" class="btn btn-warning">삭제</button>
                            <button id="clsBtn" type="button" class="btn btn-secondary" data-dismiss="modal">창닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>