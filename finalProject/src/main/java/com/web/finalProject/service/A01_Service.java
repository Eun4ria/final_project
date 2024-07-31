package com.web.finalProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.A01_Dao;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.Users;

@Service
public class A01_Service {
	@Autowired(required=false)
	private A01_Dao dao;
	
	public String find_id(Users user) {
		String id = dao.find_id(user);		
		return id==null?"해당 계정 정보 없습니다.":id;
	}
	/*
	public String updatePassword(Users user, String tempPwd) {
        user.setPassword(tempPwd);
       return dao.tempPwd(user)>0?"임시 비밀번호 이메일 발송":"일치하는 정보가 없습니다";
    }

    public Users pwdEmail(String email) {
        // 사용자를 이메일로 조회하는 로직 (생략)
        // 예: dao..findByEmail(email);
        return null; // 예제용, 실제로는 DB 조회 결과를 반환
    }
    */
    
    public List<GanttTask> getGantt(String project_id){
    	return dao.getGantt(project_id);
    }
    
    public List<Users> getTeam(String project_id){
    	return dao.getTeam(project_id);
    }
    
    public String insertProject(Project ins) {
    	return dao.insertProject(ins)>0?"생성 완료":"생성 실패";
    }
    
	
	
	
	
}