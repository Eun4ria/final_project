package com.web.finalProject.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	
	// http://localhost:4040/main	
	@GetMapping("main")
	public String main(HttpServletRequest request, Model d) {
	    // 세션에서 user_id 값을 가져옵니다.
	    HttpSession session = request.getSession(false);
	    d.addAttribute("currentUrl", request.getRequestURI());
	    if (session == null || session.getAttribute("user_id") == null) {
	         d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
	         return "WEB-INF\\views\\a00_main.jsp";
	     }
	    // 메인으로 이동 시 project 세션 종료
        String project_id = (String) session.getAttribute("project_id");
        String user_id = (String) session.getAttribute("user_id");
        if (project_id != null) {
        	session.removeAttribute("project_id");
        	System.out.println("project 세션 삭제");
        }
        // 메인 활동중인 프로젝트 수
        d.addAttribute("aProCnt", service.activeProjectCnt(user_id));
    	// 메인 완료된 프로젝트 수
        d.addAttribute("cProCnt", service.completeProjectCnt(user_id));
	    // 프로젝트 리스트
        d.addAttribute("pro", service.getProjectList(user_id));
        // 프로젝트 생성 시 사용되는 userList(PM인 본인 빼고 조회)
        d.addAttribute("user", service.getUserProIns(user_id)); 
        // 프로젝트 생성 시 사용되는 companyList
        d.addAttribute("com", service.getComId());
        
        return "WEB-INF\\views\\a00_main.jsp";
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
	 HttpSession session = request.getSession(false); // false를 사용하여 기존 세션이 없으면 새로 생성하지 않도록 합니다
	 // 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
	  if (session == null || session.getAttribute("user_id") == null) {
          // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
          d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
      }		
		d.addAttribute("currentUrl", request.getRequestURI());
		return "WEB-INF\\views\\a01_ganttChart.jsp";
	}
	// 간트 조회
	@PostMapping("ganttList")
	public ResponseEntity<?> getGantt(HttpServletRequest request, Model d) {		
		HttpSession session = request.getSession(false); 
        String project_id = (String) session.getAttribute("project_id");         
		System.out.println("간트 차트 조회 project_id:"+project_id);
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
	
	
	// 프로젝트 생성 및 팀원추가
	@PostMapping("insertProject")
	public String insertProject(HttpServletRequest request, Project ins, Model d) {
	    HttpSession session = request.getSession(false);
	    String user_id = (String) session.getAttribute("user_id");
	    
	    //ins.setUserIds(ins.getUserIds());

	    // Project를 데이터베이스에 저장
	    String isIns = service.insertProject(ins);
	    // 프로젝트 생성 성공 시
	    if ("프로젝트 생성".equals(isIns)) {
	    	// pm할당
	        service.addProjectPM(ins.getProject_id(), user_id);
	        if (ins.getUserIds() != null && !ins.getUserIds().isEmpty()) {
	        	// member할당
	            service.addProjectMem(ins.getProject_id(), ins.getUserIds());
	        }
	    }

	    System.out.println("생성된 프로젝트 아이디:" + ins.getProject_id());
	    System.out.println("추가된 팀원 아이디:"+ins.getUserIds());
	    return "redirect:main";
	}
	/*
	@GetMapping("projectDetail")
	public String projectDetail(){
		
	}
	*/
	
	// 인적자원관리 페이지
    @GetMapping("HR")
    public String HR(HttpServletRequest request, Model d) {
    	 HttpSession session = request.getSession(false); // false를 사용하여 기존 세션이 없으면 새로 생성하지 않도록 합니다.
         
   	 // 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
         if (session == null || session.getAttribute("user_id") == null) {
             // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
             d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
         }
    	
    	d.addAttribute("currentUrl", request.getRequestURI());
		return "WEB-INF\\views\\a01_human_resource.jsp";
    }
    // 페이징 처리, 전체 사용자 리스트
    @PostMapping("HR")
    public ResponseEntity<pageUserList> HR(@RequestBody UserSch sch) {
        List<Users> userList = service.getUserList(sch);
        pageUserList response = new pageUserList(userList, sch);
        System.out.println("검색어:" + sch.getSch());
        System.out.println("검색결과 출력 갯수:" + sch.getCount());
        return ResponseEntity.ok(response);
    }
    // 사용자 디테일
    @PostMapping("getUser")
    public ResponseEntity<Users> getUser(@RequestParam("user_id") String user_id) {
    	System.out.println("사용자 디테일:"+user_id);
		return ResponseEntity.ok(service.getUser(user_id));
    }
    // 사용자 정보 수정
    @PostMapping("updateUser")
    public ResponseEntity<String> updateUser(@RequestBody Users upt) {
    	System.out.println(upt.getUser_id()+"의 수정 결과:"+service.updateUser(upt));
    	return ResponseEntity.ok(service.updateUser(upt));
    }
    // 사용자 삭제
    @PostMapping("deleteUser")
    public ResponseEntity<String> deleteUser(@RequestParam("user_id") String user_id) {
    	System.out.println(user_id+"의 삭제 결과:"+service.deleteUser(user_id));
    	return ResponseEntity.ok(service.deleteUser(user_id));
    }
    
    
    // 팀원 수정 및 삭제
    
    
    
    
	
    
    
    // 캘린더 페이지
    // http://localhost:4040/fullcalendar
 	@GetMapping("fullcalendar")
	public String fullcalendar( HttpServletRequest request, Model d) {	
		HttpSession session = request.getSession(false); // false를 사용하여 기존 세션이 없으면 새로 생성하지 않도록 합니다
		 // 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
	    if (session == null || session.getAttribute("user_id") == null) {
	         // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
	        d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
	    }
 		    
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
  	public ResponseEntity<List<Calendar>> getCalList(
  			@RequestParam(name ="sel", defaultValue="") List<String> sel,
  			HttpServletRequest request){
  		HttpSession session = request.getSession(false); 
        String user_id = (String) session.getAttribute("user_id");  
        String project_id = (String) session.getAttribute("project_id");         
        System.out.println("calendar 선택보기:"+sel);
         
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
        
        if (project_id == null || project_id =="") {
            ins.setProject_id("");
        }

        return ResponseEntity.ok(new CalList(
        		service.insertCalendar(ins), calendarList));
    }
  	// 캘린더 수정
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
    // 캘린더 삭제
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

 	
    // 다국어 처리
    private final LocaleResolver localeResolver;

    public A01_Controller(LocaleResolver localeResolver) {
        this.localeResolver = localeResolver;
    }
    // http://localhost:4040/profile
    @GetMapping("profile")
    public String profile(@RequestParam(value = "lang", defaultValue="en", required = false)
    	String lang, HttpServletRequest request, Model d,
    	HttpServletResponse response) {  
    	
	    HttpSession session = request.getSession(false); 
	    
	    if (session == null || session.getAttribute("user_id") == null) {
	         d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
	         return "WEB-INF\\views\\a01_profile.jsp";
	    }
        
        String user_id = (String) session.getAttribute("user_id");        
        System.out.println("프로필 user_id:"+user_id);        
        d.addAttribute("currentUrl", request.getRequestURI());
       
        
        // 다국어 처리
        if (lang != null) {
            Locale locale;
            switch (lang) {
                case "ko":
                    locale = new Locale.Builder().setLanguage("ko").build();
                    break;
                case "en":
                    locale = new Locale.Builder().setLanguage("en").build();
                    break;
                case "fa":
                    locale = new Locale.Builder().setLanguage("fa").build();
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
    // 프로필 수정
    @PostMapping("profile")
    public String updateProfileWithFile(Users user, Model d, HttpServletRequest request) {     	
        String msg = service.updateProfileWithFile(user.getImageFname(), user);
        if(msg=="이미지 포함 수정 성공") {
        	HttpSession session = request.getSession(true);
        	session.setAttribute("image", user.getImage());
        }
        System.out.println(msg);
        d.addAttribute("msg", msg);
        d.addAttribute("profile", service.getProfile(user.getUser_id()));
        System.out.println(msg);
        return "redirect:profile";
    }
    
    // 프로젝트 상세
    @GetMapping("projectDetail")
    public String projectDetail(@RequestParam("project_id") String project_id, Model d) {
    	d.addAttribute("pro", service.getProject(project_id));
    	return "WEB-INF\\views\\a01_project_detail.jsp";
    }
    // 프로젝트 정보 수정
    @PostMapping("updateProject")
    public String updateProject(Project upt, Model d) {
    	d.addAttribute("msg", service.updateProject(upt));
    	return "redirect:projectDetail?project_id="+upt.getProject_id();
    }
    // 프로젝트 삭제
    @PostMapping("deleteProject")
    public String deleteProject(@RequestParam("project_id") String project_id, Model d) {
    	d.addAttribute("msg", service.deleteProject(project_id));
    	return "WEB-INF\\views\\a01_project_detail.jsp";
    }
    
    
    // 비밀번호 변경 페이지
    // http://localhost:4040/changePassword
    @GetMapping("changePassword")
    public String changePasswordFrm(HttpServletRequest request, Model d) {
    	HttpSession session = request.getSession(false);
    	// 세션이 null이거나 세션에서 사용자 ID를 찾을 수 없는 경우
    	if (session == null || session.getAttribute("user_id") == null) {
            // 세션이 없을 때 알림 메시지를 포함하여 로그인 폼으로 리다이렉트
            d.addAttribute("alertMessage", "로그인이 필요한 서비스입니다.");
        }
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




class pageUserList{
	private List<Users> userList;
	private UserSch sch;
	public pageUserList(List<Users> userList, UserSch sch) {
		super();
		this.userList = userList;
		this.sch = sch;
	}
	public List<Users> getUserList() {
		return userList;
	}
	public void setUserList(List<Users> userList) {
		this.userList = userList;
	}
	public UserSch getSch() {
		return sch;
	}
	public void setSch(UserSch sch) {
		this.sch = sch;
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