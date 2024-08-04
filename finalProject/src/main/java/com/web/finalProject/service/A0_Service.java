package com.web.finalProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.Dao;
import com.web.finalProject.vo.Chat;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.Users;

@Service
public class A0_Service {
	@Autowired(required=false)
	private Dao dao;

	// 회원가입
	public String insertUser(Users ins) {
		String msg=null;
		msg = dao.insertUser(ins)>0?"등록 성공":"등록 실패";
		return msg;
	}
	
	// 로그인
	public int loginCk(Users user) {
		return dao.loginCk(user); 
	} 
	public String loginCkMsg(Users user) {
		return dao.loginCk(user)>0?"로그인 성공":"로그인 정보가 일치하지 않습니다"; 
	}
	public Users login(Users user) {
		return dao.login(user);
	}
	
	// 아이디 찾기
	public String find_id(Users user) {
		String id = dao.find_id(user);		
		return id==null?"해당 계정 정보 없습니다.":id;
	}
	
	// 프로젝트 생성
	public String insertProject(Project ins) {
	   	return dao.insertProject(ins)>0?"생성 완료":"생성 실패";
	}
	
	// 팀 생성
	public List<Users> getTeam(String project_id){
	   	return dao.getTeam(project_id);
	}
	
	// 프로젝트 리스트
	public List<Project> getProjectList(String user_id){
    	return dao.getProjectList(user_id);
    }
		
	// 간트 리스트
	public List<GanttTask> getGantt(String project_id){
    	return dao.getGantt(project_id);
    }
    
	//채팅 리스트
	public List<Chat> getmemList(Chat sch){
		//if(sch.getProject_id()==null) sch.setProject_id("");
		return dao.getMemList(sch);
	}
		
		
   
    
   
    
    
	
}
