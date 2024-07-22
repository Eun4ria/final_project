package com.web.finalProject.controller;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.finalProject.service.A01_CalendarService;

@Controller
public class A01_FullCalController {
	@Autowired(required = false)
	private A01_CalendarService service;
	// cmd 창..
	// 
	// http://223.26.198.130:4040/calendar
	@GetMapping("calendar")
	public String calendar() {
		return "WEB-INF\\views\\a01_fullcalendar.jsp";
	}
	// http://localhost:7080/springweb/callList.do
	@GetMapping("callList.do")
	public String callList(Model d) {
		d.addAttribute("calList", service.getFullCalendarList());
		return "jsonView";
	}
	// // http://localhost:7080/springweb/insertCalendar.do
	@PostMapping("insertCalendar.do")
	public String insertCalendar(Calendar insert, Model d) {
		d.addAttribute("msg", service.insertCalendar(insert));
		d.addAttribute("calList", service.getFullCalendarList());
		return "jsonView";
	}
	@PostMapping("updateCalendar.do")
	public String updateCalendar(Calendar update, Model d) {
		d.addAttribute("msg", service.updateCalendar(update));
		d.addAttribute("calList", service.getFullCalendarList());
		return "jsonView";
	}
	@PostMapping("deleteCalendar.do")
	public String deleteCalendar(@RequestParam("id") int id, Model d) {
		d.addAttribute("msg", service.deleteCalendar(id));
		d.addAttribute("calList", service.getFullCalendarList());
		return "jsonView";
	}	
	
}
