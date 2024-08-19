package com.web.finalProject.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.LocaleResolver;

import com.web.finalProject.service.A01_Service;
import com.web.finalProject.vo.Calendar;
import com.web.finalProject.vo.Gantt;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.UserSch;
import com.web.finalProject.vo.Users;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
 	
		
	// 간트 페이지
	// http://localhost:4040/gantt
	@GetMapping("gantt")
	public String gantt(HttpServletRequest request, Model d, Users user) {	
		d.addAttribute("currentUrl", request.getRequestURI());
		return "WEB-INF\\views\\a01_ganttChart.jsp";
	}
	// 간트 조회
	// http://localhost:4040/ganttList?project_id=PRO_0003
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
		System.out.println("수정할 task_id: " + upt.getId());
	    System.out.println("수정할 task명: " + upt.getText());
	    System.out.println("수정할 글자색상: " + upt.getTextcolor());
	    System.out.println("수정할 배경색상: " + upt.getColor());
	    return ResponseEntity.ok(new TaskList(
	            service.updateGantt(upt), 
	            service.getGantt(upt.getProject_id())));
	}
	@PostMapping("deleteGantt")
	public ResponseEntity<?> deleteGantt(@RequestParam("id") String task_id,HttpServletRequest request) {
		System.out.println("삭제할 task id:"+task_id);
		HttpSession session = request.getSession(false); 
		String project_id = (String) session.getAttribute("project_id"); 
		return ResponseEntity.ok(new TaskList(
				service.deleteGantt(task_id),
				service.getGantt(project_id)));
	}
	
	
	
	
	// 프로젝트 생성
	@PostMapping("insertProject")
	public String insertProject(HttpServletRequest request, Project ins,
			Model d) {
	    HttpSession session = request.getSession(false); 
	    String user_id = (String) session.getAttribute("user_id"); 
	    ins.setUser_id(user_id);
	    
	    String isIns = service.insertProject(ins);
	    if("프로젝트 생성".equals(isIns)) {
	        d.addAttribute("msg",
	        		service.insertProjectPM(ins.getProject_id(), user_id));
	    }
	    System.out.println("생성된 프로젝트 아이디:" + ins.getProject_id());
	    return "redirect:main";
	}
	
	// http://localhost:4040/HR
    // 자원관리-인적자원 관리 페이지
    @RequestMapping("HR")
    public String HR(@ModelAttribute("sch") UserSch sch, 
    		HttpServletRequest request, Model d) {
		d.addAttribute("currentUrl", request.getRequestURI());
		d.addAttribute("user", service.getUserList(sch));
		return "WEB-INF\\views\\a01_human_resource.jsp";
    }
    // http://localhost:4040/getUser?user_id=P_0001
    @PostMapping("getUser")
    public ResponseEntity<List<Users>> getUser(@RequestParam("user_id") String user_id, 
    		HttpServletRequest request, Model d) {
    	//d.addAttribute("currentUrl", request.getRequestURI());
    	System.out.println(user_id);
		return ResponseEntity.ok(service.getUser(user_id));
    }
    
	
    
    // 캘린더 페이지
    // http://localhost:4040/fullcalendar
 	@GetMapping("fullcalendar")
	public String fullcalendar( HttpServletRequest request, Model d) {	        
		d.addAttribute("currentUrl", request.getRequestURI());
	    return "WEB-INF\\views\\a01_fullcalendar.jsp";
	}
 	/*
 	// 간트(task) 캘린더
 	// http://localhost:4040/ganttCalList 
 	@PostMapping("ganttCalList")
 	public ResponseEntity<List<Calendar>> getGanttCalList(HttpServletRequest request){
 		HttpSession session = request.getSession(false); 
        String project_id = (String) session.getAttribute("project_id");  
 		return ResponseEntity.ok(service.getGanttCalList(project_id));
 	}
 	// 개인/팀 캘린더
 	@PostMapping("PCalList")
 	public ResponseEntity<List<Calendar>> getPCalList(HttpServletRequest request){
 		HttpSession session = request.getSession(false); 
        String user_id = (String) session.getAttribute("user_id");  
        String project_id = (String) session.getAttribute("project_id");  
 		return ResponseEntity.ok(service.getTCalList(project_id));
 	}
 	*/
 	// http://localhost:4040/calList 
  	@PostMapping("calList")
  	public ResponseEntity<List<Calendar>> getCalList(@RequestParam(name ="sel") List<String> sel,
  			HttpServletRequest request){
  		HttpSession session = request.getSession(false); 
        String user_id = (String) session.getAttribute("user_id");  
        String project_id = (String) session.getAttribute("project_id");  
        
        System.out.println("선택한 보기방식:"+sel);
         
        List<Calendar> calendarList = new ArrayList<>();
        
        if (sel != null && !sel.isEmpty()) {
            for (String s : sel) {
                calendarList.addAll(service.getCalendarList(s, user_id, project_id));
            }
        }

        return ResponseEntity.ok(calendarList);
  	}
  	
  	// 캘린더 등록
  	@PostMapping("insertCalendar")
    public ResponseEntity<?> insertCalendar(@RequestParam(name ="sel", defaultValue="P") List<String> sel,
    		Calendar ins, HttpServletRequest request) {
  		HttpSession session = request.getSession(false); 
        String user_id = (String) session.getAttribute("user_id");  
        String project_id = (String) session.getAttribute("project_id");
        // 세션에 저장되어 있는 user_id와 project_id를 세팅
        ins.setUser_id(user_id);
        ins.setProject_id(project_id);

        List<Calendar> calendarList = new ArrayList<>();        
        if (sel != null && !sel.isEmpty()) {
            for (String s : sel) {
                calendarList.addAll(service.getCalendarList(s, 
                		user_id, project_id));
            }
        }

        return ResponseEntity.ok(new CalList(
        		service.insertCalendar(ins), calendarList));
    }

    @PostMapping("updateCalendar")
    public ResponseEntity<?> updateCalendar(@RequestParam(name ="sel", defaultValue="P") List<String> sel,
    		Calendar upt, HttpServletRequest request) {
  		HttpSession session = request.getSession(false); 
        String user_id = (String) session.getAttribute("user_id");  
        String project_id = (String) session.getAttribute("project_id");
        // 세션에 저장되어 있는 user_id 세팅
        upt.setUser_id(user_id);

        List<Calendar> calendarList = new ArrayList<>();        
        if (sel != null && !sel.isEmpty()) {
            for (String s : sel) {
                calendarList.addAll(service.getCalendarList(s,
                		user_id, project_id));
            }
        }

        return ResponseEntity.ok(new CalList(
        		service.updateCalendar(upt), calendarList));
    }

    @PostMapping("deleteCalendar")
    public ResponseEntity<?> deleteCalendar(@RequestParam(name ="sel", defaultValue="P") List<String> sel,
    		@RequestParam("id") String id, HttpServletRequest request) {
    	
    	HttpSession session = request.getSession(false); 
    	String user_id = (String) session.getAttribute("user_id");  
        String project_id = (String) session.getAttribute("project_id");

        List<Calendar> calendarList = new ArrayList<>();        
        if (sel != null && !sel.isEmpty()) {
            for (String s : sel) {
                calendarList.addAll(service.getCalendarList(s,
                		user_id, project_id));
            }
        }

        return ResponseEntity.ok(new CalList(
        		service.deleteCalendar(id, user_id), calendarList));
    }

 	
    
    private final LocaleResolver localeResolver;

    public A01_Controller(LocaleResolver localeResolver) {
        this.localeResolver = localeResolver;
    }
    /*
     *다국어 처리
    // http://localhost:4040/changeLang
    @GetMapping("changeLang")
    public String changeLang(@RequestParam(value = "lang", required = false) String lang, HttpServletRequest request, HttpServletResponse response) {
        if (lang != null) {
            Locale locale;
            switch (lang) {
                case "ko":
                    locale = new Locale("ko");
                    break;
                case "en":
                    locale = new Locale("en");
                    break;
                case "fa":
                    locale = new Locale("fa");
                    break;
                default:
                    locale = Locale.ENGLISH;
            }
            localeResolver.setLocale(request, response, locale);
        }
        return "redirect:profile";
    }
    */
    // http://localhost:4040/profile
    @GetMapping("profile")
    public String profile(@RequestParam(value = "lang", defaultValue="en", required = false) String lang, HttpServletRequest request, Model d, HttpServletResponse response) {    
	    HttpSession session = request.getSession(false); 
        String user_id = (String) session.getAttribute("user_id");        
        System.out.println("프로필 user_id:"+user_id);        
        d.addAttribute("currentUrl", request.getRequestURI());
        // 다국어 처리
        if (lang != null) {
            Locale locale;
            switch (lang) {
                case "ko":
                    locale = new Locale("ko");
                    break;
                case "en":
                    locale = new Locale("en");
                    break;
                case "fa":
                    locale = new Locale("fa");
                    break;
                default:
                    locale = Locale.ENGLISH;
            }
            localeResolver.setLocale(request, response, locale);
        }        
        
        // 유저의 프로필 정보
        d.addAttribute("profile", service.getProfile(user_id));
        // 활동중인 프로젝트 리스트
        d.addAttribute("pro", service.getProjectList(user_id));
        // 완료된 프로젝트 리스트
        d.addAttribute("cpro", service.getComProjectList(user_id));        
        return "WEB-INF\\views\\a01_profile.jsp";
    }
    
    @PostMapping("updateProfile")
    public String updateProfileWithFile(HttpServletRequest request, MultipartFile file, Users user, Model model) {
    	HttpSession session = request.getSession(false); 
    	String user_id = (String) session.getAttribute("user_id"); 
    	// 프로필 업데이트 및 파일 저장
    	user.setUser_id(user_id);
        String msg = service.updateProfileWithFile(file, user);

        // 결과 메시지와 프로필 정보를 모델에 추가
        model.addAttribute("msg", msg);
        model.addAttribute("profile", service.getProfile(user.getUser_id()));

        return "WEB-INF/views/profile.jsp"; // 결과를 보여줄 JSP 페이지
    }
    
    
    // 비밀번호 변경 페이지
    // http://localhost:4040/changePassword
    @GetMapping("changePassword")
    public String changePasswordFrm(Model d) {
    	d.addAttribute("currentUrl", "/profile");
    	return "WEB-INF\\views\\a01_changePwd.jsp";
    }
    @PostMapping("changePassword")
    public String changePassword(Users cpw, Model d) {
    	d.addAttribute("currentUrl", "/profile");
    	
    	int checkPwd= service.checkOldPwd(cpw);
    	if(checkPwd>0) {
    		d.addAttribute("msg", service.changePassword(cpw));
    	}else {
    		d.addAttribute("msg", "회원 정보를 다시 입력해주세요");
    	}
    	return "WEB-INF\\views\\a01_changePwd.jsp";
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