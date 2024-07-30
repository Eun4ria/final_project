package com.web.finalProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.finalProject.service.A01_Service;
import com.web.finalProject.util.Util;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Users;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class A01_Controller {
	
	@Autowired(required=false)
	private A01_Service service;
	
	private Util util;
	
	// http://223.26.198.130:4040/main
	@GetMapping("main")
    public String main(HttpServletRequest request, Model model) {
        model.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a00_main_pm.jsp";
    }
	// http://223.26.198.130:4040/sideBar
	@RequestMapping("sideBar")
	public String sideBar() {
		return "WEB-INF\\views\\a00_sideBar.jsp";
	}
	// http://223.26.198.130:4040/chart
	@GetMapping("chart")
    public String chart() {
        return "WEB-INF\\views\\a02_chart.jsp";
    }
	// http://223.26.198.130:4040/ganttChart
	@GetMapping("ganttChart")
    public String ganttChart() {
        return "WEB-INF\\views\\a01_ganttChart.jsp";
    }
	// http://223.26.198.130:4040/fullcalendar
	@GetMapping("fullcalendar")
    public String fullcalendar() {
        return "WEB-INF\\views\\a01_fullcalendar.jsp";
    }
	// http://223.26.198.130:4040/board
	@GetMapping("board")
    public String board() {
        return "WEB-INF\\views\\a02_board.jsp";
    }
	
	
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
	
	
	// http://223.26.198.130:4040/gantt
	@GetMapping("gantt")
	public String gantt(Users user) {		
		return "WEB-INF\\views\\a01_ganttChart.jsp";
	}
	// http://223.26.198.130:4040/ganttList
	@RequestMapping("ganttList")
	public ResponseEntity<List<GanttTask>> getGantt(@RequestParam(value = "project_id", defaultValue = "PRO_0001") String project_id) {
	    return ResponseEntity.ok(service.getGantt(project_id));
	}
	// http://223.26.198.130:4040/userList
	@RequestMapping("userList")
	public ResponseEntity<List<Users>> getUserList(@RequestParam(value = "project_id", defaultValue = "PRO_0001") String project_id) {
	    return ResponseEntity.ok(service.getUser(project_id));
	}
	

	
	
	
	// http://223.26.198.130:4040/pages-profile
    @GetMapping("profile")
    public String profile(HttpServletRequest request, Model model) {
        model.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a01_profile.jsp";
    }
    @GetMapping("sign-in")
    public String signIn(HttpServletRequest request, Model model) {
        model.addAttribute("currentUrl", request.getRequestURI());
        return "adminkit/pages-sign-in";
    }

    @GetMapping("sign-up")
    public String signUp(HttpServletRequest request, Model model) {
        model.addAttribute("currentUrl", request.getRequestURI());
        return "adminkit/pages-sign-up";
    }

	

}
