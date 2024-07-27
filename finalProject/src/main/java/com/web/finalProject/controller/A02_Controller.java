package com.web.finalProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.finalProject.service.A02_Service;
import com.web.finalProject.vo.Users;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class A02_Controller {
	
	@Autowired(required=false)
	private A02_Service service;
	
//회사메인-프로젝트 만들기	
	// http://localhost:4040/maincom
	@GetMapping("maincom")
	public String maincom() {
		return "WEB-INF\\views\\a00_main_com.jsp";
	}
//PM메인-팀 만들기
	// http://localhost:4040/mainpm
	@GetMapping("mainpm")
	public String mainpm() {
		return "WEB-INF\\views\\a00_main_pm.jsp";
	}
//팀멤버메인-작업위해
	// http://localhost:4040/mainmem
	@GetMapping("mainmem")
	public String mainmem() {
		return "WEB-INF\\views\\a00_main.jsp";
	}

//채팅Frm	
	// http://localhost:4040/chat
		@GetMapping("chat")
		public String chat() {
			return "WEB-INF\\views\\a02_chat.jsp";
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
		
	
	
// 로그인
	// http://localhost:4040/signinFrm
	@RequestMapping("signinFrm")
	public String sign_in() {
		return "WEB-INF\\views\\a02_sign_in.jsp";
	}
	@RequestMapping("signin")
	   public String login(Users login, Model d, HttpServletRequest request) {
	       int loginCk = service.loginCk(login);
	       if (loginCk > 0) {
	           Users user = service.login(login);
	           HttpSession session = request.getSession(true); // 세션 생성
	           session.setAttribute("user_id", user.getUser_id());
	           session.setAttribute("user_name", user.getUser_name());
	           session.setAttribute("role_code", user.getRole_code());
	         
	           return "mainmem";
	       } else {
	           d.addAttribute("msg", service.loginCkMsg(login));
	           return "WEB-INF\\views\\a02_sign_in.jsp";
	       }
	   }
	   @RequestMapping("mainmem")
	   public String mainPage(HttpServletRequest request) {
	       HttpSession session = request.getSession(false);
	       if (session != null && session.getAttribute("user_id") != null) {
	           String role_code = (String) session.getAttribute("role_code");
	           if ("C".equals(role_code)) {
	               return "maincom";
	           } else if ("P".equals(role_code)) {
	               return "mainpm";
	           } else {
	               return "mainmem";
	           } 
	       } else {
	           return "signinFrm";
	       }
	   }
	   @PostMapping("signout")
	   public String logout(HttpServletRequest request, HttpServletResponse response) {
	       HttpSession session = request.getSession(false); // 세션이 존재하면 가져옴, 없으면 null 반환
	       if (session != null) {
	           session.invalidate(); // 세션 무효화
	       }
	       return "signinFrm"; // 로그인 페이지로
	   }
	
	

}
