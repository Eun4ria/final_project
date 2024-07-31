package com.web.finalProject.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.A02_Dao;
import com.web.finalProject.vo.ChatSch;
import com.web.finalProject.vo.Users;

@Service
public class A02_Service {
	
	@Autowired(required=false)
	private A02_Dao dao;
	
	
	//로그인
	public int loginCk(Users user) {
		return dao.loginCk(user); 
	} 
	public String loginCkMsg(Users user) {
		return dao.loginCk(user)>0?"로그인 성공":"로그인 정보가 일치하지 않습니다"; 
	}
	public Users login(Users user) {
		return dao.login(user);
	}
	
	
	//회원가입
	public String insertUser(Users ins) {
		String msg=null;
		msg = dao.insertUser(ins)>0?"등록 성공":"등록 실패";
		return msg;
	}
	
	// 채팅 리스트
	public List<ChatSch> getmemList(ChatSch sch){
		if(sch.getProject_id()==null) sch.setProject_id("");
		return dao.getmemList(sch);
	}

}
