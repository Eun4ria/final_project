package com.web.finalProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.finalProject.service.A01_Service;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class A01_Controller {

	@Autowired(required=false)
	private A01_Service service;
	
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
        return "WEB-INF\\views\\a01_chart.jsp";
    }
	// http://223.26.198.130:4040/ganttChart
	@GetMapping("ganttChart")
    public String ganttChart() {
        return "WEB-INF\\views\\a01_chart.jsp";
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
