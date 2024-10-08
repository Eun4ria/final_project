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
 /* padding-right:0;*/
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

/* 부모 컨테이너의 스타일 */
#show {
    display: flex;
    flex-direction: column;
}
/* 왼쪽 정렬 스타일 */
.left {
  
    padding: 10px;
    background-color: skyblue;
    border-radius: 10px;
    display: inline-block;
    max-width: 80%;
    align-self: flex-start;
    word-wrap: break-word; /* 단어가 길 경우 줄바꿈 처리 */   
    margin-bottom:0.6rem;
}

/* 오른쪽 정렬 스타일 */
.right {
 
    padding: 10px;
    background-color: #dcf8c6;
    border-radius: 10px;
    display: inline-block;
    max-width: 80%;
    align-self: flex-end;
   /* word-wrap: break-word;  단어가 길 경우 줄바꿈 처리 */   
    margin-bottom:0.6rem;
}

   </style>
<script type="text/javascript">
$(document).ready(function(){
   $('#action_menu_btn').click(function(){
      $('.action_menu').toggle();
   });
   $("#msg").keyup(function(event){
      if(event.keyCode == 13){
         sendName()
      }
   })
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
 function goBack() {
    $.ajax({
        url: '/chatmemListstart',
        type: 'GET', // 또는 필요한 HTTP 메서드
        contentType: 'application/json',
        success: function() {
            window.location.href = '/chatmemListstart'; // 리다이렉션할 URL
        },
        error: function(xhr, status, error) {
            console.error('Error:', error); // 에러 처리
        }
    });
 }
 

 </script>
<c:if test="${not empty alertMessage}">
    <script>
        alert("${alertMessage}");
        location.href = '${path}/signinFrm';
    </script>
</c:if>
   </head>




<body> 
 <%--  --%>

<input type="hidden" name="project_id" value="${sessionScope.project_id }"/>
<input type="hidden" name="user_id" value="${sessionScope.user_id }"/>

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
   <div id="mem_list">
                      <c:forEach var="mem" items="${memList}" varStatus="status">   
                                            
                     <div  class="d-flex bd-highlight ${status.index % 2 == 0 ? 'even' : 'odd'}" ondblclick="goDetail('${mem.user_id}')" 
                     style="padding-top:0.5rem;height:4rem" >
                        <div class="img_cont" style="padding-left:1rem">
                           <img src="${mem.image }" class="rounded-circle user_img" style="width:3rem; height:3rem; ">   
                        </div>
                        <div class="user_info">
                           <span>${mem.user_name}</span>
                           <p > with: ${mem.user_id}</p>
                           
                        </div>
                     </div>
                  
                      </c:forEach>
         </div>
         <div id="chat_list">          
                      <c:forEach var="chat" items="${chatList}" varStatus="status">   
                      
                                            
                     <div  class="d-flex bd-highlight ${status.index % 2 == 0 ? 'even' : 'odd'}" ondblclick="goDetail('${chat.user_id}')" 
                     style="padding-top:0.5rem;height:4rem" >
                        <div class="img_cont" style="padding-left:1rem">
                        <img src="${path}/material-dashboard-2/assets/img/HPM-icon.png" class="avatar img-fluid rounded me-1" alt="Profile Picture" />
                           
                           <%-- <img src="${chat.image }" class="rounded-circle user_img" style="width:3rem; height:3rem; ">   --%>
                        </div>
                        <div class="user_info">
                           <span>${chat.chatroom_name}</span>
                                 <p>with: ${chat.user_id}</p>
                                 
                               
                        </div>
                     </div>
                        
                      </c:forEach>
            </div>   
            
   </div>   </div></div>
<!-- 오른쪽 채팅 창
            -->
         
            <div class="col-md-8 col-xl-6 chat">
               <div class="card">
                  <div class="card-header msg_head">
                     <div class="d-flex bd-highlight">
                        <div class="img_cont">
                           <%--<img src="${image}" class="avatar img-fluid rounded me-1" alt="Profile Picture" /> --%>
                           <img src="${path}/material-dashboard-2/assets/img/HPM-icon.png" class="avatar img-fluid rounded me-1" alt="Profile Picture"  style="width:4rem; height:4rem; "/>
                           <div style="font-size:0.6rem;padding-left:0.5rem;"> ${project_id } </div>
                        </div>
                        <c:choose>
                        <c:when test="${chatroom_id == null || chatroom_id == ''}">
                        <div class="user_info">
                        
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="user_info">
                           ${chatroom_name}  
                        </div>
                        </c:otherwise>
                        
                        </c:choose>
                        
                     </div>
                     <span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
                     <div class="action_menu" style="width:9rem;">
                        <div style="padding-left:0.4rem;">
                        <form method="get" action="main">
                           <button type="submit" id="mainBtn" style="background-color:transparent; border:none; color:white" >
                           <i class="fas fa-user-circle"></i> main page</button>
                        </form>
                     
                          <button onclick="goBack()"style="background-color:transparent; border:none; color:white">
                           <i class="fas fa-sign-out-alt">
                           </i> Go Back</button>
                           
                        <form method="Post" action="delchatroom">
                           
                           <button type="button" onclick="Exit()" id="exitBtn" style="background-color:transparent; border:none; color:white">
                           <i class="fas fa-sign-out-alt">
                           </i> Exit</button>
                           
                        </form>
                     
                        </div>   
                        
                        
                     </div>
                  </div>
   <script src="https://cdn.jsdelivr.net/npm/sockjs-client/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
    <script src="/path/to/stomp-client.js"></script>
  
  
<c:choose>   
<c:when test="${chatroom_id == null || chatroom_id == ''}">   
   <div class="card-body">
    </div>   
   <div class="card-footer">   
   </div>
   </c:when>   
   <c:otherwise>
   <div class="input-group">   
   <input id="chatroom_id" value="${chatroom_id}" hidden />
   <input id="chatroom_name" value="${chatroom_name}" hidden />
   <input id="curName" value="${sessionScope.user_name}" hidden />
   
   <div style="background:lightgrey;width:7rem;font-weight:bold;padding-left:5px"  class="border rounded"> with : ${userName} <input id="name" value="${param.user_id}"  hidden /></div> <!-- 팀원 더블클릭해서 들어올때 여기로 이름 받기 -->
    </div>
    
   <div class="card-body input-group-append scrollbar" id="chatArea" >

    <div id="show" style="width:100%">
    </div>

   
 </div>   
 
   <div class="card-footer">
         <div class="input-group">
            
            <div class="input-group mb-3">   
   
      <input id="msg" class="form-control type_msg" placeholder="Type your message..."/>
            <div class="input-group-text send_btn"   >
               <i class="fas fa-location-arrow" onclick="sendName()"></i>
               
            </div>
         </div>
      </div>
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
                 console.log(data.msg1)
                  // 서버에서 응답을 성공적으로 받았을 때 처리
                  if (data.chatroom_id !=="" && data.chatroom_id !== null) {
                     // ajax에서는 
                   //  console.log('채팅 왜 안되니:'+ project_id);
                   //   console.log('채팅 왜 안되니2:'+project_Id);
                      location.href = 'message?chatroom_id=' + data.chatroom_Id +'&user_id='+user_id+'&chatroom_name='+data.chatroom_Name;
                  } 
                    else {
                      alert('채팅방 정보를 가져오는 데 실패했습니다.');
                  }
              },
              error: function(err) {
                  // 요청이 실패했을 때 처리
                  console.log('AJAX 요청 실패');
                  console.log(err);
                 // console.log(data.Project_Id);
                 // console.log(project_id);
                  alert('채팅방 정보를 가져오는 중 오류가 발생했습니다.');
              }
          });
      }
   </script>  

  <script type="text/javascript">
    
    
// 메세지 보내는 소켓  
var socket = new SockJS('/ws');
var stompClient = Stomp.over(socket);

stompClient.connect({}, function(frame) {
    console.log('Connected: ' + frame);
    
    // 채팅방 ID를 가져와서 구분
    stompClient.subscribe('/topic/greetings', function(greeting){
        var obj = JSON.parse(greeting.body);
        var curName = document.getElementById('curName').value;
        var chatroom_id = document.getElementById('chatroom_id').value;

        console.log("## 받은 메시지 ##");
        console.log(obj.msg);
        console.log("## 받은 이름 ##");
        console.log(obj.name);
        
       //채팅아이디에 따른 보낼 수 있는 조건

        // 현재 채팅방 ID와 수신된 메시지의 채팅방 ID가 일치하는 경우에만 메시지를 표시
       if (chatroom_id === obj.chatroom_id) {
           var alignmentClass = curName === obj.name ? 'right' : 'left';
           displayMessage(obj.name, obj.msg, alignmentClass); //상대방 화면 -없으면 상대방 화면에 안보임

           // 받은 메시지를 localStorage에 저장
           storeMessage(obj.name, obj.msg, obj.chatroom_id); // 없으면 localstorage 저장 안됨-꼭필요
         if(curName === obj.name) {
           scrollToBottom(); //메세지 보내면 아래로
         }
       }
      
    });
});

// 메시지를 localStorage에 저장하는 함수
function storeMessage(name, msg, chatroom_id) {
    var messages = JSON.parse(localStorage.getItem(chatroom_id)) || [];
    messages.push({name: name, msg: msg, chatroom_id:chatroom_id});
    localStorage.setItem(chatroom_id, JSON.stringify(messages));
}

// 메시지를 화면에 표시하는 함수
function displayMessage(name, msg, alignment) {
    var messageDiv = document.createElement('div');
    messageDiv.classList.add(alignment);
    //화면에 보이는 부분
    messageDiv.innerHTML =  msg + "<br>"; // 메세지 표현 부분-없으면 동그랗게만 보임
    document.querySelector("#show").appendChild(messageDiv); //이것도 화면표현-꼭필요 없으면 아예 안나옴
  //  document.getElementById('msg').value = ''; 이 부분이 있어서 다른사용자의 send도 같이 없어짐

    // 메시지를 localStorage에 저장
   // storeMessage(name, msg);
}

function sendName() {
    var name = document.getElementById('curName').value;
    var msg = document.getElementById('msg').value;
    var chatroom_id = document.getElementById('chatroom_id').value;  // 채팅방 ID 가져오기
    var sendname = '${sessionScope.user_name}';
    var alignmentClass = name === sendname ? 'right' : 'left';

 // 메시지가 비어있는지 확인
    if (msg === "") {
        return; // 메시지가 비어있으면 아무 작업도 하지 않음
    }
 
    // 메시지를 화면에 표시
   // displayMessage(name, msg, alignmentClass);//없으면 스크롤 안내려감

    // 메시지를 localStorage에 저장
   // storeMessage(name, msg, chatroom_id);
    
    //var group = document.getElementById('chatroom_id').value;                    , 'group':group
    stompClient.send("/app/hello", {}, JSON.stringify({'name': name, 'msg': msg, 'chatroom_id' : chatroom_id}));

   
    scrollToBottom();
    document.getElementById('msg').value = '';
}
function scrollToBottom() {
    var chatArea = document.getElementById('chatArea');
       chatArea.scrollTop = chatArea.scrollHeight;
}
// 페이지 로드 시 localStorage에서 메시지 불러오기
window.onload = function() {
    var chatroom_id = document.getElementById('chatroom_id').value;
    var messages = JSON.parse(localStorage.getItem(chatroom_id)) || [];
   messages.forEach(function(message) {
        var alignmentClass = message.name === '${sessionScope.user_name}' ? 'right' : 'left';
        displayMessage(message.name, message.msg, alignmentClass);
    });
   scrollToBottom(); // 페이지 로드 후 스크롤을 아래로 이동
}


function Exit() {
    var chatroom_id = document.getElementById('chatroom_id').value;
    
    var isConfirmed = confirm("채팅방을 나가시겠습니까? (채팅방은 삭제됩니다)"); 

    if (isConfirmed) {
 	// localStorage 내용 삭제
  	// localStorage.clear(); // 모든 채팅방에 대해 
    localStorage.removeItem(chatroom_id) //현재 채팅
    document.querySelector("#show").innerHTML = '';
 
  	// Fetch API를 사용하여 DELETE 요청 전송
    fetch(`/chatrooms/${chatroom_id}`, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.text())
    .then(result => {
        alert(result);
        // 필요시 페이지 리다이렉션
        window.location.href = '/chatmemListstart';
    })
    .catch(error => console.error('Error:', error));
    }
}
</script>     
 
<script style="text/javascript">
document.addEventListener('DOMContentLoaded', () => {
    document.getElementById('memList').classList.add('active');
    $("#mem_list").show();
    $("#chat_list").hide();

});

function showMem() {
    document.getElementById('memList').classList.add('active');
    document.getElementById('chatList').classList.remove('active');
    //loadTeamList();
    $.ajax({
        url: '/chatmemListstart',
        method: 'GET',
        success: function(data) {
            // HTML을 업데이트하여 chat_list만 보이게 함
            $('body').html(data);

            // mem_list를 숨기고 chat_list를 보이게 함
            $('#mem_list').show();
            $('#chat_list').hide();
        },
        error: function(err) {
            console.error('There has been a problem with your AJAX request:', err);
        }
    });
}

function showChatRoom() {
    document.getElementById('memList').classList.remove('active');
    document.getElementById('chatList').classList.add('active');
  //  loadChatList();
  //  $("#mem_list").hide();
  //  $("#chat_list").show();
    $.ajax({
        url: '/chatmemListstart',
        method: 'GET',
        success: function(data) {
            // HTML을 업데이트하여 chat_list만 보이게 함
            $('body').html(data);

            // mem_list를 숨기고 chat_list를 보이게 함
            $('#mem_list').hide();
            $('#chat_list').show();
        },
        error: function(err) {
            console.error('There has been a problem with your AJAX request:', err);
        }
    });
}

function scrollToBottom() {
    var chatArea = document.getElementById('chatArea');
    chatArea.scrollTop = chatArea.scrollHeight;
}

</script>
   </body>
</html>