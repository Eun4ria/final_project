package com.web.finalProject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalProject.mapper.A01_Dao;
import com.web.finalProject.vo.Users;

@Service
public class A01_Service {
	@Autowired(required=false)
	private A01_Dao dao;
	
	public String find_id(Users user) {
		String id = dao.find_id(user);
		
		return id==null?"해당 계정 정보 없습니다.":"해당 계정의 아이디:"+id;
	}
	
}
