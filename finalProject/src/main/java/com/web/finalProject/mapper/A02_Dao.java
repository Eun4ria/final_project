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
	@Insert("INSERT INTO users (user_id, login_id, user_name, email, password, company_id, department, role_code) \r\n"
			+ "VALUES ('MEM_'||LPAD(users_seq.NEXTVAL, 4, '0'), #{login_id}, #{user_name}, \r\n "
			+ "	#{email},#{password}, #{company_id}, #{department}, #{role_code} \r\n")
	int insertUser(Users ins);
	

}
