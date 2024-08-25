package com.web.finalProject.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.finalProject.service.A02_Service;
import com.web.finalProject.vo.Budget;
import com.web.finalProject.vo.BudgetSch;
import com.web.finalProject.vo.Chat;
import com.web.finalProject.vo.Taskfile;
import com.web.finalProject.vo.Tasks;
import com.web.finalProject.vo.Users;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class A02_Controller {
	
	@Autowired(required=false)
	private A02_Service service;
	
	//로그인
   // 로그인 처음 폼 
	// http://223.26.198.130:4040/signinFrm // 고정IP 주소
   // http://192.168.0.42:4040/signinFrm
// http://localhost:4040/signinFrm  //노트북
	  @GetMapping("signinFrm")
	   public String sign_in() {
	      return "WEB-INF\\views\\a02_sign_in.jsp";
	   }
	   
	  // http://localhost:4040/signin
	   @PostMapping("signin")
	      public String login(Users login, Model d, HttpServletRequest request) {
	          int loginCk = service.loginCk(login);
	          if (loginCk > 0) {
	              Users user = service.login(login);
	              HttpSession session = request.getSession(true); // 세션 생성
	              session.setAttribute("user_id", user.getUser_id());
	              session.setAttribute("user_name", user.getUser_name());
	              session.setAttribute("image", user.getImage());
	              session.setAttribute("role_code", user.getRole_code());
	              session.setAttribute("project_id", user.getProject_id());
	              
	              // 권한에 따라 리다이렉트
	              System.out.println("Role code:" + user.getRole_code());
	              System.out.println("user_id:" + user.getUser_id());
	              
	              return "redirect:main"; // 사용자 메인 페이지
	          } else {
	              d.addAttribute("errorMessage", "일치하는 회원이 없습니다");             
	          }

	          return "WEB-INF\\views\\a02_sign_in.jsp"; // 로그인 페이지

	      }
		//로그아웃
	   @PostMapping("/logout")
	   public RedirectView logout(HttpServletRequest request, HttpServletResponse response) {
	       // 세션 무효화 및 쿠키 삭제
	       request.getSession().invalidate();
	       Cookie cookie = new Cookie("JSESSIONID", null);
	       cookie.setMaxAge(0);
	       cookie.setPath("/");
	       response.addCookie(cookie);

	       // 로그인 페이지로 리다이렉트
	       return new RedirectView("/signinFrm");
	   }

		// 회원가입
		// 사용자 처음 폼
		// http://localhost:4040/signupFrm
		@GetMapping("signupFrm")
			public String signupFrm() {
				return "WEB-INF\\views\\a02_sign_up.jsp";
			}

		// 사용자 등록 시
		// http://localhost:4040/sign_up
		@GetMapping("sign_up")
		    public String sign_up(@ModelAttribute Users ins, Model d) {
		        String resultMessage = service.insertUser(ins);
		        d.addAttribute("msg", resultMessage);
		        return "WEB-INF/views/a02_sign_up.jsp"; 
		    }

		// 이메일 유효성 확인
		// http://localhost:4040/check_email
		@PostMapping("check_email")
			 public @ResponseBody EmailCheckResponse checkEmail(@RequestParam("email") String email) {
		        boolean exists = service.emailCk(email) > 0;
		        return new EmailCheckResponse(exists);
		    }

		public static class EmailCheckResponse {
			private boolean exists;

			public EmailCheckResponse(boolean exists) {
				this.exists = exists;
			}

			public boolean isExists() {
				return exists;
			}

			public void setExists(boolean exists) {
				this.exists = exists;
			}
		}

		// 메인 -> 대시보드 
		// http://localhost:4040/dashmemFrm
		// 이것이 기준입니다. 프로젝트 리스트에서 해당 프로젝트 클릭 시 세션 세팅
//		@GetMapping("dashpmFrm")
//		public String dashpmFrm(@RequestParam(value="project_id",required = false) String project_id,
//				HttpServletRequest request,  Model d) {
//			
//		    HttpSession session = request.getSession(); 
//		    // 세션에 프로젝트 아이디 생성
//		    // 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
//		       if (session == null || session.getAttribute("user_id") == null) {
//		           // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
//		           d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
//		         
//		       }
//		    
//	        session.setAttribute("project_id", project_id);
//	      
//	        return "WEB-INF\\views\\a00_dash_pm.jsp";
//		}
		@RequestMapping("dashmemFrm")
		public String dashmemFrm(@RequestParam(value="project_id",required = false) String project_id, 
				HttpServletRequest request,  Model d) {
			
		    HttpSession session = request.getSession(); 
		    // 세션에 프로젝트 아이디 생성
		    // 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
		       if (session == null || session.getAttribute("user_id") == null) {
		           // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
		           d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
		         
		       }
	        session.setAttribute("project_id", project_id);
	        
	        // 업무 리스트를 가져온다.
	      
	        return "WEB-INF\\views\\a00_dash_mem.jsp";
		}
		
		@GetMapping("Deliverables")
		public String Deliverables(@RequestParam("project_id") String project_id,
				HttpServletRequest request,  Model d) {
			
			HttpSession session = request.getSession(); 
			// 세션에 프로젝트 아이디 생성
			 // 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
		       if (session == null || session.getAttribute("user_id") == null) {
		           // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
		           d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
		         
		       }
			session.setAttribute("project_id", project_id);
			
			return "WEB-INF\\views\\a00_deliverables.jsp";
		}
		
		
		
	// 채팅
		// 왼쪽 채팅 조회
		
		// http://localhost:4040/chatmemListstart
		@RequestMapping("chatmemListstart")
			public String memList(Users sch, Model d, HttpServletRequest request , Chat chsch) {
			    // 세션에서 project_id를 가져온다.
				
			    HttpSession session = request.getSession(false);
			    // 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
			       if (session == null || session.getAttribute("user_id") == null) {
			           // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
			           d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
			           return "WEB-INF\\views\\a02_chat_last.jsp";	
			       }else if(session.getAttribute("project_id") == null){
			    	   d.addAttribute("alertMessage", "프로젝트를 선택하세요.");
			    	   return "WEB-INF\\views\\a02_chat_last";
			       }
			    String project_id = (String) session.getAttribute("project_id");
			    String user_id = (String) session.getAttribute("user_id");
			    System.out.println("PROJECT_ID:" + project_id);
			    System.out.println("user_id: chat => " + user_id);
			   
			    // Chat 객체에 project_id와 user_id를 설정
			    sch.setProject_id(project_id);
			    sch.setUser_id(user_id); // user_id는 요청 파라미터로 전달된 값
			    chsch.setProject_id(project_id);
			    chsch.setOwner_id(user_id); // user_id는 요청 파라미터로 전달된 값

			 
			    // 회원 리스트를 가져온다.
			    List<Users> members = service.getmemList(sch);
			    List<Chat> chatlist = service.getchatList(chsch);
			    
			  
			    
			    // 모델에 데이터 추가
			    d.addAttribute("memList", members);
			    d.addAttribute("chatList", chatlist);
			    System.out.println("memlist:" + members);
			    
			    // JSP 페이지로 이동
			   // return "WEB-INF\\views\\a02_chat2.jsp";	
			    return "WEB-INF\\views\\a02_chat_last.jsp";	
			}

		
		// http://localhost:4040/checkChatRoom?project_id=PRO_0003&user_name=M_0022&owner_id=N_0047
		@PostMapping("checkChatRoom")
		public ResponseEntity<?> getchatRoomId(Chat get)  {
			System.out.println("프로젝트 아이디: " + get.getProject_id());
			System.out.println(get.getUser_id());
			System.out.println(get.getOwner_id());
			
			int chatroomCk = service.chatroomCk(get);
			System.out.println("chatroomCk홛인 " +chatroomCk);
			
			if( chatroomCk > 0) {
				System.out.println("채팅방 정보 있음");
				Chat chatroomId = service.getchatRoomId(get); // 채팅방 ID를 반환
				String chatroom_Id = chatroomId.getChatroom_id();
				String chatroom_Name = chatroomId.getChatroom_name();
				//HttpSession session = request.getSession();
				//  String project_id = (String) session.getAttribute("project_id");
				//  System.out.println("좀 돼라"+project_id);
				//String Project_Id = chatroomId.getProject_id();
				
				System.out.println("접속할 채팅방 아이디:"+chatroomId.getChatroom_id());
				System.out.println("접속할 채팅방 이름:"+chatroomId.getChatroom_name());
				System.out.println("접속할 채팅방 아이디:"+chatroom_Id);
				System.out.println("접속할 채팅방 이름:"+chatroom_Name);
			//	System.out.println("현재 접속해있는 프로젝트:"+Project_Id);
				System.out.println("접속할 채팅방"+chatroomId);
//				return ResponseEntity.ok(new msgList3(
//						chatroom_Id,chatroom_Name,Project_Id));
				return ResponseEntity.ok(new msgList3(
						chatroom_Id,chatroom_Name
						));
				
			} else {
				System.out.println("채팅방 정보 없음");
				String msg = service.insertchatroom(get);
				String msg1 = service.insertchatroom1(get);
				Chat chatroomId = service.getchatRoomId(get);
				String chatroom_Id = chatroomId.getChatroom_id();
				String chatroom_Name = chatroomId.getChatroom_name();
				//String Project_Id = chatroomId.getProject_id();
				//HttpSession session = request.getSession();
				//  String project_id = (String) session.getAttribute("project_id");
				//  System.out.println("좀 돼라"+project_id);
				
				System.out.println(chatroomId);
				System.out.println("접속할 채팅방 아이디:"+chatroom_Id);
				System.out.println("접속할 채팅방 이름:"+chatroom_Name);
				//System.out.println("현재 접속해있는 프로젝트:"+Project_Id);
//				return ResponseEntity.ok(new msgList2(
//						msg,chatroom_Id,chatroom_Name,Project_Id
					return ResponseEntity.ok(new msgList2(
							msg,msg1,chatroom_Id,chatroom_Name
				));
	        }
			

		}
		

		//
		// 채팅-오른쪽 채팅
		@Value("${socketServer}")
		private String socketServer;
		// http://localhost:4040/message
		@GetMapping("message")
			public String chatting(@RequestParam("chatroom_id") String chatroom_Id,
									@RequestParam("chatroom_name") String chatroom_Name, Model d, Users sch,HttpServletRequest request) {
			 
		    HttpSession session = request.getSession();
		    String project_id = (String) session.getAttribute("project_id");
		    String user_id = (String) session.getAttribute("user_id");
		    System.out.println("PROJECT_ID:" + project_id);
		    
		    session.setAttribute("project_id", project_id);
		    
		    // Chat 객체에 project_id와 user_id를 설정
		    sch.setProject_id(project_id);
		    sch.setUser_id(user_id); // user_id는 요청 파라미터로 전달된 값
		    
		    // 사용자 이름을 가져온다.
	        String userName = service.getUserName(project_id, chatroom_Id, user_id);
		    
		    // 회원 리스트를 가져온다.
		    List<Users> members = service.getmemList(sch);
		    
		   
		    
		    // 모델에 데이터 추가
		    d.addAttribute("memList", members);
		    d.addAttribute("userName", userName);
		    
		    
		    System.out.println("memlist:" + members);
		    System.out.println("userName 확인:" + userName);
			
		    	d.addAttribute("chatroom_id", chatroom_Id);
			    d.addAttribute("chatroom_name", chatroom_Name);
			    d.addAttribute("socketServer", socketServer);
			    System.out.println("넘겨받은 채팅창 아이디:"+chatroom_Id);
			    System.out.println("넘겨받은 채팅창 이름:"+chatroom_Name);
			    System.out.println("소켓 확인:"+socketServer);
			//	return "WEB-INF\\views\\a02_chat2.jsp";
				return "WEB-INF\\views\\a02_chat_last.jsp"; //원래
			//return "WEB-INF\\views\\a02_chatmodal.jsp"; //모달
			    

			}
		// http://localhost:4040/message
		@GetMapping("modalmessage")
		public String modalmessage(@RequestParam("chatroom_id") String chatroom_Id,
				@RequestParam("chatroom_name") String chatroom_Name, Model d, Users sch,HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			String project_id = (String) session.getAttribute("project_id");
			String user_id = (String) session.getAttribute("user_id");
			System.out.println("PROJECT_ID:" + project_id);
			
			session.setAttribute("project_id", project_id);
			
			// Chat 객체에 project_id와 user_id를 설정
			sch.setProject_id(project_id);
			sch.setUser_id(user_id); // user_id는 요청 파라미터로 전달된 값
			
			// 회원 리스트를 가져온다.
			List<Users> members = service.getmemList(sch);
			
			// 모델에 데이터 추가
			d.addAttribute("memList", members);
			System.out.println("memlist:" + members);
			
			d.addAttribute("chatroom_id", chatroom_Id);
			
			d.addAttribute("chatroom_name", chatroom_Name);
			d.addAttribute("socketServer", socketServer);
			System.out.println("넘겨받은 채팅창 아이디:"+chatroom_Id);
			System.out.println("넘겨받은 채팅창 이름:"+chatroom_Name);
			System.out.println("소켓 확인:"+socketServer);
			//	return "WEB-INF\\views\\a02_chat2.jsp";
			//	return "WEB-INF\\views\\a02_chat_last.jsp"; //원래
			return "WEB-INF\\views\\a02_chatmodal.jsp"; //모달
			
		}
		 
		@MessageMapping("/hello")
	    @SendTo("/topic/greetings")
	    public String greeting(String message) {
	    	System.out.println("# 메시지 전송 #"+message);
	    	
	    	
	        return message;
	    }

		
		// 채팅 뒤로가기
		@GetMapping("/removeChatroomSession")
	    public String removeChatroomSession( HttpSession session) {
//		   HttpSession session = request.getSession();
//		    String project_id = (String) session.getAttribute("project_id");
//		    String user_id = (String) session.getAttribute("user_id");
//		    session.setAttribute("project_id", project_id);
//		    session.setAttribute("user_id", user_id);
		    
		   // request.removeAttribute("chatroom_id");
			session.removeAttribute("chatroom_id");
	        return "redirect:/chatmemListstart"; // 세션 삭제 후 이동할 페이지
	    }
		
		//채팅 나가기
		@PostMapping("delchatroom")
		public String delchatroom(@RequestParam("chatroom_id") String chatroom_id, Model d) {
			 // 서비스 호출을 통해 chatroom_id를 사용하여 삭제 수행
		    String result = service.delchatroom(chatroom_id);
		    
			d.addAttribute("msg",result);
			d.addAttribute("proc", "del");
			return "WEB-INF\\views\\a02_chat_last.jsp";
		}

		
// todo list - 조회
	// http://localhost:4040/todoFrm
		@GetMapping("todoFrm")
		public String getTasksList(Tasks sch, Model d, HttpServletRequest request) {
			HttpSession session = request.getSession(); 
			 d.addAttribute("currentUrl", request.getRequestURI());
		    // 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
		       if (session == null || session.getAttribute("user_id") == null) {
		           // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
		           d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");		           
		           return "WEB-INF\\views\\a02_taskdoList.jsp";
		       }else if(session.getAttribute("project_id") == null){
		    	   d.addAttribute("alertMessage", "프로젝트를 선택하세요.");
		    	   return "WEB-INF\\views\\a02_taskdoList.jsp";
		       }
	    	
			
			String project_id = (String) session.getAttribute("project_id");
			String user_id = (String) session.getAttribute("user_id");
			
			session.setAttribute("project_id", project_id);
			session.setAttribute("user_id", user_id);
			
			System.out.println("list project_id"+project_id);
			System.out.println("list user__id"+user_id);
			
			// Task 객체에 project_id와 user_id를 설정
			sch.setProject_id(project_id);
			sch.setUser_id(user_id); // user_id는 요청 파라미터로 전달된 값
			    
		    // 업무 리스트를 가져온다.
		    List<Tasks> tasks = service.getTaskList(sch);
		    
		    List<Tasks> taskall = service.getAllTaskList(sch);
		    
		   
		    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    // 날짜를 문자열로 변환
		    for (Tasks task : tasks) {
		    	 if (task.getEnd_date() != null || task.getStart_date() != null) {
		             String endDateFormatted = dateFormat.format(task.getEnd_date());
		             task.setEndDateFormatted(endDateFormatted);
		             String startDateFormatted = dateFormat.format(task.getStart_date());
		             task.setStartDateFormatted(startDateFormatted);
		            // System.out.println(endDateFormatted);
		         }
	          
		    }
		    // 날짜를 문자열로 변환
		    for (Tasks task : taskall) {
		    	if (task.getEnd_date() != null || task.getStart_date() != null) {
		    		String endDateFormatted = dateFormat.format(task.getEnd_date());
		    		task.setEndDateFormatted(endDateFormatted);
		    		String startDateFormatted = dateFormat.format(task.getStart_date());
		    		task.setStartDateFormatted(startDateFormatted);
		    		// System.out.println(endDateFormatted);
		    	}
		    	
		    }
		    
		    if(user_id != null && user_id.startsWith("P")) {
		    // 모델에 데이터 추가
		    d.addAttribute("tasklist", taskall);
		    System.out.println("tasklist:" + taskall);
		    }else {			   
		    // 모델에 데이터 추가
		    d.addAttribute("tasklist", tasks);
		    System.out.println("tasklist:" + tasks);
		    }    
		   
		 // return "WEB-INF\\views\\a02_todo.jsp"; //원래
		    return "WEB-INF\\views\\a02_taskdoList.jsp"; //지금
							    
		}
		
		
		//task detail - task id 체크
			  @PostMapping("/setTaskId")
			    public ResponseEntity<Void> setTaskId(@RequestParam String task_id, HttpServletRequest request) { 
				   // void : 반환값 없음
			        HttpSession session = request.getSession();
			        session.setAttribute("task_id", task_id);
			        System.out.println(task_id);
			        return ResponseEntity.ok().build();
			    }
		
		// http://localhost:4040/taskdo 
	  //todo detail - 상세
		@RequestMapping("taskdo")
		public String taskdo1(HttpServletRequest request, Model d) {
			HttpSession session = request.getSession(); 
			String task_id = (String) session.getAttribute("task_id");
			String user_id = (String) session.getAttribute("user_id");
			System.out.println("확인");
			session.setAttribute("task_id", task_id);
			session.setAttribute("user_id", user_id);
			System.out.println("task_id"+task_id);
			System.out.println("user_id"+user_id);
			
			Tasks item = service.getTaskDetail(task_id);
			
			List<Taskfile> fileinfo = service.getfilename(task_id);
			
			if (fileinfo != null && !fileinfo.isEmpty()) {
		        d.addAttribute("fileinfo", fileinfo);
		    }
	     
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//			// 날짜를 문자열로 변환

		  if (item.getEnd_date() != null) {
		        String endDateFormatted = dateFormat.format(item.getEnd_date());
		        item.setEndDateFormatted(endDateFormatted);
		    }
		    
		    if (item.getStart_date() != null) {
		        String startDateFormatted = dateFormat.format(item.getStart_date());
		        item.setStartDateFormatted(startDateFormatted);
		    }

			
			d.addAttribute("taskdetail", item);   
			System.out.println("taskdetail:" + item);
			
			return "WEB-INF\\views\\a02_taskdetail.jsp";
		}
		
		//todo SP 변경
//		@PostMapping("uptSP")
//		public ResponseEntity<String> uptSP(Tasks upt){
//			
//			return ResponseEntity.ok(service.uptSP(upt));
//		}
		
		@PostMapping("uptSP")
		public ResponseEntity<String> uptSP(Tasks task) {
		    // Tasks 객체를 생성하고 필드를 설정합니다.
//		    Tasks task = new Tasks();
//		    task.setTask_id(taskId);
//
//		    if ("tstatus".equals(field)) {
//		        task.setTstatus(value);;
//		    } else if ("priority".equals(field)) {
//		        task.setPriority(value);
//		    }
			System.out.println("변경할 task_id:"+task.getTask_id());

		    return ResponseEntity.ok(service.uptSP(task));
		}

		
		
		
		// to do uptdate - 수정
		@PostMapping("upttask")
		public String updatetask(@ModelAttribute Tasks upt, Model d) {
			d.addAttribute("msg", service.updatetask(upt));
			d.addAttribute("taskdetail", service.getTaskDetail(upt.getTask_id()));
			return "redirect:taskdo";
		}
		// to do delete - 삭제
		@RequestMapping("deltask")
		public String deletetask(HttpServletRequest request, Model d) {
			HttpSession session = request.getSession(); 
			String task_id = (String) session.getAttribute("task_id");
			session.setAttribute("task_id", task_id);
			
			d.addAttribute("msg", service.deletetask(task_id));
			d.addAttribute("proc", "del");
			return "WEB-INF\\views\\a02_taskdetail.jsp";
		}
			
		
			

//예산 관리
	// http://localhost:4040/budgetFrm
	@RequestMapping("budgetFrm")
	public String budgetFrm(@ModelAttribute("sch") BudgetSch sch, HttpServletRequest request, Model d) {
		 HttpSession session = request.getSession(false);
         // 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
        if (session == null || session.getAttribute("user_id") == null) {
            // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
            d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
            return "WEB-INF\\views\\a02_budgetList.jsp";
        }else if(session.getAttribute("project_id") == null){
    	   d.addAttribute("alertMessage", "프로젝트를 선택하세요.");
    	   return "WEB-INF\\views\\a02_budgetList.jsp";
 	    }
		String project_id = (String) session.getAttribute("project_id");
		
		// Budget 객체에 project_id와 role_code를 설정
	    sch.setProject_id(project_id);
	    
	    // 회원 리스트를 가져온다.
	    List<Budget> Budget = service.getBudgetList(sch);
	    List<Budget> BudParent = service.getparentList(sch);
	    
	   
	    // parent_id를 기준으로 예산을 합산할 Map
	    Map<String, Integer> parentAmountMap = new HashMap<>();
	    Map<String, Integer> childAmountMap = new HashMap<>();
	 // 차감 값을 계산
	    Map<String, Integer> amountDifference = new HashMap<>();

	    // 예산 리스트를 순회하며 parent_id를 기준으로 합산
	    for (Budget budget : Budget) {
	        String parent_id = budget.getParent_id();
	        int amount = budget.getAmount();

	        if (parent_id != null && parent_id!="N") {
	            if (budget.getLevel() != 1) {
	                parentAmountMap.put(parent_id, parentAmountMap.getOrDefault(parent_id, 0) + amount);
	                childAmountMap.put(parent_id, childAmountMap.getOrDefault(parent_id, 0) + amount);
	            }
	        }
	    }

	    for (String parent_id : parentAmountMap.keySet()) {
	        int parentAmount = parentAmountMap.get(parent_id);
	        int childAmount = childAmountMap.getOrDefault(parent_id, 0);
	        amountDifference.put(parent_id, parentAmount - childAmount);
	    }

	    // JSP로 데이터 전달
	    d.addAttribute("amountDifference", parentAmountMap);
	    d.addAttribute("currentUrl", request.getRequestURI());
	    d.addAttribute("BudList", Budget);
	    d.addAttribute("BudParent", BudParent);
		
		return "WEB-INF\\views\\a02_budgetList.jsp";
	}
	
	// 예산 입력
	@RequestMapping("budgetinsert")
	public String budgetInsert(Budget ins, RedirectAttributes redirectAttributes) {
		 String result = service.budgetInsert(ins); // Assuming it returns a message or status
	      redirectAttributes.addFlashAttribute("msg", result);
		 
		return "redirect:/budgetFrm";
	}
	
	// 예산 상세
	// http://localhost:4040/getBudgetID?budget_id=BUG_0001
	@PostMapping("getBudgetID")
	public ResponseEntity<List<Budget>> getBudget(@RequestParam("budget_id") String budget_id, Model d){
		return ResponseEntity.ok(service.getBudgetById(budget_id));
	}
	
	  // 예산 - 수정
    @PostMapping("/uptbudget")
    public ResponseEntity<String> budgetUpdate(Budget del) {
        // 서비스 호출하여 업데이트 수행
        String msg = service.budgetUpdate(del);
        
        // 상태 코드와 메시지를 반환
        return ResponseEntity.ok(msg);
    }
	// 예산 delete - 삭제
    @PostMapping("/delbudget")
    public ResponseEntity<String> delbudget( Budget del) {
        // 예산 ID 확인 (디버깅 용도로 남겨둠)
        System.out.println("예산 아이디:" + del.getBudget_id());
        
        // 자식 예산이 있는지 확인
        boolean hasChildren = service.countchild(del);
        
        // 자식 예산이 있으면 먼저 삭제
        if (hasChildren) {
            String childDeleteMsg = service.deleteChild(del);
            if ("삭제 실패".equals(childDeleteMsg)) {
                return ResponseEntity.ok(childDeleteMsg);
            }
        }
        
        // 예산 삭제 수행
        String deleteMsg = service.deleteBudget(del);
        System.out.println("삭제 메세지:" + deleteMsg);
        
        // 상태 코드와 메시지를 반환
        return ResponseEntity.ok(deleteMsg);
    }
	
  //차트
 // http://localhost:4040/chart
 	@RequestMapping("chart")
 	public String chart(HttpServletRequest request, Model d) {
 		 d.addAttribute("currentUrl", request.getRequestURI());
        HttpSession session = request.getSession();
        // 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
        if (session == null || session.getAttribute("user_id") == null) {
            // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
            d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
            return "WEB-INF/views/a02_chart.jsp";
        }else if(session.getAttribute("project_id") == null){
	    	   d.addAttribute("alertMessage", "프로젝트를 선택하세요.");
	    	   return "WEB-INF\\views\\a02_chart.jsp";
	      }
        String project_id = (String) session.getAttribute("project_id");

        // 서비스에서 데이터 가져오기
        List<Budget> chartParent = service.getBudgetparentchartList(project_id);
        List<String> budgetNames = new ArrayList<>();
        List<Integer> amounts = new ArrayList<>();

        for (Budget budget : chartParent) {
            budgetNames.add(budget.getBudget_name());
            amounts.add(budget.getAmount()/1000000);
        }

        // 차트 데이터를 JSON으로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String budgetNamesJson = objectMapper.writeValueAsString(budgetNames);
            String amountsJson = objectMapper.writeValueAsString(amounts);
            d.addAttribute("budgetNames", budgetNamesJson);
            d.addAttribute("amounts", amountsJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            // JSON 처리 중 예외 발생 시 처리
            d.addAttribute("errorMessage", "데이터 처리 중 오류가 발생했습니다.");
        }

        System.out.println("budget_name: " + budgetNames);
        System.out.println("amounts: " + amounts);

        return "WEB-INF/views/a02_chart.jsp";
    }
	
	
	
//	//다운로드 
//	@Value("${user.upload2}")
//	private String downloadPath; // 다운로드 경로
//
//	@RequestMapping("/download")
//	public void downloadFile(HttpServletResponse response, @RequestParam("fname") String filename) {
//	    try {
//	        File file = new File(downloadPath, filename);
//	        if (file.exists()) {
//	            response.setContentType("application/octet-stream");
//	            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
//	            FileInputStream inStream = new FileInputStream(file);
//	            OutputStream outStream = response.getOutputStream();
//	            byte[] buffer = new byte[4096];
//	            int bytesRead;
//	            while ((bytesRead = inStream.read(buffer)) != -1) {
//	                outStream.write(buffer, 0, bytesRead);
//	            }
//	            inStream.close();
//	            outStream.close();
//	        } else {
//	            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
//	        }
//	    } catch (IOException e) {
//	        e.printStackTrace();
//	    }
//	}
//
//	
	
	
//board
	// http://localhost:4040/board
	@GetMapping("board")
	public String board(HttpServletRequest request, Model d) {
		d.addAttribute("currentUrl", request.getRequestURI());
		return "WEB-INF\\views\\a00_index.jsp";
	}
	

		  		   
			
			

}









class msgList2{
	   private String msg;
	   private String msg1;
	   private String chatroom_Id;
	   private String chatroom_Name;
	//   private String Project_Id;
	   public msgList2() {
	      super();
	      // TODO Auto-generated constructor stub
	   }
	   public msgList2(String msg, String msg1, String chatroom_Id, String chatroom_Name) {
	      super();
	      this.msg = msg;
	      this.msg1 = msg1;
	      this.chatroom_Id = chatroom_Id;
	      this.chatroom_Name = chatroom_Name;
	   //   this.Project_Id = Project_Id;
	   }
	   public String getMsg() {
	      return msg;
	   }
	   public void setMsg(String msg) {
	      this.msg = msg;
	   }
	   public String getMsg1() {
		   return msg1;
	   }
	   public void setMsg1(String msg1) {
		   this.msg1 = msg1;
	   }
	   public String getChatroom_Id() {
	      return chatroom_Id;
	   }
	   public void setChatroom_Id(String chatroom_Id) {
	      this.chatroom_Id = chatroom_Id;
	   }
	   public String getChatroom_Name() {
		   return chatroom_Name;
	   }
	   public void setChatroom_Name(String chatroom_Name) {
		   this.chatroom_Name = chatroom_Name;
	   }
//	   public String getProject_Id() {
//		   return Project_Id;
//	   }
//	   public void setProject_Id(String Project_Id) {
//		   this.Project_Id = Project_Id;
//	   }
	   
	}
class msgList3{
	   private String chatroom_Id;
	   private String chatroom_Name;
	 //  private String Project_Id;
	   public msgList3() {
	      super();
	      // TODO Auto-generated constructor stub
	   }
	   public msgList3(String chatroom_Id, String chatroom_Name) {
	      super();
	      this.chatroom_Id = chatroom_Id;
	      this.chatroom_Name = chatroom_Name;
	   //   this.Project_Id = Project_Id;
	   }
	   public String getChatroom_Id() {
	      return chatroom_Id;
	   }
	   public void setChatroom_Id(String chatroom_Id) {
	      this.chatroom_Id = chatroom_Id;
	   }
	   public String getChatroom_Name() {
	      return chatroom_Name;
	   }
	   public void setChatroom_Name(String chatroom_Name) {
	      this.chatroom_Name = chatroom_Name;
	   }
//	   public String getProject_Id() {
//		   return Project_Id;
//	   }
//	   public void setProject_Id(String Project_Id) {
//		   this.Project_Id = Project_Id;
//	   }
	   
	}
