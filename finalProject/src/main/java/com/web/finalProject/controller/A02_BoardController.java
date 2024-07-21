package com.web.finalProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.finalProject.service.A02_BoardService2;
import com.web.finalProject.vo.Board;

@Controller
public class A02_BoardController {
	@Autowired(required = false)
	private A02_BoardService2 service;
	
	// http://localhost:4040/main_pm
		@GetMapping("main_pm")
		public String main_pm() {
			return "WEB-INF\\views\\a00_main_pm.jsp";
		}
	
	// http://localhost:4040/test22
	@GetMapping("test22")
	public String start() {
		return "WEB-INF\\views\\a00_test.jsp";
	}
	
	// http://localhost:4040/List02
	@GetMapping("List02")
	public String boardList(Board sch, Model d) {
		d.addAttribute("blist", service.getBoardList(sch));
		return "WEB-INF\\views\\a02_boardList.jsp";
	}
	
}
