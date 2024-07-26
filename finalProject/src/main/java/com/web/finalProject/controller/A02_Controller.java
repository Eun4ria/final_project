package com.web.finalProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.finalProject.service.A02_Service;
import com.web.finalProject.vo.Users;

@Controller
public class A02_Controller {
	
	@Autowired(required=false)
	private A02_Service service;
	
	
	// http://localhost:4040/mainpm
	@GetMapping("mainpm")
	public String mainpm() {
		return "WEB-INF\\views\\a00_main_pm.jsp";
	}
	// http://localhost:4040/mainmem
	@GetMapping("mainmem")
	public String mainmem() {
		return "WEB-INF\\views\\a00_main.jsp";
	}
	// http://localhost:4040/test22
	@GetMapping("test22")
	public String start() {
		return "WEB-INF\\views\\a01_find_id.jsp";
	}
	// http://localhost:4040/find_pwd
	@GetMapping("find_id")
	public String find_id() {
		return "WEB-INF\\views\\a01_find_id.jsp";
	}
	// http://localhost:4040/find_pwd
	@GetMapping("find_pwd")
	public String find_pwd() {
		return "WEB-INF\\views\\a01_find_pwd.jsp";
	}
	
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
	// http://localhost:4040/sign_in
	@GetMapping("sign_in")
	public String sign_in() {
		return "WEB-INF\\views\\a02_sign_in.jsp";
	}
	
	

}
