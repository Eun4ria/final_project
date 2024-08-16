package com.web.finalProject.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.scheduling.config.Task;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.web.finalProject.service.A02_Service;
import com.web.finalProject.vo.Chat;
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
   // http://192.168.0.42:4040/signinFrm
// http://192.168.45.181:4040/signinFrm  //노트북
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
	// http://localhost:4040/dashpmFrm
	// 이것이 기준입니다. 프로젝트 리스트에서 해당 프로젝트 클릭 시 세션 세팅
	@GetMapping("dashpmFrm")
	public String dashpmFrm(@RequestParam("project_id") String project_id,
			HttpServletRequest request,  Model d) {
		
	    HttpSession session = request.getSession(); 
	    // 세션에 프로젝트 아이디 생성
        session.setAttribute("project_id", project_id);
      
        return "WEB-INF\\views\\a00_dash_pm.jsp";
	}
	@GetMapping("dashmemFrm")
	public String dashmemFrm(@RequestParam("project_id") String project_id, 
			HttpServletRequest request,  Model d) {
		
	    HttpSession session = request.getSession(); 
	    // 세션에 프로젝트 아이디 생성
        session.setAttribute("project_id", project_id);
        
        // 업무 리스트를 가져온다.
	    
      
        return "WEB-INF\\views\\a00_dash_mem.jsp";
	}
	
//// todo list
//	// http://localhost:4040/todoFrm
//	@GetMapping("todoFrm")
//	public String getTaskList(Task sch, Model d, HttpServletRequest request) {
//		HttpSession session = request.getSession(); 
//		String project_id = (String) session.getAttribute("project_id");
//		String user_id = (String) session.getAttribute("user_id");
//		 
//		    System.out.println("PROJECT_ID:" + project_id);
//		    // Chat 객체에 project_id와 user_id를 설정
//		    sch.setProject_id(project_id);
//		    sch.setUser_id(user_id); // user_id는 요청 파라미터로 전달된 값
//		    
//		    // 회원 리스트를 가져온다.
//		    List<Task> members = service.getmemList(sch);
//		    
//		    // 모델에 데이터 추가
//		    d.addAttribute("memList", members);
//		    System.out.println("memlist:" + members);
//		    
//		    // JSP 페이지로 이동
//		   // return "WEB-INF\\views\\a02_chat2.jsp";	
//		    return "WEB-INF\\views\\a02_chat_last.jsp"
//		
//		
//		return "WEB-INF\\views\\a00_todo.jsp";
//	}
//	
	// 대시보드 -> todoList
	@GetMapping("todopmFrm")
	public String todopmFrm(@RequestParam("project_id") String project_id,
			HttpServletRequest request,  Model d) {
		
	    HttpSession session = request.getSession(); 
	    // 세션에 프로젝트 아이디 생성
        session.setAttribute("project_id", project_id);
      
        return "WEB-INF\\views\\a02_todo_pm.jsp";
	}
	@GetMapping("todomemFrm")
	public String todomemFrm(@RequestParam("project_id") String project_id,
			HttpServletRequest request,  Model d) {
		
		HttpSession session = request.getSession(); 
		// 세션에 프로젝트 아이디 생성
		session.setAttribute("project_id", project_id);
		
		String user_id = (String) session.getAttribute("user_id");
		
		session.setAttribute("user_id", user_id);
		
		System.out.println(project_id);
		System.out.println(user_id);
		
	
		
		
		return "WEB-INF\\views\\a02_todo_mem.jsp";
	}
	
	
	
	@GetMapping("Deliverables")
	public String Deliverables(@RequestParam("project_id") String project_id,
			HttpServletRequest request,  Model d) {
		
		HttpSession session = request.getSession(); 
		// 세션에 프로젝트 아이디 생성
		session.setAttribute("project_id", project_id);
		
		return "WEB-INF\\views\\a00_deliverables.jsp";
	}
	
	
// 채팅
	// 왼쪽 채팅 조회
	
	// http://localhost:4040/chatmemListstart
	@RequestMapping("chatmemListstart")
		public String memList(Users sch, Model d, HttpServletRequest request , Chat chsch) {
		    // 세션에서 project_id를 가져온다.
			
		    HttpSession session = request.getSession();
		    String project_id = (String) session.getAttribute("project_id");
		    String user_id = (String) session.getAttribute("user_id");
		    System.out.println("PROJECT_ID:" + project_id);
		    // Chat 객체에 project_id와 user_id를 설정
		    sch.setProject_id(project_id);
		    sch.setUser_id(user_id); // user_id는 요청 파라미터로 전달된 값
		    chsch.setProject_id(project_id);
		    chsch.setUser_id(user_id); // user_id는 요청 파라미터로 전달된 값
		    
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
		System.out.println(get.getProject_id());
		System.out.println(get.getUser_id());
		System.out.println(get.getOwner_id());
		
		int chatroomCk = service.chatroomCk(get);
		
		
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
//			return ResponseEntity.ok(new msgList3(
//					chatroom_Id,chatroom_Name,Project_Id));
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
//			return ResponseEntity.ok(new msgList2(
//					msg,chatroom_Id,chatroom_Name,Project_Id
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
			return "WEB-INF\\views\\a02_chat_last.jsp"; //원래
		// return "WEB-INF\\views\\a02_chatmodal.jsp"; //모달
		    

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


	
	// 채팅 나가기
	@GetMapping("/removeChatroomSession")
    public String removeChatroomSession( HttpSession session) {
//	   HttpSession session = request.getSession();
//	    String project_id = (String) session.getAttribute("project_id");
//	    String user_id = (String) session.getAttribute("user_id");
//	    session.setAttribute("project_id", project_id);
//	    session.setAttribute("user_id", user_id);
	    
	   // request.removeAttribute("chatroom_id");
		session.removeAttribute("chatroom_id");
        return "redirect:/chatmemListstart"; // 세션 삭제 후 이동할 페이지
    }

	
	// todo list
		// http://localhost:4040/todoFrm
			@GetMapping("todoFrm")
			public String getTasksList(Tasks sch, Model d, HttpServletRequest request) {
				HttpSession session = request.getSession(); 
				String project_id = (String) session.getAttribute("project_id");
				String user_id = (String) session.getAttribute("user_id");
				
				session.setAttribute("project_id", project_id);
				session.setAttribute("user_id", user_id);
				
				System.out.println(project_id);
				System.out.println(user_id);
				
				// Task 객체에 project_id와 user_id를 설정
				sch.setProject_id(project_id);
				sch.setUser_id(user_id); // user_id는 요청 파라미터로 전달된 값
				    
			    // 업무 리스트를 가져온다.
			    List<Tasks> tasks = service.getTaskList(sch);
			    
			    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			    // 날짜를 문자열로 변환
			    for (Tasks task : tasks) {
			    	 if (task.getEnd_date() != null) {
			             String endDateFormatted = dateFormat.format(task.getEnd_date());
			             task.setEndDateFormatted(endDateFormatted);
			            // System.out.println(endDateFormatted);
			         }
		          
			    }
				    
			    // 모델에 데이터 추가
			    d.addAttribute("tasklist", tasks);
			    System.out.println("tasklist:" + tasks);

				
				// return "WEB-INF\\views\\a02_todo.jsp"; //원래
			     return "WEB-INF\\views\\a02_taskdo3.jsp"; //지금
			    
			}

			
			
//board
	// http://localhost:4040/board
	@GetMapping("board")
    public String board(HttpServletRequest request, Model d) {
		d.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a00_index.jsp";
    }
	
	//필요없는 파일 :task2
//board
//	// http://localhost:4040/taskdo
//	@RequestMapping("task2")
//	public String taskdo(HttpServletRequest request, Model d) {
//		
//		return "WEB-INF\\views\\a02_task2.jsp";
//	}
	// http://localhost:4040/taskdo
	@RequestMapping("taskdo")
	public String taskdo1(HttpServletRequest request, Model d) {
		
		return "WEB-INF\\views\\a02_taskdo.jsp";
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
