package com.web.finalProject.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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
	
////채팅 리스트-프젝에 속한 모든 팀원
	@Select("SELECT \r\n"
			+ "    u.USER_ID,\r\n"
			+ "    u.USER_NAME\r\n"
			+ "FROM \r\n"
			+ "    TEAM t\r\n"
			+ "JOIN \r\n"
			+ "    USERS u ON t.USER_ID = u.USER_ID\r\n"
			+ "WHERE \r\n"
			+ "    t.PROJECT_ID = '%'||#{project_id}||'%' \r\n")
	List<ChatSch> getmemList(ChatSch sch);
//	
////채팅 리스트-로그인 유저가 속한 팀채팅
//	@Select("SELECT \r\n"
//			+ "    c.CHATROOM_ID,\r\n"
//			+ "    c.CHATROOM_NAME,\r\n"
//			+ "    c.OWNER_ID,\r\n"
//			+ "    c.UPTDATE\r\n"
//			+ "FROM \r\n"
//			+ "    CHAT c\r\n"
//			+ "WHERE \r\n"
//			+ "    c.OWNER_ID = #{user_id}\r\n"
//			+ "   OR c.CHATMEM_ID = #{user_id}\r\n"
//			+ "ORDER BY \r\n"
//			+ "    c.UPTDATE DESC")
//	List<Chat> getchatroomList(@Param("user_id") String user_id);
	

}
