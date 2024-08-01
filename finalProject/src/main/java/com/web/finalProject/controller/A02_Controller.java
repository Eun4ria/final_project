package com.web.finalProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import com.web.finalProject.service.A02_Service;
import com.web.finalProject.vo.ChatSch;
import com.web.finalProject.vo.Users;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class A02_Controller {
	
	@Autowired(required=false)
	private A02_Service service;
	
//메인 화면(Dash Board)	
	// http://localhost:4040/maincom
	@PostMapping("maincom")
	public String maincom() {
		return "WEB-INF\\views\\a00_main.jsp";
	}
	// http://localhost:4040/mainpmFrm
	@PostMapping("mainpmFrm")
	public String mainpm() {
		return "WEB-INF\\views\\a00_main_pm.jsp";
	}
	// http://localhost:4040/mainmemFrm
	@PostMapping("mainmemFrm")
	public String mainmem() {
		return "WEB-INF\\views\\a00_main_mem.jsp";
	}
	
//아이디 찾기
	// http://localhost:4040/find_id
	@GetMapping("find_id")
	public String find_id() {
		return "WEB-INF\\views\\a01_find_id.jsp";
	}
//비밀번호 찾기
	// http://localhost:4040/find_pwd
	@GetMapping("find_pwd")
	public String find_pwd() {
		return "WEB-INF\\views\\a01_find_pwd.jsp";
	}
	


//사용자 등록
	//사용자 처음 폼
	// http://localhost:4040/sign_up
	@GetMapping("sign_up")
	public String sign_up() {
		return "WEB-INF\\views\\a02_sign_up.jsp";
	}

	//사용자 등록 시
	// http://localhost:4040/sign_up_do
		@GetMapping("sign_up_do")
		public String sign_up_do(Users ins, Model d) {
			d.addAttribute("msg", service.insertUser(ins));
			
			return "WEB-INF\\views\\a02_sign_up.jsp";
		}
		
	
	
// 로그인 처음 폼
	// http://localhost:4040/signinFrm
	@GetMapping("signinFrm")
	public String sign_in() {
		return "WEB-INF\\views\\a02_sign_in.jsp";
	}
	@PostMapping("signin")
	   public String login(Users login, Model d, HttpServletRequest request) {
	       int loginCk = service.loginCk(login);
	       if (loginCk > 0) {
	           Users user = service.login(login);
	           HttpSession session = request.getSession(true); // 세션 생성
	           session.setAttribute("user_id", user.getUser_id());
	           session.setAttribute("user_name", user.getUser_name());
	           session.setAttribute("role_code", user.getRole_code());
	           // 권한에 따라 리다이렉트
	           System.out.println("Role code:" + user.getRole_code());

	           String role_code = user.getRole_code();
	           if ("C".equals(role_code)) {
	               return "maincom"; // 회사 페이지
	           } else if ("P".equals(role_code)) {
	               return "mainpmFrm"; // PM 페이지
	           } else {
	               return "mainmemFrm"; // 일반 사용자 페이지
	           }
	       } else {
	           d.addAttribute("errorMessage", "일치하는 회원이 없습니다");
	          
	       }

	       return "WEB-INF\\views\\a02_sign_in.jsp"; // 로그인 페이지

	   }
//	
//	   @PostMapping("signout")
//	   public String logout(HttpServletRequest request, HttpServletResponse response) {
//	       HttpSession session = request.getSession(false); // 세션이 존재하면 가져옴, 없으면 null 반환
//	       if (session != null) {
//	           session.invalidate(); // 세션 무효화
//	       }
//	       return "signinFrm"; // 로그인 페이지로
//	   }
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
//	// http://localhost:4040/logout
//		@PostMapping("logout")
//		public String logout() {
//			return "WEB-INF\\views\\a02_logout.jsp";
//		}
	
	// 채팅
	//채팅 조회
	// http://localhost:4040/chatmemListstart
	@RequestMapping("chatmemListstart")
	public String memList() {
		return "WEB-INF\\views\\a02_chat.jsp";
	}
	// 채팅 검색
	// http://localhost:4040/chatmemlist
	@RequestMapping("chatmemlist")
	public String memList(ChatSch sch, Model d) {
		d.addAttribute("sch", service.getmemList(sch));
		return "jasonView";
	}
	

}
