package com.web.finalProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.finalProject.service.A02_BoardService2;
import com.web.finalProject.vo.Board;

@Controller
public class A02_BoardController {
	@Autowired(required = false)
	private A02_BoardService2 service;
	
	
	// http://localhost:4040/mainpm
	@GetMapping("mainpm")
	public String mainpm() {
		return "WEB-INF\\views\\a00_main_pm.jsp";
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
	// http://localhost:4040/sign_up
	@GetMapping("sign_up")
	public String sign_up() {
		return "WEB-INF\\views\\a02_sign_up.jsp";
	}
	// http://localhost:4040/sign_in
	@GetMapping("sign_in")
	public String sign_in() {
		return "WEB-INF\\views\\a03_sign_in.jsp";
	}
	
	// http://localhost:4040/chat
	@GetMapping("chat")
	public String chat() {
		return "WEB-INF\\views\\a02_chat.jsp";
	}
	
	// http://localhost:4040/List02
	@GetMapping("List02")
	public String boardList(Board sch, Model d) {
		d.addAttribute("blist", service.getBoardList(sch));
		return "WEB-INF\\views\\a02_boardList.jsp";
	}
	
	// http://localhost:4040/test
	@GetMapping("test")
	public String test(Board sch, Model d) {
		d.addAttribute("blist", service.getBoardList(sch));
		return "WEB-INF\\views\\a02_boardList.jsp";
	}
	
}
