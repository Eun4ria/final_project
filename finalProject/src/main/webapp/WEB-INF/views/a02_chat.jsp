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
	
	</style>
	<script type="text/javascript">
	var wsocket=null;
	
	$(document).ready(function(){
		$('#action_menu_btn').click(function(){
			$('.action_menu').toggle();
		});
		
	});
	
</script>
	<script type="text/javascript">
var wsocket=null;
$(document).ready(function(){
	$("#id").keyup(function(){
		if(event.keyCode == 13){
			ws_conn()
		}
	})
	
	function ws_conn(){
		var socketServer = '${socketServer}'.replace(/^"|"$/g,'')
		//alert(socketServer)
		//var socketServer = 'ws:localhost:3030/chat'
		wsocket = new WebSocket(socketServer)
		//console.log(wsocket)
		wsocket.onopen=function(evt){
			//console.log(evt)
			wsocket.send($("${user_name}").val()+":접속하셨습니다!")
		}
		// 전송한 메시지를 받는 메서드 선언. 서버단에서 ws.sendMessage(message)로 보냈을 때
		// 받는 처리하는 메서드..
		wsocket.onmessage = function(evt){
			revMsg(evt.data)
		}
		wsocket.onclose =function(){
			wsocket.close()
		}			
	}
	
	// sndBtn msg
	$("#sndBtn").click(function(){
		sendMsg()
	})
	$("#msg").keyup(function(){
		if(event.keyCode==13){
			sendMsg()
		}
	})
});
function sendMsg(){
	wsocket.send($("#id").val()+":"+$("#msg").val())
	$("#msg").val("")		
}
// 최대 크기 함수 위에 전역변수로 선언..
var mx = 0
function revMsg(msg){
	// 1. 보내는 메시지 오른쪽, 받는 메시지 왼쪽 정렬 처리..
	var alignOpt = "left"
	var msgArr = msg.split(":") // 사용자명:메시지  구분하여 처리
	var sndId = msgArr[0]// 보내는 사람 메시지 id
	if($("#id").val() == sndId){
		// 보내는 사람과 받는 사람의 아이디가 동일 하면 현재 접속한 사람이 보낸 메시지. ==> 정렬 오른쪽
		alignOpt = "right"
		msg = msgArr[1]  // 내가 보낸 메시지이기에 id삭제..
	}
	// 정렬 처리된 메시지 
	var msgObj = $("<div></div>").text(msg).attr("align", alignOpt).css("width",$("#chatArea").width()-20)
	$("#chatMessageArea").append(msgObj)
	//$("#chatMessageArea").append(msg+"<br>")
	// 2. 메시지 스크롤 처리..(최하단에 있는 메시지 내용 확인할 수 있게 자동 스크롤 처리..)
	//   1) 전체 해당 데이터의 높이를 구하기
	// 	 2) 포함하고 있는 부모 객체(#chatArea)에서 스크롤 기능 메서드로 스크롤되게 처리 scrollTop()
	var height = parseInt($("#chatMessageArea").height())
	mx += height + 20
	$("#chatArea").scrollTop(mx)
	
</script>
	</head>
	<!--Coded With Love By Mutiullah Samim-->
	<body>
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100">
				<div class="col-md-4 col-xl-3 chat"><div class="card mb-sm-3 mb-md-0 contacts_card">
					<div class="card-header">
						<div class="input-group">
							<input type="text" placeholder="Search..." name="" class="form-control search">
							<div class="input-group-prepend">
								<span class="input-group-text search_btn"><i class="fas fa-search"></i></span>
							</div>
						</div>
					</div>
<!-- 채팅 왼쪽 리스트 -->
					<div class="card-body contacts_body">
				<%--		<div class="d-flex bd-highlight">
								<div class="img_cont">
									<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img">
									<span class="online_icon"></span>
								</div>
								<div class="user_info">
									<span><c:out value="${sessionScope.user_name}" /></span>
								</div>
								
							</div>
						 --%>
						 	
							
					</div>
					<div class="card-footer"></div>
				</div></div>
				<div class="col-md-8 col-xl-6 chat">
					<div class="card">
						<div class="card-header msg_head">
							<div class="d-flex bd-highlight">
								<div class="img_cont">
									<img src="https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg" class="rounded-circle user_img">
									<span class="online_icon"></span>
								</div>
								<div class="user_info">
									<span><c:out value="${sessionScope.user_name}" /></span>
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
								<form method="post" action="mainpmFrm">
									<input type="submit" id="exitBtn" hidden >
									<i class="fas fa-sign-out-alt">&nbsp;&nbsp;Exit</i>
								</form>
								</div>	
								
								
							</div>
						</div>
						<div class="card-body msg_card_body">
							
					
						</div>
						<div class="card-footer">
							<div class="input-group">
								
								<div class="input-group mb-3">	
		
	
	
	
								<input id="msg" name="" class="form-control type_msg" placeholder="Type your message..."/>
								<div class="input-group-text send_btn"  >
									<i class="fas fa-location-arrow"></i>
									<input type="button" id="sndBtn" hidden>
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