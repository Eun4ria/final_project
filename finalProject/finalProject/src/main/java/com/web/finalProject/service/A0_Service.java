package com.web.finalProject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.A0_Dao;
import com.web.finalProject.util.Util;
import com.web.finalProject.vo.Chat;
import com.web.finalProject.vo.GanttTask;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.RegMember;
import com.web.finalProject.vo.Users;

import jakarta.mail.Message.RecipientType;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Service
public class A0_Service {
	@Autowired(required=false)
	private A0_Dao dao;
	@Autowired(required=false)
	private JavaMailSender sender;

	// 회원가입
	// 등록하고 메일이 같이 발송되게
	// email 가지고 오고 사원정보(user_id) 비밀번호(password)
	// email -유효성 -> 사원정보 가지고 온거를 
//	public String insertUser(Users ins) {
//		String msg=null;
//		msg = dao.insertUser(ins)>0?"등록 성공":"등록 실패";
//		// email을 통한 사원정보가지고 오기
//		// 메일발송
//		
//		
//		
//		return msg;
//	}
	  public String insertUser(Users ins) {
	        String msg = null;

	        int result = dao.insertUser(ins);
	        if (result > 0) {
	            msg = "등록 성공";
	            sendEmail(ins.getEmail(), ins.getUser_id());
	        } else {
	            msg = "등록 실패";
	        }

	        return msg;
	    }
	 private void sendEmail(String email, String userId) {
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(email);
	        message.setSubject("HPM 회원 가입이 완료되었습니다.");
	        message.setText("귀하의 사용자 ID는 " + userId + " 입니다.");
	        sender.send(message);
	    }
// 이메일 유효성 체크
	public int emailCk(String email) {
		return dao.emailCk(email); 
	}
	
	
	
	
	
// 메일 발송
	public String makeEmpMail(RegMember email) {
		String msg ="사원 등록 및 메일 발송 성공";
		//1.메일 발송 데이터 전송을 위한 객체 생성
		MimeMessage mmsg = sender.createMimeMessage();
		
		//2. 메일 발송 객체에 요청값으로 받은 데이터 할당(MailVo==> MimeMessage)
		
		try {
			//1.제목
			mmsg.setSubject(email.getEmpno()+"입사하신 것을 환영합니다!");
			//2.수신자
			mmsg.setRecipient(RecipientType.TO, new InternetAddress(email.getEmail()));
			//3.발신자
			//4.내용
			String content = "입사하신 것을 환영합니다.\r\n"
					+ "사번은 "+email.getEmpno()+"임시비번은"+Util.mkTPwd()+"입니다.\r\n"
							+ "이 계정과 비번으로 들어오셔서 인증하고 개인번호를 수정해주세요";
					
			mmsg.setText(content);
		// 3. 발송처리
			sender.send(mmsg);
			
		}catch(MessagingException e) {
			System.out.println("메일 전송 에러:"+e.getMessage());
			msg = "기타 에러:"+e.getMessage();
		}catch(Exception e) {
			System.out.println("기타 에러:"+e.getMessage());
			msg ="기타 에러"+e.getMessage();
		}
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
	public List<Users> getmemList(Users sch){
		if(sch.getProject_id()==null) sch.setProject_id("");
		if(sch.getUser_id()==null) sch.setUser_id("");
		return dao.getMemList(sch);
	}
	public Chat chat(Chat chat) {
		return dao.chat(chat);
	}
		
		
   
    
   
    
    
	
}
