package com.web.finalProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.finalProject.service.A01_Service;
import com.web.finalProject.util.Util;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.Users;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class A01_Controller {
	
	@Autowired(required=false)
	private A01_Service service;
	
	private Util util;
	
	// http://223.26.198.130:4040/main
	@GetMapping("main")
    public String main(@RequestParam(name="user_id", defaultValue="P_0012") String user_id,
    		HttpServletRequest request, Model d) {
		d.addAttribute("pro", service.getProjectList(user_id));
        d.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a00_main_pm.jsp";
    }
	@GetMapping("mainpmFrm")
	public String main(HttpServletRequest request, Model d) {
	    // 세션에서 user_id 값을 가져옵니다.
	    HttpSession session = request.getSession(false); // false를 사용하여 기존 세션이 없으면 새로 생성하지 않도록 합니다.
        String user_id = (String) session.getAttribute("user_id");

            // user_id를 이용하여 프로젝트 목록을 가져옵니다.
            d.addAttribute("pro", service.getProjectList(user_id));
            d.addAttribute("currentUrl", request.getRequestURI());
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
 	
		
	// 간트 페이지
	// http://223.26.198.130:4040/gantt
	@GetMapping("gantt")
	public String gantt(Users user) {		
		return "WEB-INF\\views\\a01_ganttChart.jsp";
	}
	// 간트 조회
	// http://223.26.198.130:4040/ganttList
	@RequestMapping("ganttList")
	public ResponseEntity<?> getGantt(@RequestParam(value = "project_id", defaultValue = "PRO_0001") String project_id, Model d) {
		System.out.println("project_id:"+project_id);
		return ResponseEntity.ok(new Gantt(
					service.getGantt(project_id),
					service.getTeam(project_id)));
	}
	
	// 팀원 리스트
	// http://223.26.198.130:4040/teamList
	@RequestMapping("teamList")
	public ResponseEntity<List<Users>> getTeamList(@RequestParam(value = "project_id", defaultValue = "PRO_0001") String project_id) {
	    return ResponseEntity.ok(service.getTeam(project_id));
	}
	
	
	// 프로젝트 생성
	@PostMapping("insertProject")
	public String insertProject(Project ins, Model d){
		d.addAttribute("msg", service.insertProject(ins));
		return "WEB-INF\\views\\a00_main_pm.jsp";
	}	
	
	
	
	
	
	
	
	
	// http://223.26.198.130:4040/pages-profile
    @GetMapping("profile")
    public String profile(HttpServletRequest request, Model model) {
        model.addAttribute("currentUrl", request.getRequestURI());
        return "WEB-INF\\views\\a01_profile.jsp";
    }    
    
    // http://223.26.198.130:4040/find_pwd
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
    /*
    @Value("${mailaccount}")
	private String mailaccount;
	
	// controller단에서 사용할 공통적인 모델 데이터를 선언할 때, 활용...
	@ModelAttribute("mailaccount")
	public String getMailAccount() {
		return mailaccount;
	}
	
	// 자동 사원접속정보 발생..
	// http://localhost:4040/tempPwdFrm
	@GetMapping("tempPwdFrm")
	public String tempPwdFrm() {
		return "WEB-INF\\views\\a01_find_pwd.jsp";
	}
	@PostMapping("regEmpTmp.do")
	public String makeTempPwd(Users user, Model d) {
		//mem.getEmpno(), mem.getEmail()
		d.addAttribute("msg", service.makeTempPwd(user));
		return "WEB-INF\\views\\a02_mvc\\a04_regEmpTmpForm.jsp";
	}	
	*/
	
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
