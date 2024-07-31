package com.web.finalProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.finalProject.service.A01_FullCalendarService;
import com.web.finalProject.vo.Calendar;


@Controller
public class A01_FullCalendarController {
	@Autowired(required = false)
	private A01_FullCalendarService service;
	
	// http://localhost:3030/calendar  
	// a06_fullcalendarList.jsp
	@GetMapping("calendar")
	public String calendar() {
		return "WEB-INF\\views\\a06_fullcalendarList.jsp";
	}
	// http://localhost:5050/calList 
	@GetMapping("calList")
	public ResponseEntity<List<Calendar>> getCalList(){
	
		return ResponseEntity.ok(service.getCalendarList());
	}
	@PostMapping("insertCalendar")
	public ResponseEntity<?> insertCalendar(Calendar ins){
		
		//MsgList ml = new MsgList( service.insertCalendar(ins), service.getCalendarList());
		// {"msg":"등록성공","calList":[{},{}....]}
		return ResponseEntity.ok(
				new MsgList( service.insertCalendar(ins), 
						     service.getCalendarList()));
		// new MsgList( "등록성공", List<Calendar>)  메시지와 캘린더리스트
	}
	@PostMapping("updateCalendar")
	public ResponseEntity<?> updateCalendar(Calendar upt){

		return ResponseEntity.ok(
				new MsgList( service.updateCalendar(upt), 
						     service.getCalendarList()));
	}	
	@PostMapping("deleteCalendar")
	public ResponseEntity<?> deleteCalendar(@RequestParam("id") int id){
		return ResponseEntity.ok(
				new MsgList( service.deleteCalendar(id), 
						     service.getCalendarList()));
	}	
	
}
class MsgList{
	private String msg;
	private List<Calendar> calList;
	public MsgList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MsgList(String msg, List<Calendar> calList) {
		super();
		this.msg = msg;
		this.calList = calList;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<Calendar> getCalList() {
		return calList;
	}
	public void setCalList(List<Calendar> calList) {
		this.calList = calList;
	}
	
}








