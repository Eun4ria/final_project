package com.web.finalProject.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.web.finalProject.vo.Users;

@Mapper
public interface A02_Dao {
	
	//로그인
	@Select("SELECT user_name FROM USERS\r\n"
			+ "WHERE user_id = #{user_id} \r\n"
			+ "AND password=#{password}")
	Users login(Users user);
	
	@Select("SELECT count(*) FROM USERS \r\n"
			+ "WHERE user_id = #{user_id} \r\n"
			+  "AND password=#{password}")
	int loginCk(Users user);
	
	//회원가입
	@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id)\r\n"
			+ "VALUES ('P_'||TO_CHAR(users_seq_ex.nextval, 'FM0000'), '김은수', 'ensu2015@gmail.com', 'rose112!!', 50, 'COM_0002') ")
	int insertUser(Users ins);
	

}
