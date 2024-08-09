<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
	<head>
		<title>HPM-Chatting</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>
	
	<%-- material link --%>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<link rel="apple-touch-icon" sizes="85x85" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">
  	<link rel="icon" sizes="85x85" type="image/png" href="${path}/material-dashboard-2/assets/img/HPM-icon.png">
	
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	
	
	<style>
	body,html{
			height: 100%;
			margin: 0;
			background: #7F7FD5;
	       background: -webkit-linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
	        background: linear-gradient(to right, #91EAE4, #86A8E7, #7F7FD5);
		}

		.chat{
			margin-top: auto;
			margin-bottom: auto;
		}
		.card{
			height: 700px;
			border-radius: 15px !important;
			background-color: rgba(0,0,0,0.4) !important;
		}
		.contacts_body{
			padding:  0.75rem 0 !important;
			overflow-y: auto;
			white-space: nowrap;
		}
		.msg_card_body{
			overflow-y: auto;
		}
		.card-header{
			border-radius: 15px 15px 0 0 !important;
			border-bottom: 0 !important;
		}
	 .card-footer{
		border-radius: 0 0 15px 15px !important;
			border-top: 0 !important;
	}
		.container{
			align-content: center;
		}
		.search{
			border-radius: 15px 0 0 15px !important;
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color:white !important;
		}
		.search:focus{
		     box-shadow:none !important;
           outline:0px !important;
		}
		.type_msg{
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color:white !important;
			height: 60px !important;
			overflow-y: auto;
		}
			.type_msg:focus{
		     box-shadow:none !important;
           outline:0px !important;
		}
		.attach_btn{
	border-radius: 15px 0 0 15px !important;
	background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.send_btn{
	border-radius: 0 15px 15px 0 !important;
	background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.search_btn{
			border-radius: 0 15px 15px 0 !important;
			background-color: rgba(0,0,0,0.3) !important;
			border:0 !important;
			color: white !important;
			cursor: pointer;
		}
		.contacts{
			list-style: none;
			padding: 0;
		}
		.contacts li{
			width: 100% !important;
			padding: 5px 10px;
			margin-bottom: 15px !important;
		}
	.active{
			background-color: rgba(0,0,0,0.3);
	}
		.user_img{
			height: 70px;
			width: 70px;
			border:1.5px solid #f5f6fa;
		
		}
		.user_img_msg{
			height: 40px;
			width: 40px;
			border:1.5px solid #f5f6fa;
		
		}
	.img_cont{
			position: relative;
			height: 70px;
			width: 70px;
	}
	.img_cont_msg{
			height: 40px;
			width: 40px;
	}
	.online_icon{
		position: absolute;
		height: 15px;
		width:15px;
		background-color: #4cd137;
		border-radius: 50%;
		bottom: 0.2em;
		right: 0.4em;
		border:1.5px solid white;
	}
	.offline{
		background-color: #c23616 !important;
	}
	.user_info{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 15px;
	}
	.user_info span{
		font-size: 20px;
		color: white;
	}
	.user_info p{
	font-size: 10px;
	color: rgba(255,255,255,0.6);
	}
	.video_cam{
		margin-left: 50px;
		margin-top: 5px;
	}
	.video_cam span{
		color: white;
		font-size: 20px;
		cursor: pointer;
		margin-right: 20px;
	}
	.msg_cotainer{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 10px;
		border-radius: 25px;
		background-color: #82ccdd;
		padding: 10px;
		position: relative;
	}
	.msg_cotainer_send{
		margin-top: auto;
		margin-bottom: auto;
		margin-right: 10px;
		border-radius: 25px;
		background-color: #78e08f;
		padding: 10px;
		position: relative;
	}
	.msg_time{
		position: absolute;
		left: 0;
		bottom: -15px;
		color: rgba(255,255,255,0.5);
		font-size: 10px;
	}
	.msg_time_send{
		position: absolute;
		right:0;
		bottom: -15px;
		color: rgba(255,255,255,0.5);
		font-size: 10px;
	}
	.msg_head{
		position: relative;
	}
	#action_menu_btn{
		position: absolute;
		right: 10px;
		top: 10px;
		color: white;
		cursor: pointer;
		font-size: 20px;
	}
	.action_menu{
		z-index: 1;
		position: absolute;
		padding: 15px 0;
		background-color: rgba(0,0,0,0.5);
		color: white;
		border-radius: 15px;
		top: 30px;
		right: 15px;
		display: none;
	}
	.action_menu ul{
		list-style: none;
		padding: 0;
	margin: 0;
	}
	.action_menu ul li{
		width: 100%;
		padding: 10px 15px;
		margin-bottom: 5px;
	}
	.action_menu ul li i{
		padding-right: 10px;
	
	}
	.action_menu ul li:hover{
		cursor: pointer;
		background-color: rgba(0,0,0,0.2);
	}
	@media(max-width: 576px){
	.contacts_card{
		margin-bottom: 15px !important;
	}
	}

/* 스크롤바 스타일링 */
/* 스크롤바 막대 */
.scrollbar { 
  height: 200px;
  overflow-y: auto; /*  */
  overflow-x: hidden;
  padding-right:0;
}

/* 스크롤바의 폭 너비 */
.scrollbar::-webkit-scrollbar {
    width: 10px;  
}

.scrollbar::-webkit-scrollbar-thumb {
    background: rgba(98, 106, 136); /* 스크롤바 색상 */
    border-radius: 10px; /* 스크롤바 둥근 테두리 */
}

.scrollbar::-webkit-scrollbar-track {
    background: transparent;  /*스크롤바 뒷 배경 색상*/
}
.even{
	background-color:hsla(240,15%,30%,0.3);
}
.odd{
	background-color:hsla(240,15%,30%,0.2);
}
	</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#action_menu_btn').click(function(){
		$('.action_menu').toggle();
	});

});
</script>
<script>
 var insertmsg="${insertmsg}"
 if(insertmsg != "") {
     alert(insertmsg); // 알림 메시지 표시

     if (insertmsg=="채팅방 생성완료") {
        $(".close").click();
        window.location.href = 'message';
     }
 }
 </script>
	</head>

	<!--Coded With Love By Mutiullah Samim
	
	<c:if test="${sessionScope.user_id == null || sessionScope.user_id == ''}">
    <script>
        alert("로그인이 필요한 서비스입니다");
        location.href = 'signinFrm';
    </script>
</c:if>

-->
<body> 

		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100">
				<div class="col-md-4 col-xl-3 chat"><div class="card mb-sm-3 mb-md-0 contacts_card">
					<div class="card-header">
						<form id="frm01" class="form" method="post">
						<div class="input-group">
							<input placeholder="Search..." name="user_name" value="${param.user_name}" class="form-control search">
							 <button id="schBtn" class="input-group-text search_btn" type="submit" ><i class="fas fa-search"></i></button>
						
						</div>
						</form>
					</div>
					<div class="d-flex bd-highlight">
							<div class="user_info" style="padding-right:7rem;">
								<span style="font-size:0.9rem;"><c:out value="${sessionScope.user_name}" /></span>
							</div>
				
							<div >
							  <button type="button" id="memList" class="active" onclick="showMem()">팀원</button>
                              <button type="button" id="chatList" onclick="showChatRoom()">채팅</button></div>
						</div>
<!-- 채팅 왼쪽 리스트 -->
<div class="card-body contacts_body scrollbar">
					    	<c:forEach var="mem" items="${memList}" varStatus="status">	
					    	
					    	
							<div  class="d-flex bd-highlight ${status.index % 2 == 0 ? 'even' : 'odd'}" ondblclick="goDetail('${mem.user_id}')" 
							style="padding-top:0.5rem;height:4rem" data-toggle="modal" data-target="#ModalCenter">
								<div class="img_cont" style="padding-left:1rem">
									<img src="${mem.image }" class="rounded-circle user_img" style="width:3rem; height:3rem; ">	
								</div>
								<div class="user_info">
									<span>${mem.user_name}</span>
									<p >${mem.user_id}</p>
								</div>
							</div>
						
						
					    	</c:forEach>
					    	
					    
					
						
	
						
	
	</div>	</div></div>
<!-- 오른쪽 채팅 창
				-->
			
				<div class="col-md-8 col-xl-6 chat">
					<div class="card">
						<div class="card-header msg_head">
							<div class="d-flex bd-highlight">
								<div class="img_cont">
									<img src="${image}" class="avatar img-fluid rounded me-1" alt="Profile Picture" />
									<%-- 
									<input id="curName" value="${user_id }"  disabled/>
									 --%>
								</div>
								<div class="user_info">
									<span><c:out value="${sessionScope.chatroom_name}" /></span>
								</div>
								
							</div>
							<span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
							<div class="action_menu" style="width:9rem;">
								<div style="padding-left:0.4rem;">
								<form method="post" action="mainpmFrm">
									<input type="submit" id="exitBtn" hidden >
									<i class="fas fa-user-circle"></i> main page
								</form>
								<form method="post" action="mainpmFrm">
									<input type="submit" id="exitBtn" hidden >
									<i class="fas fa-users"></i> Add to close friends
								</form>
								<form method="post" action="mainpmFrm">
									<input type="submit" id="exitBtn" hidden >
									<i class="fas fa-plus"></i> Add to group
								</form>
								<form method="post" action="mainpmFrm">
									<input type="submit" id="exitBtn" hidden >
									<i class="fas fa-ban"></i> Block
								</form>
								<form method="get" action="todomemFrm">
									
									<button type="submit" id="exitBtn" style="background-color:transparent; border:none; color:white">
									<i class="fas fa-sign-out-alt">
									</i> Exit</button>
									
								</form>
							
								</div>	
								
								
							</div>
						</div>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
  
  
<c:choose>	
<c:when test="${chatroomId == null || chatroomId == ''}">	
		<div class="card-body">

	<div class="input-group mb-3">	
 	현재사람:<input id="curName" value="${sessionScope.user_id}" />
	
 	받을사람:<input id="name" value="${user_id}" /> <!-- 팀원 더블클릭해서 들어올때 여기로 이름 받기 -->
 	</div>
 	<div  id="show"></div>
 <%-- 
 	<div class="card-footer">
 	보낼메시지:<input id="msg" />
 	<br>
 	<button type="button" onclick="sendName()">전송</button>
 	
 	</div>
 --%>	
 </div>	
 <%-- 
 	<div class="card-footer">
	<div class="input-group mb-3">	
		<input id="msg" class="form-control" placeholder="전송할 메시지 입력"/>	
		<input type="button" onclick="sendName()" class="btn btn-info" value="메시지전송" id="sndBtn"/>
	</div>		
	</div>
--%>
	<div class="card-footer">
			<div class="input-group">
				
				<div class="input-group mb-3">	
	
		<input id="msg" class="form-control type_msg" placeholder="Type your message..."/>
				<div class="input-group-text send_btn"  >
					<i class="fas fa-location-arrow" onclick="sendName()"></i>
					
				</div>
			</div>
		</div>
	</div>	

	</c:when>	
	<c:otherwise>
	<div class="card-body">

 	</div>	
 
	<div class="card-footer">
			
	</div>	
	
	
	</c:otherwise>
 </c:choose>	
</div>
</div>

 


</div>
</div>
<script type="text/javascript">
		function goDetail(user_id){
			var sessionUserId = '${sessionScope.user_id}'; // 로그인한 사용자 데이터
			var sessionProId = '${sessionScope.project_id}'; // 로그인한 사용자 데이터
			$.ajax({
		        url: 'checkChatRoom', 
		        method: 'POST', 
		        dataType:'json', // 전송할 데이터 형식
		        data: {
		            user_id: user_id, // 서버로 전송할 데이터
		            owner_id: sessionUserId, // 서버로 전송할 데이터
		            project_id: sessionProId // 서버로 전송할 데이터
		        },
		        success: function(data) {

		        	console.log(data.msg)
		            // 서버에서 응답을 성공적으로 받았을 때 처리
		            if (data.msg=="생성 완료") {
		               
		                location.href = 'message?chatroom_id=' + data.chatroomId +'&user_id='+user_id;
		            } else {
		                alert('채팅방 정보를 가져오는 데 실패했습니다.');
		            }
		        },
		        error: function(err) {
		            // 요청이 실패했을 때 처리
		            console.log('AJAX 요청 실패');
		            console.log(err);
		            alert('채팅방 정보를 가져오는 중 오류가 발생했습니다.');
		        }
		    });
		}
	</script>  

    <script type="text/javascript">
var socket = new SockJS('/ws');
var stompClient = Stomp.over(socket);

stompClient.connect({}, function(frame) {
    console.log('Connected: ' + frame);
    stompClient.subscribe('/topic/greetings', function(greeting){
        //console.log(greeting);
        console.log(greeting.body);
        console.log(JSON.parse(greeting.body).content);
        var obj = JSON.parse(greeting.body);
        var curName = document.getElementById('curName').value;
        console.log("## 받은 메시지 ##")
        console.log(obj.msg)
        console.log("## 받은 이름 ##")
        console.log(obj.name)
        
        
        if(curName!=obj.name)
        	document.querySelector("#show").innerHTML += obj.name+":"+obj.msg+"<br>"
        //document.querySelector("#show").innerHTML = JSON.parse(greeting.body).content+"<br>"

    });
});


function sendName() {
	
    var name = document.getElementById('curName').value;
    var msg = document.getElementById('msg').value;
    document.querySelector("#show").innerHTML += "나:"+msg+"<br>"
    stompClient.send("/app/hello", {}, JSON.stringify({'name': name, 'msg':msg}));
}
</script>   	
<%-- 
<script style="text/javascript">
document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('memList').classList.add('active');
    loadTeamList();
});

function showMem() {
    document.getElementById('memList').classList.add('active');
    document.getElementById('chatList').classList.remove('active');
    loadTeamList();
}

function showChatRoom() {
    document.getElementById('memList').classList.remove('active');
    document.getElementById('chatList').classList.add('active');
    loadChatList();
}

</script>--%>
	</body>
</html>