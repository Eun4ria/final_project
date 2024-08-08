package com.web.finalProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.view.RedirectView;

import com.web.finalProject.service.A0_Service;
import com.web.finalProject.util.Util;
import com.web.finalProject.vo.Gantt;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.Users;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class A0_Controller {
	@Autowired(required=false)
	private A0_Service service;
	
	private Util util;
	
// 회원가입
	//사용자 처음 폼
	// http://localhost:4040/signupFrm
	@GetMapping("signupFrm")
	public String signupFrm() {
		return "WEB-INF\\views\\a02_sign_up.jsp";
	}

	//사용자 등록 시
	// http://localhost:4040/sign_up
	 @GetMapping("sign_up")
	    public String sign_up(@ModelAttribute Users ins, Model d) {
	        String resultMessage = service.insertUser(ins);
	        d.addAttribute("msg", resultMessage);
	        return "WEB-INF/views/a02_sign_up.jsp"; 
	    }
		
//이메일 유효성 확인	
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

	           String role_code = user.getRole_code();
	           if ("C".equals(role_code)) {
	               return "redirect:mainFrm"; // 회사 페이지
	           } else if ("P".equals(role_code)) {
	               return "redirect:mainpmFrm"; // PM 페이지
	           } else {
	               return "redirect:mainmemFrm"; // 일반 사용자 페이지
	           }
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

//아이디 찾기
	// 로그인 아이디 찾기 폼 
	// http://223.26.198.130:4040/find_id
	@GetMapping("find_id")
	public String find_idFrm() { 
		return "WEB-INF\\views\\a01_find_id.jsp"; 
	}
	// 사용자 일치하는지 확인
    @PostMapping("find_id")
	public ResponseEntity<String> find_id(Users user) {	
		return ResponseEntity.ok(service.find_id(user));
	} 
    // 로그인 성공할 경우 아이디 보여줄 페이지
 	// http://223.26.198.130:4040/find_id_result
 	@PostMapping("find_id_result")
 	public String find_id_result(Users user, Model d) { 
 		d.addAttribute("result", service.find_id(user));
 		return "WEB-INF\\views\\a01_find_id_result.jsp"; 
 	}    

// 비밀번호 찾기
	// 비밀번호 찾기 폼
	// http://223.26.198.130:4040/find_pwd
	@GetMapping("find_pwd")
    public String find_pwdFrm() {
        return "WEB-INF\\views\\a01_find_pwd.jsp";
    }
	// http://223.26.198.130:4040/find_pwd
	@PostMapping("temp_pwd")
	public String temp_pwd(Users user) {		
		return "";
	}


// 메인화면
	// http://223.26.198.130:4040/main
	@GetMapping("mainFrm")
    public String main(@RequestParam(name="user_id", defaultValue="P_0012") String user_id,
    		HttpServletRequest request, Model d) {
		d.addAttribute("pro", service.getProjectList(user_id));
        d.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a00_main_com.jsp";
    }
	@GetMapping("mainpmFrm")
	public String mainpm(HttpServletRequest request, Model d) {
	    // 세션에서 user_id 값을 가져옵니다.
	    HttpSession session = request.getSession(false); // false를 사용하여 기존 세션이 없으면 새로 생성하지 않도록 합니다.
        String user_id = (String) session.getAttribute("user_id");

        // user_id를 이용하여 프로젝트 목록을 가져옵니다.
        d.addAttribute("pro", service.getProjectList(user_id));
        d.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a00_main_pm.jsp";
	} 
	@GetMapping("mainmemFrm")
	public String mainmem(HttpServletRequest request, Model d) {
		// 세션에서 user_id 값을 가져옵니다.
		HttpSession session = request.getSession(false); // false를 사용하여 기존 세션이 없으면 새로 생성하지 않도록 합니다.
		String user_id = (String) session.getAttribute("user_id");
		
		// user_id를 이용하여 프로젝트 목록을 가져옵니다.
		d.addAttribute("pro", service.getProjectList(user_id));
		d.addAttribute("currentUrl", request.getRequestURI());
		return "WEB-INF\\views\\a00_main_mem.jsp";
	}
	
// 프로젝트 생성
	@PostMapping("insertProject")
	public String insertProject(Project ins, Model d){
		d.addAttribute("msg", service.insertProject(ins));
		return "WEB-INF\\views\\a00_main_pm.jsp";
	}	

// 팀원 리스트
	// http://223.26.198.130:4040/teamList
	@RequestMapping("teamList")
	public ResponseEntity<List<Users>> getTeamList(@RequestParam(value = "project_id", defaultValue = "PRO_0001") String project_id) {
	    return ResponseEntity.ok(service.getTeam(project_id));
	}

	// 프로필
	// http://223.26.198.130:4040/profile
    @GetMapping("profile")
    public String profile(HttpServletRequest request, Model model) {
        model.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a01_profile.jsp";
    }
	
// 사이드바	
	// http://223.26.198.130:4040/sideBar
	@RequestMapping("sideBar")
	public String sideBar() {
		return "WEB-INF\\views\\a00_sideBar.jsp";
	}

// 간트 차트
	
	// 간트 페이지
	// http://223.26.198.130:4040/gantt
	@GetMapping("gantt")
	public String gantt(Users user) {		
		return "WEB-INF\\views\\a01_ganttChart.jsp";
	}
	// 간트 조회
	// http://223.26.198.130:4040/ganttList
	@RequestMapping("ganttList")
	public ResponseEntity<?> getGantt(@RequestParam(value = "project_id", defaultValue = "PRO_0001") String project_id, Model d) {
		System.out.println("project_id:"+project_id);
		return ResponseEntity.ok(new Gantt(
					service.getGantt(project_id),
					service.getTeam(project_id)));
	}
	
// 캘린더
	// http://223.26.198.130:4040/fullcalendar
	@GetMapping("fullcalendar")
    public String fullcalendar() {
        return "WEB-INF\\views\\a01_fullcalendar.jsp";
    }
	
// 메인 -> 대시보드(to do)
	// http://223.26.198.130:4040/todoFrm
	@GetMapping("todoFrm")
    public String todo(@RequestParam(name="user_id", defaultValue="P_0012") String user_id,
    		HttpServletRequest request, Model d) {
		d.addAttribute("pro", service.getProjectList(user_id));
        d.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a00_dash_com.jsp";
    }
	@GetMapping("todopmFrm")
	public String todopm(HttpServletRequest request,  Model d) {
	    // 세션에서 user_id 값을 가져옵니다.
	    HttpSession session = request.getSession(false); // false를 사용하여 기존 세션이 없으면 새로 생성하지 않도록 합니다.
        String user_id = (String) session.getAttribute("user_id");
//	        String project_id = (String) session.getAttribute("project_id");

        // user_id를 이용하여 프로젝트 목록을 가져옵니다.
        d.addAttribute("pro", service.getProjectList(user_id));
//	        d.addAttribute("proj", service.getProjectList(project_id));
        d.addAttribute("currentUrl", request.getRequestURI());
      
        return "WEB-INF\\views\\a00_dash_pm.jsp";
	} 
	@GetMapping("todomemFrm")
	public String todomemFrm(HttpServletRequest request, @RequestParam("project_id") String  project_id, Model d) {
		// 세션에서 user_id 값을 가져오기
		HttpSession session = request.getSession(false); // false를 사용하여 기존 세션이 없으면 새로 생성하지 않도록 합니다.
		String user_id = (String) session.getAttribute("user_id");
		
		// 세션에 project_id 저장
	    session.setAttribute("project_id", project_id);
		
		
		// user_id를 이용하여 프로젝트 목록을 가져오기
		d.addAttribute("pro", service.getProjectList(user_id));
		d.addAttribute("currentUrl", request.getRequestURI());
		return "WEB-INF\\views\\a00_dash_mem.jsp";
	}
	
// 채팅
	//왼쪽 채팅 조회
	// http://localhost:4040/chatmemListstart
//	@RequestMapping("chatmemListstart")
//	public String memList(Chat sch, Model d) {
//		List<Chat> members = service.getmemList(sch);
//		d.addAttribute("memList",members);
//		 System.out.println("memlist:" + members);
//		return "WEB-INF\\views\\a02_chat.jsp";
//	}
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
//	// http://localhost:4040/chat
//	@Value("${socketServer}")
//	private String socketServer;
//	@GetMapping("chat")
//	public String chat(Model d) {
//		d.addAttribute("socketServer", socketServer);
//		return "WEB-INF\\views\\a02_chat2.jsp";
//	}
//	// var socketServer = '${socketServer}'.replace(/^"|"$/g,'')
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