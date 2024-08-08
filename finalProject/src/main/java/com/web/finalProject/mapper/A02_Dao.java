package com.web.finalProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.web.finalProject.vo.Chat;
import com.web.finalProject.vo.Project;
import com.web.finalProject.vo.Users;

@Mapper
public interface A02_Dao {
	//로그인
	   @Select("SELECT * FROM USERS\r\n"
	         + "WHERE user_id = #{user_id} \r\n"
	         + "AND password=#{password}")
	   Users login(Users user);
	   
	   @Select("SELECT count(*) FROM USERS \r\n"
	         + "WHERE user_id = #{user_id} \r\n"
	         +  "AND password=#{password}")
	   int loginCk(Users user);
	//회원가입
//	@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id, role_code)\r\n"
//			+ "VALUES (#{role_code}||'_'||TO_CHAR(users_seq_ex.nextval, 'FM0000'), #{user_name}, #{email}, #{password}, #{deptno}, #{company_id}, #{role_code})")
//	int insertUser(Users ins);
//	
//@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id, role_code) " +
//        "VALUES ('P_'||TO_CHAR(users_seq_ex.nextval, 'FM0000'), '김은수', 'ensu2015@gmail.com', 'rose112!!', '0', 'COM_0000', 'P') " )
//@SelectKey(statement = "SELECT 'P_'||TO_CHAR(users_seq_ex.currval, 'FM0000') FROM dual", keyProperty = "user_id", before = false, resultType = String.class)
//int insertUser(Users ins);
@Insert("INSERT INTO users (user_id, user_name, email, password, deptno, company_id, role_code) \r\n"
		+ "VALUES (#{user_id}, #{user_name}, #{email}, #{password}, #{deptno}, #{company_id}, #{role_code})")
@SelectKey(statement = "SELECT #{role_code}||'_'||TO_CHAR(users_seq_ex.nextval, 'FM0000') FROM dual", keyProperty = "user_id", before = true, resultType = String.class)
int insertUser(Users ins);

//이메일 유효성 확인
	@Select("SELECT count(*) FROM USERS \r\n"
			+ "WHERE email = #{email}")
	int emailCk(String email);
	
// 프로젝트 리스트
	@Select("SELECT p.*,\r\n"
			+ "	t.*,\r\n"
			+ "	b.AMOUNT ,\r\n"
			+ "	u.image\r\n"
			+ "FROM\r\n"
			+ "    project p \r\n"
			+ "JOIN team t ON p.project_id = t.project_id\r\n"
			+ "JOIN users u ON p.company_id=u.company_id\r\n"
			+ "JOIN BUDGET b ON p.project_id=b.project_id\r\n"
			+ "WHERE\r\n"
			+ "    t.user_id = #{user_id}")
	List<Project> getProjectList(@Param("user_id") String user_id);	
	
//채팅 리스트-프젝에 속한 모든 팀원
	@Select("SELECT *\r\n"
			+ "FROM users u\r\n"
			+ "JOIN team t ON u.USER_ID = t.USER_ID\r\n"
			+ "WHERE t.project_id = #{project_id} \r\n"
			+ "AND u.user_id != #{user_id}")
	List<Users> getMemList(Users sch);
	
	@Insert("INSERT INTO chat (\r\n"
			+ "    chatroom_id, chatroom_name, owner_id, user_id, ban_status, BAN_DATE, UPTDATE, project_id\r\n"
			+ ")\r\n"
			+ "SELECT\r\n"
			+ "    'CHT_' || TO_CHAR(chat_seq.nextval, 'FM0000'),\r\n"
			+ "    'M_0003',\r\n"
			+ "    'N_0047',\r\n"
			+ "    'M_0003',\r\n"
			+ "    'N',\r\n"
			+ "    NULL,\r\n"
			+ "    NULL,\r\n"
			+ "    'PRO_0001'\r\n"
			+ "FROM dual\r\n"
			+ "WHERE NOT EXISTS (\r\n"
			+ "    SELECT 1\r\n"
			+ "    FROM chat\r\n"
			+ "    WHERE owner_id = #{owner_id}\r\n"
			+ "      AND user_id = #{user_id}\r\n"
			+ ")")
	@Options(useGeneratedKeys = true, keyProperty = "chatroom_id", keyColumn = "chatroom_id")
	int insertchatroom(Chat ins);
	
	
	
	
	@Select("SELECT * FROM Chat\r\n"
			+ "WHERE user_id = #{user_id} \r\n"
			+ "AND project_id=#{project_id}")
	Chat chat(Chat chat);
}
