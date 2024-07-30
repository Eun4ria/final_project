package com.web.finalProject.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.web.finalProject.vo.ChatSch;
import com.web.finalProject.vo.Users;

@Mapper
public interface A02_Dao {
	
//로그인
	@Select("SELECT user_name, role_code FROM USERS\r\n"
			+ "WHERE user_id = #{user_id} \r\n"
			+ "AND password=#{password}")
	Users login(Users user);
	
	@Select("SELECT count(*) FROM USERS \r\n"
			+ "WHERE user_id = #{user_id} \r\n"
			+  "AND password=#{password}")
	int loginCk(Users user);
	
//회원가입
	@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id, role_code)\r\n"
			+ "VALUES (#{role_code}||'_'||TO_CHAR(users_seq_ex.nextval, 'FM0000'), #{user_name}, #{email}, #{password}, #{deptno}, #{company_id}, #{role_code}) ")
	int insertUser(Users ins);
	
//채팅 리스트 
	@Select("SELECT count(*) FROM CHAT \r\n"
			+ "WHERE OWNER_ID =#{user_id}")
	int getChatCount(ChatSch sch);
	
	@Select("")
	List<ChatSch> getChatList(ChatSch sch);
	

}
