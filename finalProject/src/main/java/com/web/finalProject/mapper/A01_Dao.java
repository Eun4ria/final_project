package com.web.finalProject.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.web.finalProject.vo.Users;

@Mapper
public interface A01_Dao {
	@Select("SELECT user_id FROM USERS\r\n"
			+ "WHERE user_name=#{user_name} AND email=#{email}")
	String find_id(Users user);
	
	@Update("UPDATE USERS\r\n"
			+ "SET PASSWORD = ''\r\n"
			+ "WHERE USER_ID = 'P_0001' AND USER_NAME = '박민경' AND EMAIL = 'loverymin1213@gmail.com'")
	int tempPwd();
}
