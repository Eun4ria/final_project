package com.web.finalProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.A01_FullCalendarDao;
import com.web.finalProject.vo.Calendar;


@Service
public class A01_FullCalendarService {
	
	@Autowired(required = false)
	private A01_FullCalendarDao dao;
	
	public List<Calendar> getCalendarList(){
		return dao.getCalendarList();
	}
	
	public String insertCalendar(Calendar ins) {
		return dao.insertCalendar(ins)>0?"등록 성공":"등록 실패";
	}
	
	public String updateCalendar(Calendar upt) {
		return dao.updateCalendar(upt)>0?"수정 성공":"수정 실패";
	}
	
	public String deleteCalendar(int id) {
		return dao.deleteCalendar(id)>0?"삭제 성공":"삭제 실패";
	}	

		
	
}
