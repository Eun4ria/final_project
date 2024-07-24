package com.web.finalProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.A02_Dao;
import com.web.finalProject.vo.Users;

@Service
public class A02_Service {
	
	@Autowired(required=false)
	private A02_Dao dao;
	
	public int loginCk(Users user) {
		return dao.loginCk(user); 
	} 
	public String loginCkMsg(Users user) {
		return dao.loginCk(user)>0?"":"로그인 정보가 일치하지 않습니다"; 
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

}
