package com.web.finalProject.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.web.finalProject.vo.Users;

@Mapper
public interface A01_Dao {
	@Select("SELECT login_id FROM USERS\r\n"
			+ "WHERE user_name=#{user_name} AND email=#{email}")
	String find_id(Users user);
}
