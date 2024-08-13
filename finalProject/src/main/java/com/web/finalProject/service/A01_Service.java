package com.web.finalProject.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.A01_Dao;
import com.web.finalProject.util.Util;
import com.web.finalProject.vo.Calendar;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.Users;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;

@Service
public class A01_Service {
	@Autowired(required=false)
	private A01_Dao dao;
	
	public String find_id(Users user) {
		String id = dao.find_id(user);		
		return id==null?"해당 계정 정보 없습니다":id;
	}
	
	
    
    public List<GanttTask> getGantt(String project_id){
    	return dao.getGantt(project_id);
    }
    public List<Users> getTeam(String project_id){
    	return dao.getTeam(project_id);
    }
    public String insertGantt(GanttTask ins) {
    	return dao.insertGantt(ins)>0?"생성 완료":"생성 실패";
    }
    public String updateGantt(GanttTask upt) {
    	return dao.updateGantt(upt)>0?"수정 완료":"수정 실패";
    }
    public String deleteGantt(String task_id) {
    	return dao.deleteGantt(task_id)>0?"삭제 완료":"삭제 실패";
    }
    
    
    
    public String insertProject(Project ins) {
    	return dao.insertProject(ins)>0?"생성 완료":"생성 실패";
    }
    public List<Users> getUsers(){
		return dao.getUsers();
	}
    
    public List<Project> getProjectList(String user_id){
    	return dao.getProjectList(user_id);
    }
    public List<Project> getComProjectList(String user_id){
    	return dao.getComProjectList(user_id);
    }
    
    
    
    public String find_pwd(Users user) {
		return dao.find_pwd(user)>0?"":"해당 계정 정보 없습니다";
	}
    
    public int updateTempPwd(String tempPwd,String user_id) {
    	return dao.updateTempPwd(tempPwd, user_id);
    }
    
    // 임시 비밀번호 메일 발송
    @Autowired(required = false)
	private JavaMailSender sender;

	public String makeTempPwd(Users user) {
		String msg = "임시 비밀번호 메일 발송 성공 \\n"
				+ "이메일을 확인하세요";
		// 1. 메일 발송 데이터 전송을 위한 객체 생성
		MimeMessage mmsg = sender.createMimeMessage();
		try {
			String tempPwd = Util.mkTPwd();
			System.out.println("생성된 임시 비밀번호"+tempPwd);			
			mmsg.setSubject("<HPM> "+user.getUser_name()+"님의 임시 비밀번호입니다.");
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
			String content = user.getUser_name()+"님의 임시 비밀번호는 "+tempPwd+" 입니다.\r\n"
					+ "빠른 시일 내 비밀번호를 변경해주세요 \r\n"
					+ "**비밀번호 권장 변경 주기는 3개월 입니다.**";
			mmsg.setText(content);
			
			// 임시비밀번호 DB업데이트
			int updateCount = dao.updateTempPwd(tempPwd, user.getUser_id());
	        if (updateCount <= 0) {
	            // 업데이트 실패 시
	            msg = "임시 비밀번호 업데이트 실패";
	        }
	        
			sender.send(mmsg);
		} catch (MessagingException e) {
			System.out.println("메일 전송 에러:"+e.getMessage());
			msg = "메일 전송 에러:"+e.getMessage();
		} catch(Exception e) {
			System.out.println("기타 에러:"+e.getMessage());
			msg = "기타 에러:"+e.getMessage();
		}
		return msg;
	}
    
	
	// 캘린더
	public List<Calendar> getCalendarList(String project_id){
		return dao.getCalendarList(project_id);
	}
	
	
	
	// 프로필
	public Users getProfile(String id) {
		return dao.getProfile(id);
	}
	public String updateProfile(Users upt) {
		return dao.updateProfile(upt)>0?"수정 성공":"수정 실패";
	}
	public int checkOldPwd(Users cpw) {
		return dao.checkOldPwd(cpw);
	}
	public String changePassword(Users cpw) {
		return dao.changePassword(cpw)>0?"수정 성공":"수정 실패";
	}
	
	
	
	
}