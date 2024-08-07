package com.web.finalProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.view.RedirectView;

import com.web.finalProject.service.A02_Service;
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
   // http://localhost:4040/signinFrm
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

	// 메인 -> 대시보드(to do)
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
      
        return "WEB-INF\\views\\a00_dash_mem.jsp";
	}
	// 채팅
	// 왼쪽 채팅 조회
	// http://localhost:4040/chatmemListstart
//				@RequestMapping("chatmemListstart")
//				public String memList(Chat sch, Model d) {
//					List<Chat> members = service.getmemList(sch);
//					d.addAttribute("memList",members);
//					 System.out.println("memlist:" + members);
//					return "WEB-INF\\views\\a02_chat.jsp";
//				}
	// http://localhost:4040/chatmemListstart
	@RequestMapping("chatmemListstart")
		public String memList(Users sch, Model d, HttpServletRequest request) {
		    // 세션에서 project_id를 가져온다.
			
		    HttpSession session = request.getSession();
		    String project_id = (String) session.getAttribute("project_id");
		    String user_id = (String) session.getAttribute("user_id");
		    System.out.println("PROJECT_ID:" + project_id);
		    // Chat 객체에 project_id와 user_id를 설정
		    sch.setProject_id(project_id);
		    sch.setUser_id(user_id); // user_id는 요청 파라미터로 전달된 값
		    
		    // 회원 리스트를 가져온다.
		    List<Users> members = service.getmemList(sch);
		    
		    // 모델에 데이터 추가
		    d.addAttribute("memList", members);
		    System.out.println("memlist:" + members);
		    
		    // JSP 페이지로 이동
		    return "WEB-INF\\views\\a02_chat.jsp";	
		}

	// 채팅-오른쪽 채팅
//				// http://localhost:4040/chat
//				@Value("${socketServer}")
//				private String socketServer;
//				@GetMapping("chat")
//				public String chat(Model d) {
//					d.addAttribute("socketServer", socketServer);
//					return "WEB-INF\\views\\a02_chat2.jsp";
//				}
//				// var socketServer = '${socketServer}'.replace(/^"|"$/g,'')
	//
	// 채팅-오른쪽 채팅
	// http://localhost:4040/message
	@GetMapping("message")
		public String chatting() {
			return "WEB-INF\\views\\a02_chat.jsp";
			//return "WEB-INF\\views\\a02_chat.jsp";
		}

	@MessageMapping("/hello")
	    @SendTo("/topic/greetings")
	    public String greeting(String message) {
	    	System.out.println("# 메시지 전송 #"+message);
	    	
	    	
	        return message;
	    }

	

	

	

}
