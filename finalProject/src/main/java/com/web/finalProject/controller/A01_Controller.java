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
import com.web.finalProject.vo.Calendar;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.Users;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class A01_Controller {
	
	@Autowired(required=false)
	private A01_Service service;
	
	/*	
	// http://localhost:4040/main
	@GetMapping("main")
    public String main(@RequestParam(name="user_id", defaultValue="P_0012") String user_id,
    		HttpServletRequest request, Model d) {
		d.addAttribute("pro", service.getProjectList(user_id));
        d.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a00_main_pm.jsp";
    }
	*/
	// http://localhost:4040/main	
	@GetMapping("main")
	public String main(HttpServletRequest request, Model d) {
	    // 세션에서 user_id 값을 가져옵니다.
	    HttpSession session = request.getSession(false); // false를 사용하여 기존 세션이 없으면 새로 생성하지 않도록 합니다.
        String user_id = (String) session.getAttribute("user_id");

            d.addAttribute("pro", service.getProjectList(user_id));
            d.addAttribute("currentUrl", request.getRequestURI());
            return "WEB-INF\\views\\a00_main.jsp";
	}
	
	// http://localhost:4040/mainSide
	@GetMapping("mainSide")
    public String chart() {
        return "WEB-INF\\views\\a00_main_side.jsp";
    }
	
	// http://localhost:4040/chart
	@GetMapping("chart")
    public String chart(HttpServletRequest request, Model d) {
		d.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a02_chart.jsp";
    }
   
	// http://localhost:4040/board
	@GetMapping("board")
    public String board(HttpServletRequest request, Model d) {
		d.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a02_board.jsp";
    }
	  
	
	
	// 로그인 아이디 찾기 폼 
	// http://localhost:4040/find_id
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
 	// http://localhost:4040/find_id_result
 	@PostMapping("find_id_result")
 	public String find_id_result(Users user, Model d) { 
 		d.addAttribute("result", service.find_id(user));
 		return "WEB-INF\\views\\a01_find_id_result.jsp"; 
 	}    
 	
		
	// 간트 페이지
	// http://localhost:4040/gantt
	@GetMapping("gantt")
	public String gantt(HttpServletRequest request, Model d, Users user) {	
		d.addAttribute("currentUrl", request.getRequestURI());
		return "WEB-INF\\views\\a01_ganttChart.jsp";
	}
	// 간트 조회
	// http://localhost:4040/ganttList?project_id=PRO_0001
	@RequestMapping("ganttList")
	public ResponseEntity<?> getGantt(HttpServletRequest request, Model d) {
		
		HttpSession session = request.getSession(false); 
        String project_id = (String) session.getAttribute("project_id");  
        
		System.out.println("project_id:"+project_id);
		return ResponseEntity.ok(new Gantt(
					service.getGantt(project_id),
					service.getTeam(project_id)));
	}	
	@PostMapping("insertGantt")
	public ResponseEntity<?> insertGantt(GanttTask ins) {
		System.out.println("생성된 task명:"+ins.getText());
		System.out.println("getParent:"+ins.getParent());
		return ResponseEntity.ok(new TaskList(
				service.insertGantt(ins),
				service.getGantt(ins.getProject_id())));
	}
	@PostMapping("updateGantt")
	public ResponseEntity<?> updateGantt(GanttTask upt) {
		System.out.println("수정할 task명:"+upt.getText());
		return ResponseEntity.ok(new TaskList(
				service.updateGantt(upt),
				service.getGantt(upt.getProject_id())));
	}
	@PostMapping("deleteGantt")
	public ResponseEntity<?> deleteGantt(@RequestParam("id") String task_id) {
		System.out.println("삭제할 task id:"+task_id);
		return ResponseEntity.ok(new TaskList(
				service.deleteGantt(task_id),
				service.getGantt(task_id)));
	}
	
	
	
	
	// 프로젝트 생성
	@PostMapping("insertProject")
	public String insertProject(Project ins, Model d){
		d.addAttribute("msg", service.insertProject(ins));
		return "WEB-INF\\views\\a00_main.jsp";
	}	
	// 프로젝트 생성 시 팀원선택 드롭메뉴에 들어갈 전체 유저 리스트
	// http://localhost:4040/getUsers
	@GetMapping("getUsers")
	public String getUsers(Model d) {
		d.addAttribute("user", service.getUsers());
	    return "WEB-INF\\views\\a00_main.jsp";
	}  
    
	//비밀번호 찾기
    // http://localhost:4040/find_pwd
    @GetMapping("find_pwd")
    public String find_pwd() {
        return "WEB-INF\\views\\a01_find_pwd.jsp";
    }
    @PostMapping("find_pwd")
    public String findPassword(Users user, @RequestParam("email") String email,
    		Model d) {
        String result = service.find_pwd(user);
        if ("해당 계정 정보 없습니다".equals(result)) { // 계정 정보가 없는 경우
        	d.addAttribute("msg", result);
        } else {
        	 d.addAttribute("msg",service.makeTempPwd(user));
        }
        return "WEB-INF\\views\\a01_find_pwd.jsp";
    }
    
    
    // 캘린더
    // http://localhost:4040/fullcalendar
 	@GetMapping("fullcalendar")
	public String fullcalendar(HttpServletRequest request, Model d) {	        
		d.addAttribute("currentUrl", request.getRequestURI());
	    return "WEB-INF\\views\\a01_fullcalendar.jsp";
	}

 	// http://localhost:3030/calList 
 	@PostMapping("calList")
 	public ResponseEntity<List<Calendar>> getCalList(HttpServletRequest request){
 		HttpSession session = request.getSession(false); 
        String project_id = (String) session.getAttribute("project_id");  
 		return ResponseEntity.ok(service.getCalendarList(project_id));
 	}


 	// http://localhost:4040/profile
    @GetMapping("profile")
    public String profile(HttpServletRequest request, Model d) {    
	    HttpSession session = request.getSession(false); 
        String user_id = (String) session.getAttribute("user_id");        
        System.out.println("프로필 user_id:"+user_id);        
        d.addAttribute("currentUrl", request.getRequestURI());
        d.addAttribute("profile", service.getProfile(user_id));
        return "WEB-INF\\views\\a01_profile.jsp";
    }
    @PostMapping("updateProfile")
    public String updateProfil(Users upt, Model d) {
    	d.addAttribute("msg", service.updateProfile(upt));
    	d.addAttribute("profile", service.getProfile(upt.getUser_id()));
    	return "WEB-INF\\views\\a01_profile.jsp";
    }
    
    
    
    
    
	
}
class Gantt{
	private List<GanttTask> ganttList;
	private List<Users> resource;
	public Gantt() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Gantt(List<GanttTask> ganttList, List<Users> resource) {
		super();
		this.ganttList = ganttList;
		this.resource = resource;
	}
	public List<GanttTask> getGanttList() {
		return ganttList;
	}
	public void setGanttList(List<GanttTask> ganttList) {
		this.ganttList = ganttList;
	}
	public List<Users> getResource() {
		return resource;
	}
	public void setResource(List<Users> resource) {
		this.resource = resource;
	}
	
}
class TaskList{
	private String msg;
	private List<GanttTask> ganttList;
	public TaskList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TaskList(String msg, List<GanttTask> ganttList) {
		super();
		this.msg = msg;
		this.ganttList = ganttList;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<GanttTask> getGanttList() {
		return ganttList;
	}
	public void setGanttList(List<GanttTask> ganttList) {
		this.ganttList = ganttList;
	}
	
}

class CalList{
	private String msg;
	private List<Calendar> calList;
	public CalList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CalList(String msg, List<Calendar> calList) {
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
