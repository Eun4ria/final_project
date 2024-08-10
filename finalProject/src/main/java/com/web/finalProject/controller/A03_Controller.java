package com.web.finalProject.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.finalProject.service.A03_Service;
import com.web.finalProject.vo.Tasks;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class A03_Controller {
	@Autowired(required=false)
	private A03_Service service;
	// todo list
	// http://localhost:4040/todoFrm
		@GetMapping("todoFrm")
		public String getTasksList(Tasks sch, Model d, HttpServletRequest request) {
			HttpSession session = request.getSession(); 
			String project_id = (String) session.getAttribute("project_id");
			String user_id = (String) session.getAttribute("user_id");
			
			session.setAttribute("project_id", project_id);
			session.setAttribute("user_id", user_id);
			
			System.out.println(project_id);
			System.out.println(user_id);
			
			// Chat 객체에 project_id와 user_id를 설정
			sch.setProject_id(project_id);
			sch.setUser_id(user_id); // user_id는 요청 파라미터로 전달된 값
			    
		    // 회원 리스트를 가져온다.
		    List<Tasks> tasks = service.getTaskList(sch);
		    
		    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		    // 날짜를 문자열로 변환
		    for (Tasks task : tasks) {
		    	 if (task.getEnd_date() != null) {
		             String endDateFormatted = dateFormat.format(task.getEnd_date());
		             task.setEndDateFormatted(endDateFormatted);
		            // System.out.println(endDateFormatted);
		         }
	          
		    }
			    
		    // 모델에 데이터 추가
		    d.addAttribute("tasklist", tasks);
		    System.out.println("tasklist:" + tasks);

			
			return "WEB-INF\\views\\a02_todo.jsp";
		}
}
